"
TPO
"
Class {
	#name : #GestorDeEmpleos,
	#superclass : #Object,
	#instVars : [
		'colPropuestas',
		'colPostulantes',
		'colEmpresasSolicitantes',
		'colSolicitudesSinResolver',
		'colSolicitudesResueltas',
		'colSolicitudesVencidas'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
GestorDeEmpleos class >> crear [
|nuevoGestor|
nuevoGestor := self new. 
nuevoGestor  inicializar. 
Persona maximoPorPersona: 1000.
Empresa valorPorPunto: 10. 
^nuevoGestor 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> aceptarPropuesta:idSol nombrePos:nombre [
|prop sol|

prop:=self buscarPropuesta:idSol nombrePos: nombre. 
(prop isNotNil) 
ifTrue:[sol:=prop getSolicitud.
self eliminarPostulaciones: sol.
prop setEstado:'resuelta'.
sol setEstado: 'resuelta'.
self actualizarInfoEmpresaSol: idSol.
colSolicitudesResueltas add: sol.
colSolicitudesSinResolver remove: sol.
].

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> actualizarInfoEmpresaSol:id [
|empresaBuscada|
empresaBuscada:=colEmpresasSolicitantes detect:[:empresa| empresa tieneSolConId:id] ifNone: [ nil. ].
empresaBuscada ifNotNil: [ empresaBuscada actualizarCantSolicitudesResueltas ].

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> buscarEmpresa:nombreEmpresa [
|res|
(colPostulantes isNotNil) ifTrue:[
 res:= colPostulantes  detect: [ : emp| emp esEmpresaBuscada:nombreEmpresa]
ifNone: [ res:=nil ].].
^res.

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> buscarEmpresaSolicitante:nombreEmpresa [
|res|
 res:= colEmpresasSolicitantes detect: [ : emp| emp getEmpresa esEmpresaBuscada:nombreEmpresa]
ifNone: [ res:=nil ].
^res.
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> buscarPropuesta:idSol nombrePos: nombre [
|res|
Transcript show: 'idSol buscada ',idSol. 
Transcript show: 'nombre buscado ',nombre. 
"colPropuestas do:[: prop| Transcript show: ((((prop getSolicitud) getId)= idSol)  & (((prop getPostulante)getNombre)=nombre)) asString ]".
res:= colPropuestas detect:[: prop| (((prop getSolicitud) getId)= idSol)  & (((prop getPostulante)getNombre)=nombre) ] ifNone:[res:=nil].
Transcript show: 'Resultado'.
^res.
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> buscarPropuestasConId:id [
|colP|
(colPropuestas  isNotNil) 
ifTrue:[
	colP:=colPropuestas select:[:prop| ((prop getSolicitud) getId) = id]] 
ifFalse:[ colP:= OrderedCollection new. colP add: 'VACIA'.].
^colP.
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> colAString: col [
| cadena |
    cadena := ''.
    col do: [ :s |cadena := cadena ,s toString , String cr ].
    ^ cadena 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> controlFraude:pos solicitud:sol [ 
|empresaBuscada  tieneFraude  |
tieneFraude:=false. 
(colEmpresasSolicitantes  isNotNil) ifTrue:[
empresaBuscada:= colEmpresasSolicitantes detect:[:empresaSol| ((empresaSol getEmpresa)= pos)] ifNone:[].
(empresaBuscada isNotNil) ifTrue: [tieneFraude:= ((empresaBuscada getColSolicitudes) includes:sol)]].
^tieneFraude

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> crearEmpresaSegunCorresponda:nombreEmpresa rubro: inc tipo:tipo rango: ran productos:colP [
|empresa|

(colP isEmpty) 
	ifTrue: [ empresa:= (Empresa crearCon: inc nombre: nombreEmpresa tipo:  tipo rango: ran) ]
	ifFalse: [empresa:=EmpresaCombinada  crearCon: inc nombre: nombreEmpresa tipo:tipo  rango: ran  colProductos: colP] .
	^empresa.
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> eliminarPostulaciones:sol [
|nuevaCol|
(colPropuestas isNotNil) 
ifTrue:[
nuevaCol:=colPropuestas reject: [ :prop| prop esPropuestaBuscada:sol ].
colPropuestas := nuevaCol.]

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> encontrarPostulantes: sol [
 | colPos |
    colPos := OrderedCollection new.
    colPostulantes ifNotNil: [ 
	colPos:= colPostulantes select: [ :pos | (sol cumpleRequisitos: pos)] ].
    ^ colPos
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> existePostulante:nombreP [
^colPostulantes anySatisfy: [ :postulante| postulante esPostulanteBuscado: nombreP ].
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> existePropuesta: sol postulante:postulante [
^colPropuestas  anySatisfy: [ :prop|((prop getSolicitud)=sol) & ((prop getPostulante)= postulante) ]
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> existeSolicitud:id [
^colSolicitudesSinResolver anySatisfy: [:sol| (sol getId=id)]. 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> generarListadoEmpresasOrdenadas [
colEmpresasSolicitantes sorted: [ :a :b| a getCantSolicitudesResueltas  > b getCantSolicitudesResueltas ].
colEmpresasSolicitantes changed. 
^colEmpresasSolicitantes 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> generarListadoSolFecha:fechaBuscada [
|res|
res:=colSolicitudesSinResolver select: [:solicitud| solicitud cumpleCondiciones:fechaBuscada].
res changed.
^ res
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> generarListadoSolPendientes:nombreEmpresa [
| empresaBuscada listado|
empresaBuscada:= colEmpresasSolicitantes  detect:[:empresaSol| (empresaSol getEmpresa )esEmpresaBuscada:nombreEmpresa].
(empresaBuscada isNotNil)
ifTrue:[listado:= (empresaBuscada buscarSolicitudesPendientes)].
listado changed.
^listado.
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> generarListadoSolResueltas [
colSolicitudesResueltas changed.
^colSolicitudesResueltas 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> generarPropuestasSolicitudesPendientes [
	colSolicitudesSinResolver ifNotNil: [ 
		| colPosiblesPos  |
		colPosiblesPos:= OrderedCollection new.
		colSolicitudesSinResolver do: [ :soli | 
			colPosiblesPos := self encontrarPostulantes:soli.
			self realizarPropuesta: soli posiblesPos: colPosiblesPos ] ]



]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> getColEmpresasSolicitantes [
^colEmpresasSolicitantes 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> getColPostulantes [
^colPostulantes 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> getColPropuestas [
^colPropuestas 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> getColSolicitudes [
^colSolicitudesSinResolver.
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> inicializar [
colPropuestas:= OrderedCollection new. 
colPostulantes := OrderedCollection new. 
colEmpresasSolicitantes := OrderedCollection new. 
colSolicitudesSinResolver:= OrderedCollection new. 
 colSolicitudesResueltas:= OrderedCollection new. 
colSolicitudesVencidas := OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> iniciarDia [
|nuevaCol |
nuevaCol:= colSolicitudesSinResolver  reject: [:solResuelta| solResuelta estaVencida ].
 colSolicitudesSinResolver  do: [:solResuelta| (solResuelta estaVencida) ifTrue:[ colSolicitudesVencidas add: solResuelta ]].
colSolicitudesSinResolver  := nuevaCol. 

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> realizarPropuesta:sol posiblesPos:colPos [
|nuevaP|

(colPos isNotNil) ifTrue: [ 
	colPos do:[:postulante| (self  existePropuesta:sol postulante:postulante)
		ifFalse:[
		nuevaP:=(Propuesta crearCon:sol postulante:postulante).
		(self controlFraude:postulante solicitud:sol)
		ifFalse: [colPropuestas add:nuevaP].
		colPropuestas changed.
		]
		]. 
	]

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> registrarEmpresasSolicitantes: nombreEmpresa rubro: inc tipo:tipo rango: ran productos:colP [
|res empresaBuscada nuevaEmp|
"Verifica existencia previa de la empresa"
res:= (self buscarEmpresa:nombreEmpresa).

(res isNotNil) 
"Si la empresa existe la almacena y sino la crea"
ifTrue: [  empresaBuscada := res]
ifFalse:[empresaBuscada :=	self crearEmpresaSegunCorresponda: nombreEmpresa rubro: inc tipo:tipo rango: ran productos:colP. 
		colPostulantes  add: empresaBuscada].
"Crea empresa solicitante"
	nuevaEmp:= EmpresaSolicitante crearUnaEmpresa: empresaBuscada.
	colEmpresasSolicitantes add: nuevaEmp. 
	colEmpresasSolicitantes changed.

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> registrarPostulante: incumb nombre:nombreP DNI:dni [ 
|res nuevoP|
res:= self existePostulante: nombreP. 
(res = false) ifTrue:[ nuevoP := (Persona crear:incumb nombre:nombreP DNI:dni).
	colPostulantes add:nuevoP.
  colPostulantes changed.  ]. 

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> registrarPostulante: incumb nombre:nombreP tipo:tip rango:ran [ 
|res nuevoP|
res:= self existePostulante: nombreP. 
(res = false) ifTrue:[ nuevoP := (Empresa crearCon:incumb nombre:nombreP tipo:tip rango:ran ).
	colPostulantes add:nuevoP.
colPostulantes  changed.]. 

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> registrarPostulante: incumb nombre:nombreP tipo:tip rango:ran colProductos:prod [
|res nuevoP|
res:= self existePostulante: nombreP. 
(res = false) ifTrue:[ nuevoP := (EmpresaCombinada crearCon:incumb nombre:nombreP tipo:tip rango:ran colProductos:prod ).
	colPostulantes add:nuevoP.
colPostulantes changed. ]. 

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> registrarSolicitud:unId caracteristicas: car unNombre:nombreEmpresa fechaValidez:fechaVal [
|res empresaBuscada solPendiente|
(self existeSolicitud:unId) ifFalse: [ 
res:= (self buscarEmpresaSolicitante: nombreEmpresa). 
(res isNotNil )
ifTrue: [ (empresaBuscada:= res).
	    solPendiente:= empresaBuscada  crearYAnadirSolicitudConId: unId fechaValidez: fechaVal caracteristicas:car.
	colSolicitudesSinResolver add: solPendiente .
	 ].
colSolicitudesSinResolver changed]. 



]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> registrarSolicitud: id caracteristicas:car unNombre: nombreEmpresa fechaValidez: fechaVal tipo:tip monto:m [
|res empresaBuscada solPendiente| 
(self existeSolicitud:id) ifFalse: [ 
res:= (self buscarEmpresaSolicitante: nombreEmpresa). 
(res isNotNil)
ifTrue: [ (empresaBuscada:= res).
	   solPendiente := (empresaBuscada crearYAnadirSolicitudConId: id fechaValidez: fechaVal caracteristicas:car tipo:tip monto:m).
	colSolicitudesSinResolver add: solPendiente.
	 ].

colSolicitudesSinResolver changed]. 
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> registrarSolicitud: unID caracteristicas:car unNombre: nombreEmpresa fechaValidez: fechaVal  tipo:tip monto:m producto:prod [ 
|res empresaBuscada solPendiente | 
(self existeSolicitud:unID) ifFalse: [ 
res:= (self buscarEmpresaSolicitante: nombreEmpresa). 
(res isNotNil )
ifTrue: [ 
	(empresaBuscada:= res).
	    (self verificarRepetidos: unID) 
	ifFalse: [solPendiente:= (empresaBuscada crearYAnadirSolicitudConId: unID fechaValidez: fechaVal caracteristicas:car tipo:tip monto:m producto:prod).
	colSolicitudesSinResolver add: solPendiente ].
	 ].
colSolicitudesSinResolver changed].
]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> revalidarSolicitud: id nuevaFecha:fecha [
|sol|
sol:=colSolicitudesVencidas detect: [:solicitud|(solicitud getId)=id] ifNone: [ ]. 
sol revalidar: fecha.
colSolicitudesVencidas remove:sol.
colSolicitudesSinResolver add:sol.
]

{ #category : #printing }
GestorDeEmpleos >> toString [ 
colEmpresasSolicitantes toString.
colPostulantes  toString.
colPropuestas  toString.
colSolicitudesResueltas  toString.
colSolicitudesSinResolver toString.

]

{ #category : #'as yet unclassified' }
GestorDeEmpleos >> verificarRepetidos:id [
^ colSolicitudesSinResolver anySatisfy: [ :sol| (sol getId =id) ]
]
