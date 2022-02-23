"
TPO
"
Class {
	#name : #YProducto,
	#superclass : #DeServicio,
	#instVars : [
		'producto'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
YProducto class >> crearConId: unID fechaVal:unaFechaValidez caracteristicas: car tipo:tip monto:m  producto:prod [ 
|unaS|
unaS:= self new.
unaS inicializarConId: unID fechaVal:unaFechaValidez caracteristicas: car tipo:tip monto:m  producto: prod. 
^unaS.
]

{ #category : #'as yet unclassified' }
YProducto >> cumpleRequisitos: pos [ 
|cumple|
cumple:= false. 
(pos esEmpresaCombinada ) ifTrue: [  
(pos verificarDescripcion: caracteristicas)
	 
	ifTrue: [ 
		(pos existeProducto: producto) 
		ifTrue:[ cumple:=(pos verificarRango: monto)] .
		]
	].
^cumple.
]

{ #category : #'as yet unclassified' }
YProducto >> inicializarConId: unID fechaVal:unaFechaValidez caracteristicas: car tipo:tip monto:m  producto: produc [
super inicializarConId: unID fechaVal:unaFechaValidez caracteristicas: car tipo:tip monto:m .
producto := produc.

]

{ #category : #printing }
YProducto >> toString [ 
|cadena|
cadena:= super toString. 
^cadena, String cr,'Producto: ', producto.
]
