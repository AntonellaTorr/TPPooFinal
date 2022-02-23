"
TPO
"
Class {
	#name : #EmpresaSolicitante,
	#superclass : #Object,
	#instVars : [
		'colSolicitudes',
		'empresa',
		'cantSolicitudesResueltas'
	],
	#category : #FAI2991
}

{ #category : #constructor }
EmpresaSolicitante class >> crearUnaEmpresa:unaEmpresa [
|unaEmpresaS|
unaEmpresaS := self new. 
unaEmpresaS inicializarCon:unaEmpresa.
^unaEmpresaS
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> actualizarCantSolicitudesResueltas [
cantSolicitudesResueltas := cantSolicitudesResueltas +1.
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> buscarSolicitudesPendientes [
^colSolicitudes select: [:solicitud| solicitud estaPendiente] 
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> crearYAnadirSolicitudConId: unID fechaValidez: fechaVal caracteristicas:car [
|nuevaS|
nuevaS:= DeTrabajo crearConId: unID fechaVal:fechaVal  caracteristicas: car.
colSolicitudes add: nuevaS. 
^nuevaS.



]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> crearYAnadirSolicitudConId: unID fechaValidez: fechaVal caracteristicas:car tipo:tip monto:m [
|nuevaS|
nuevaS:= (DeServicio crearConId: unID fechaVal:fechaVal  caracteristicas: car tipo:tip monto:m).
colSolicitudes add: nuevaS. 
^nuevaS.
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> crearYAnadirSolicitudConId: unID fechaValidez: fechaVal caracteristicas:car tipo:tip monto:m producto:prod [
|nuevaS|
nuevaS:=(YProducto  crearConId: unID fechaVal:fechaVal  caracteristicas: car tipo:tip monto:m  producto:prod ).
colSolicitudes add: nuevaS. 
^nuevaS.

]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> esEmpresaBuscada:nombre [ 
^[nombre = (empresa getNombre)]
 

]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> getCantSolicitudesResueltas [
^cantSolicitudesResueltas.
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> getColSolicitudes [
^colSolicitudes 
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> getEmpresa [
^empresa.
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> inicializarCon: unaEmpresa [ 
colSolicitudes := OrderedCollection new.
empresa:=unaEmpresa. 
cantSolicitudesResueltas :=0.
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> tieneSolConId:id [
^colSolicitudes anySatisfy: [ :solicitud|solicitud getId=id ]
]

{ #category : #printing }
EmpresaSolicitante >> toString [ 
^'Empresa: ', (empresa toString), String cr, 'colSolicitudes: ' ,colSolicitudes asString,String cr, 'cantSolicitudes resueltas ',cantSolicitudesResueltas asString . 
]
