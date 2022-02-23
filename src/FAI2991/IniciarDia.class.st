Class {
	#name : #IniciarDia,
	#superclass : #Ventana,
	#instVars : [
		'listadoSolPendientes'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
IniciarDia >> crearComponentes [ 
listadoSolPendientes := RubScrolledTextMorph new.
listadoSolPendientes beReadOnly; extent: 500 @ 500; left: 100; top: 60.
self addMorph: listadoSolPendientes.
self addDependent: UnGestor. 

]

{ #category : #initialization }
IniciarDia >> initialize [
super initialize.
self crearComponentes.
UnGestor iniciarDia.
self update:UnGestor getColSolicitudes. 
]

{ #category : #updating }
IniciarDia >> update: col [ 
col
		ifEmpty: [ listadoSolPendientes  setText: 'No existen solicitudes pendientes' ]
		ifNotEmpty: [ listadoSolPendientes  setText: (UnGestor colAString:col) ].
]
