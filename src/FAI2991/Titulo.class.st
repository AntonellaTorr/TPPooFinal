Class {
	#name : #Titulo,
	#superclass : #StringMorph,
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Titulo class >> crearConTitulo:tit tam:tam [ 
|nuevoT|
nuevoT:= self new. 
   nuevoT
        contents: tit;
        font: (LogicalFont familyName: StandardFonts defaultFont familyName pointSize: tam).

    nuevoT color: (Color r: 0.38 g: 0.47 b: 0.58).

^nuevoT. 
]

{ #category : #'as yet unclassified' }
Titulo >> inicializar:tit tam: tamanio [
	self
		contents: tit;
		color: Color black;
		font:	(LogicalFont	familyName: StandardFonts defaultFont familyName pointSize: tamanio).
]
