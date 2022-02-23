Class {
	#name : #GenerarPropuestas,
	#superclass : #Ventana,
	#instVars : [
		'listado'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
GenerarPropuestas >> crearComponentes [ 
listado:= RubScrolledTextMorph new.
listado beReadOnly; extent: 500 @ 500; left: 100; top: 60.
UnGestor addDependent: self. 
self addMorph: listado.
(UnGestor generarPropuestasSolicitudesPendientes).
self update: (UnGestor getColPropuestas).

]

{ #category : #initialization }
GenerarPropuestas >> initialize [
super initialize.
self crearComponentes.
]

{ #category : #updating }
GenerarPropuestas >> update:lis [
	lis
		ifEmpty: [ listado setText: 'Propuestas Generadas' ]
		ifNotEmpty: [ listado setText: (UnGestor colAString:lis) ]
]
