Class {
	#name : #Ventana,
	#superclass : #BorderedMorph,
	#instVars : [
		'titulo',
		'botonCerrado'
	],
	#classVars : [
		'UnGestor'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Ventana class >> crearCon: titulo gestorAsociado: unG [
	| nuevaV |
	UnGestor := unG.
	nuevaV := self new.
	nuevaV		aniadirTitulo:titulo; openCenteredInWorld. 
]

{ #category : #'as yet unclassified' }
Ventana >> aniadirTitulo: tit [
	titulo := StringMorph new.
	titulo
		contents: tit;
		font:
			(LogicalFont
				familyName: StandardFonts defaultFont familyName
				pointSize: 30);
		color: (Color r: 0.38 g: 0.47 b: 0.58).
]

{ #category : #'as yet unclassified' }
Ventana >> cerrar [ 
self delete.
]

{ #category : #'as yet unclassified' }
Ventana >> crearBotonCerrado [
	botonCerrado := Boton nombre: 'X' tamanio: 30 @ 30.
	botonCerrado
		left: self right - 100;
		top: 30;
		mouseAction: [ self cerrar ];
		color: Color white. 
	self addMorph: botonCerrado
]

{ #category : #initialization }
Ventana >> initialize [
	super initialize.
	self
		beSticky;
		extent: 1000 @ 600;
		color: (Color black);
		borderColor: Color black;
		crearBotonCerrado
]
