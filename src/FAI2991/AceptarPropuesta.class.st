Class {
	#name : #AceptarPropuesta,
	#superclass : #Ventana,
	#instVars : [
		'id',
		'listadoPropuestas',
		'botonBuscar',
		'nombreP',
		'botonSeleccionarProp'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
AceptarPropuesta >> crearComponentes [ 

id:=  RubTextFieldMorph new.
id extent: 200 @ 90; left: self left+100 ; top:60; ghostText: 'Ingrese el id'.

listadoPropuestas := RubScrolledTextMorph new.
listadoPropuestas  beReadOnly; extent: 300 @ 500; left: self left + 500; top: 60.

botonBuscar:=  Boton nombre: 'Buscar propuestas' tamanio: 200 @ 30.
botonBuscar left: self left + 100; top: 100.

botonSeleccionarProp :=  Boton nombre: 'Aceptar una propuesta' tamanio: 200@ 30.
botonSeleccionarProp left: self left + 100; top: 150.

nombreP:=  RubTextFieldMorph new.
nombreP extent:372 @ 90; left: self left+100 ; top:100; ghostText: 'Ingrese el nombre del postulante cuya propuesta desee seleccionar'.

self 
addMorph: id;
addMorph: listadoPropuestas; 
addMorph:botonBuscar;
addMorph: nombreP;
addMorph: botonSeleccionarProp. 

nombreP hide. 
botonSeleccionarProp hide.

botonBuscar mouseAction: [

	self update:(UnGestor buscarPropuestasConId: id text asString).
	nombreP show. 
	botonBuscar hide.
	botonSeleccionarProp show.
	 botonSeleccionarProp mouseAction: [ UnGestor aceptarPropuesta: (id text asString) nombrePos: (nombreP text asString). 
		].
	].




]

{ #category : #initialization }
AceptarPropuesta >> initialize [ 
super initialize.
self crearComponentes.

]

{ #category : #updating }
AceptarPropuesta >> update: propuestas [
	propuestas
		ifEmpty: [ listadoPropuestas setText: 'No existen propuestas cuya solicitud tenga ese id' ]
		ifNotEmpty: [ listadoPropuestas setText: (UnGestor colAString: propuestas ) ]
]
