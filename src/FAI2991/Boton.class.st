Class {
	#name : #Boton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'aBlock'
	],
	#category : #FAI2991
}

{ #category : #constructor }
Boton class >> nombre: unNombre tamanio: unTamanio [

	| temp |
	temp := self new.
	temp initializeButton: unNombre; color: Color lightMagenta  ; extent: unTamanio; textColor: Color black.
	^ temp
]

{ #category : #auxiliares }
Boton >> centerText [

	label center: self center
]

{ #category : #auxiliares }
Boton >> disenioBoton [
	label
		font:
			(LogicalFont
				familyName: StandardFonts defaultFont familyName
				pointSize: 13);
		center: self center
]

{ #category : #auxiliares }
Boton >> font: aFont [

	label font: aFont.
	
]

{ #category : #initialization }
Boton >> initializeButton: aName [

	self label: aName
]

{ #category : #mouse }
Boton >> mouseAction: aEvent [

	aBlock := aEvent
]

{ #category : #mouse }
Boton >> mouseUp: aEvent [

	super mouseUp: aEvent.
	aBlock value
]

{ #category : #auxiliares }
Boton >> textColor: aColor [

	label color: aColor
]
