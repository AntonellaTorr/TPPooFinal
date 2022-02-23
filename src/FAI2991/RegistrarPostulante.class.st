Class {
	#name : #RegistrarPostulante,
	#superclass : #Ventana,
	#instVars : [
		'postulantePersona',
		'postulanteEmpresa',
		'postulanteEmpresaCombinada',
		'nombre',
		'DNI',
		'listadoPostulantes',
		'tipo',
		'rango',
		'rubro1',
		'rubro2',
		'rubro3',
		'rubro4',
		'producto1',
		'producto2',
		'producto3',
		'guardadoPersona',
		'guardadoEmpresa',
		'guardadoEmpresaC',
		'tituloRub'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
RegistrarPostulante >> crearComponentes [
| espacioDerecha titulo1 colR  colR2 colR3 colP| 
	postulantePersona := Boton nombre: 'Postulante Persona' tamanio: 200 @ 30.
	postulanteEmpresa := Boton nombre: 'Postulante Empresa' tamanio: 200 @ 30.
	postulanteEmpresaCombinada  := Boton nombre: 'Postulante Empresa Combinada' tamanio: 200 @ 30.
	rubro1         := CheckboxMorph new.
	rubro2         := CheckboxMorph new.
	rubro3         := CheckboxMorph new.
	rubro4         := CheckboxMorph new.
	producto1     := CheckboxMorph new.
	producto2     := CheckboxMorph new.
	producto3     := CheckboxMorph new.
	listadoPostulantes := RubScrolledTextMorph new.
	tipo := SearchMorph new.
	rango := SearchMorph new.
	nombre :=RubTextFieldMorph new.
	DNI:=RubTextFieldMorph new. 
	"rango := RubTextFieldMorph new." 
	guardadoPersona:= Boton nombre: 'Registrar persona' tamanio: 200 @ 30.
	guardadoEmpresa:= Boton nombre: 'Registrar Empresa' tamanio: 200 @ 30. 
	guardadoEmpresaC:= Boton nombre: 'Registrar Empresa Combinada' tamanio: 200 @ 30.

	
    espacioDerecha:= self left + 100.

	postulantePersona  left: self left + 150; top:150.	
	postulanteEmpresa  left: self left + 400; top:150. 
	postulanteEmpresaCombinada  left: self left + 650; top:150.

	
	
	guardadoPersona  left: self left + 150 ;top:400.
	guardadoEmpresa left: self left + 150; top:400.
	guardadoEmpresaC left: self left + 100; top:400.
	
	listadoPostulantes  beReadOnly; extent: 300 @ 500; left: self left + 500; top: 60.
	
	 nombre extent: 400 @ 90; left: espacioDerecha ; top:  60; ghostText: 'Ingrese el nombre'; borderStyle: (BottomBorder new width: 2); color: (Color black).
 	DNI extent: 400 @ 90; left: espacioDerecha ; top:  200; ghostText: 'Ingrese el DNI sin puntos'; borderStyle: 	(BottomBorder new width: 2); color: (Color black).
			
	
    tituloRub := Titulo crearConTitulo: 'Selecione el rubro/incumbencias' tam:  11.
	 tituloRub top: 100; left: espacioDerecha; color: Color white .	
	
    rubro1 label: 'Ropa'; extent: 100 @ 20; left: espacioDerecha ; top: nombre bottom + 50.
    rubro2 label: 'Limpieza'; extent: 100 @ 20; left: espacioDerecha + 100; top: nombre bottom + 50.
    rubro3 label: 'Mecanica'; extent: 100 @ 20; left: espacioDerecha ; top: nombre bottom + 90.
    rubro4 label: 'Construccion'; extent: 100 @ 20; left: espacioDerecha + 100; top: nombre bottom + 90.	
	
	 producto1 label: 'Conteiner'; extent: 100 @ 20; left: espacioDerecha  ; top: rubro2 bottom + 150.
    producto2 label: 'Cartel'; extent: 100 @ 20; left: espacioDerecha + 100; top: rubro2 bottom + 150.
    producto3 label: 'Ladrillos'; extent: 100 @ 20; left: espacioDerecha  ; top:  rubro2 bottom + 200.
	 tipo content: 'Actividades Uniformes'.
	 tipo content: 'Actividades Puntuales'.
	 tipo content: 'Combinadas'.
	   
	 titulo1:= Titulo crearConTitulo: 'Seleccione el tipo de empresa' tam: 11.
	 espacioDerecha:= self left + 100.
	 titulo1 top: 30; left: espacioDerecha; color: Color white. 
	 tipo extent: 200 @ 20; left: espacioDerecha ; top: 250.
	
	 rango content: '100'.
	 rango content: '150'.
	 rango content: '200'.
	 rango content: '250'.	
	 rango content: '300'. 
	 rango extent: 200 @ 20; left: espacioDerecha ; top: 200.
	

	   UnGestor addDependent: self.

	self 
	addMorph: tituloRub;	
	addMorph: postulantePersona;
	addMorph: postulanteEmpresa;
	addMorph: postulanteEmpresaCombinada ;
	addMorph: nombre; 
	addMorph: DNI; 
	addMorph: listadoPostulantes ; 
	addMorph: guardadoPersona ; 
	addMorph: guardadoEmpresa ; 
	addMorph: guardadoEmpresaC ; 
	addMorph: tipo; 
	addMorph: rango; 
	addMorph: rubro1;
	addMorph: rubro2;
	addMorph: rubro3;
   addMorph: rubro4;
	addMorph: producto1;
	addMorph: producto2;
	addMorph: producto3.
	
  	self iniciar.	

    UnGestor addDependent: self.	

	postulantePersona  mouseAction: [  self mostrarFormularioP ].
	postulanteEmpresa  mouseAction: [  self mostrarFormularioE].
	postulanteEmpresaCombinada  mouseAction: [  self mostrarFormularioEC ].
		
		
	guardadoPersona   mouseAction: [ 	
				colR:= OrderedCollection new.
				(rubro1 buttonMorph selected) ifTrue: [ colR add:  rubro1 label ].	
				(rubro2 buttonMorph selected) ifTrue: [ colR add: rubro2 label ].
				(rubro3 buttonMorph selected)	ifTrue: [ colR add: rubro3 label ].
				(rubro4 buttonMorph selected)	ifTrue: [ colR add: rubro4 label ].					
				UnGestor registrarPostulante: colR nombre: nombre text asString DNI:DNI text asString	 .  
				self update: UnGestor getColPostulantes.
			].
	guardadoEmpresa  mouseAction: [  
				colR2:= OrderedCollection new.
				(rubro1 buttonMorph selected) ifTrue: [ colR2 add:  rubro1 label ].	
				(rubro2 buttonMorph selected) ifTrue: [ colR2 add: rubro2 label ].
				(rubro3 buttonMorph selected)	ifTrue: [ colR2 add: rubro3 label ].
				(rubro4 buttonMorph selected)	ifTrue: [ colR2 add: rubro4 label ].		
				UnGestor registrarPostulante: colR2 nombre: nombre text asString tipo: tipo selectedItem rango: rango selectedItem.  self update: UnGestor getColPostulantes.].
	
	guardadoEmpresaC  mouseAction: [
					colR3:= OrderedCollection new.
					(rubro1 buttonMorph selected) ifTrue: [ colR3 add:  rubro1 label ].	
					(rubro2 buttonMorph selected) ifTrue: [ colR3 add: rubro2 label ].
					(rubro3 buttonMorph selected)	ifTrue: [ colR3 add: rubro3 label ].
					(rubro4 buttonMorph selected)	ifTrue: [ colR3 add: rubro4 label ].		
						
					 colP:= OrderedCollection new.
					(producto1) buttonMorph selected ifTrue: [ colP add: producto1 label ].
					(producto2) buttonMorph selected ifTrue: [ colP add: producto2 label ].
               (producto3) buttonMorph selected  ifTrue: [ colP add: producto3 label ] .
		 UnGestor registrarPostulante:  colR3 nombre: nombre text asString tipo: tipo selectedItem rango: rango selectedItem  colProductos:colP.
	 self update: UnGestor getColPostulantes.].

		
		
]

{ #category : #'as yet unclassified' }
RegistrarPostulante >> iniciar [
postulantePersona show.
postulanteEmpresa show.
postulanteEmpresaCombinada show.
tituloRub hide. 
 nombre hide.
 DNI hide.  
listadoPostulantes hide. 
tipo hide.
rango hide. 
rubro1  hide. 
rubro2 hide. 
rubro3 hide. 
rubro4 hide.
producto1 hide. 
producto2 hide.
producto3 hide.
guardadoPersona hide.
guardadoEmpresa hide.
guardadoEmpresaC hide.
]

{ #category : #initialization }
RegistrarPostulante >> initialize [ 
super initialize.
self crearComponentes.


]

{ #category : #'as yet unclassified' }
RegistrarPostulante >> mostrarFormularioE [
	postulantePersona hide.
	postulanteEmpresa hide.
	postulanteEmpresaCombinada hide.
	nombre show.
	DNI  hide. 
	listadoPostulantes show.
 	tipo show. 
	rango show.
 	rubro1 show.
	rubro2 show.
 	rubro3 show.
	rubro4  show.
	producto1 hide.
	producto2 hide.
	producto3 hide.
	guardadoPersona hide.
	guardadoEmpresa show.
	guardadoEmpresaC hide. 
]

{ #category : #'as yet unclassified' }
RegistrarPostulante >> mostrarFormularioEC [
	postulantePersona hide.
	postulanteEmpresa hide.
	postulanteEmpresaCombinada hide.
	nombre show.
	DNI  hide. 
	listadoPostulantes show.
 	tipo show. 
	rango show.
 	rubro1 show.
	rubro2 show.
 	rubro3 show.
	rubro4  show.
	producto1 show.
	producto2 show.
	producto3 show.
	guardadoPersona hide.
	guardadoEmpresa hide.
	guardadoEmpresaC show. 
]

{ #category : #'as yet unclassified' }
RegistrarPostulante >> mostrarFormularioP [
	postulantePersona hide.
	postulanteEmpresa hide.
	postulanteEmpresaCombinada hide.
	nombre show.
	DNI  show. 
	tituloRub show.
	listadoPostulantes show.
 	tipo hide. 
	rango hide.
 	rubro1 show.
	rubro2 show.
 	rubro3 show.
	rubro4  show.
	producto1 hide .
	producto2 hide.
	producto3 hide.
	guardadoPersona show .
	guardadoEmpresa hide.
	guardadoEmpresaC hide. 

]

{ #category : #'as yet unclassified' }
RegistrarPostulante >> registrarPostulantes [
|colR  colR2 colR3 colP|
	postulantePersona  mouseAction: [  self mostrarFormularioP ].
	postulanteEmpresa  mouseAction: [  self mostrarFormularioE].
	postulanteEmpresaCombinada  mouseAction: [  self mostrarFormularioEC ].
		
		
	guardadoPersona   mouseAction: [ 	
				colR:= OrderedCollection new.
				(rubro1 buttonMorph selected) ifTrue: [ colR add:  rubro1 label ].	
				(rubro2 buttonMorph selected) ifTrue: [ colR add: rubro2 label ].
				(rubro3 buttonMorph selected)	ifTrue: [ colR add: rubro3 label ].
				(rubro4 buttonMorph selected)	ifTrue: [ colR add: rubro4 label ].					
				UnGestor registrarPostulante: colR nombre: nombre text asString DNI:DNI text asString	 .  
				self update: UnGestor getColPostulantes.
			].
	guardadoEmpresa  mouseAction: [  
				colR2:= OrderedCollection new.
				(rubro1 buttonMorph selected) ifTrue: [ colR2 add:  rubro1 label ].	
				(rubro2 buttonMorph selected) ifTrue: [ colR2 add: rubro2 label ].
				(rubro3 buttonMorph selected)	ifTrue: [ colR2 add: rubro3 label ].
				(rubro4 buttonMorph selected)	ifTrue: [ colR2 add: rubro4 label ].		
				UnGestor registrarPostulante: colR2 nombre: nombre text asString tipo: tipo selectedItem rango: rango.  self update: UnGestor getColPostulantes.].
	
	guardadoEmpresaC  mouseAction: [
					colR3:= OrderedCollection new.
					(rubro1 buttonMorph selected) ifTrue: [ colR3 add:  rubro1 label ].	
					(rubro2 buttonMorph selected) ifTrue: [ colR3 add: rubro2 label ].
					(rubro3 buttonMorph selected)	ifTrue: [ colR3 add: rubro3 label ].
					(rubro4 buttonMorph selected)	ifTrue: [ colR3 add: rubro4 label ].		
						
					 colP:= OrderedCollection new.
					(producto1) buttonMorph selected ifTrue: [ colP add: producto1 label ].
					(producto2) buttonMorph selected ifTrue: [ colP add: producto2 label ].
               (producto3) buttonMorph selected  ifTrue: [ colP add: producto3 label ] .
		 UnGestor registrarPostulante:  colR3 nombre: nombre text asString tipo: tipo selectedItem rango: rango  colProductos:colP.
	 self update: UnGestor getColPostulantes.].
]

{ #category : #'as yet unclassified' }
RegistrarPostulante >> update:colPostulantes [
	colPostulantes
		ifEmpty: [ listadoPostulantes  setText: 'Listado Postulantes' ]
		ifNotEmpty: [ listadoPostulantes setText: (UnGestor  colAString: colPostulantes ) ]. 

]
