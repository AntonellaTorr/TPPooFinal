Class {
	#name : #Listados,
	#superclass : #Ventana,
	#instVars : [
		'botonlistadoSolPendientesFecha',
		'botonSolPendientesEmpresa',
		'botonSolAtendidas',
		'botonCantSol',
		'listado',
		'calendario',
		'nombreE',
		'botonGenerarE',
		'botonGenerarF',
		'titulo1'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Listados >> crearComponentes [ 
|espacioDerecha  |
"creacion de los botones"	
	espacioDerecha:= self left + 100.
	botonGenerarE := Boton nombre: 'Generar Listado' tamanio: 200 @ 30.
	botonGenerarF := Boton nombre: 'Generar Listado' tamanio: 200 @ 30.
	botonSolAtendidas  := Boton nombre: 'Listado solicitudes atendidas' tamanio: 400 @ 30.
	botonSolPendientesEmpresa  := Boton nombre: 'Listado solicitudes pendientes de una empresa' tamanio: 400 @ 30.
	botonlistadoSolPendientesFecha  := Boton nombre: 'Listado solicitudes pendientes registradas en una fecha' tamanio: 400 @ 30.
	botonCantSol    := Boton nombre: 'Empresas ordenadas por cantidades de solicitudes resueltas' tamanio: 400 @ 30.
	calendario := CalendarMorph openOn: Date today.
	calendario left: espacioDerecha ; top: 80. 
	listado:= RubScrolledTextMorph new.
	nombreE:= RubTextFieldMorph new. 
	nombreE extent: 250 @ 90; left: espacioDerecha ; top: 60; ghostText: 'Ingrese el nombre'; borderStyle: (BottomBorder new width: 2); color: (Color r: 0.40 g: 0.42 b: 0.60).
		
   titulo1 := Titulo crearConTitulo: 'Seleccione la fecha' tam:  11.
	titulo1 left: espacioDerecha; top:60;color: Color white.  
	
	botonGenerarE left: espacioDerecha ; top: 100.
	botonGenerarF left: espacioDerecha ; top: 250.
	
	
	
	UnGestor addDependent: self.		

	listado  beReadOnly; extent: 300 @ 500; left: self left + 500; top: 60.
	botonSolAtendidas   left: self left + 50; top:50.	
	botonSolPendientesEmpresa   left: self left + 50; top:100. 
	botonCantSol   left: self left + 50; top:150.	
   botonlistadoSolPendientesFecha   left: self left + 50; top:200.		
	
	
	
	self 
	addMorph: listado;
	addMorph: botonCantSol;
	addMorph: botonSolAtendidas;
	addMorph: botonSolPendientesEmpresa;
	addMorph: botonlistadoSolPendientesFecha;
	addMorph:nombreE;
	addMorph:calendario;
	addMorph: botonGenerarE;
	addMorph: botonGenerarF;
	addMorph: titulo1. 
	self iniciar. 
]

{ #category : #'as yet unclassified' }
Listados >> iniciar [
botonlistadoSolPendientesFecha show.
botonSolPendientesEmpresa show. 
botonSolAtendidas show. 
botonCantSol show.
listado hide.
calendario hide. 
nombreE hide.
botonGenerarE hide. 
titulo1 hide.
botonGenerarF hide.
]

{ #category : #initialization }
Listados >> initialize [ 
super initialize. 
self crearComponentes.
self mostrarListados.

]

{ #category : #'as yet unclassified' }
Listados >> mostrarFormListadoPendientesEmpresa [
botonlistadoSolPendientesFecha hide.
botonSolPendientesEmpresa hide. 
botonSolAtendidas hide. 
botonCantSol hide.
listado show.
calendario hide. 
nombreE show. 
botonGenerarE show. 
titulo1 hide.
botonGenerarF hide.
]

{ #category : #'as yet unclassified' }
Listados >> mostrarFormListadoPendientesFecha [
botonlistadoSolPendientesFecha hide.
botonSolPendientesEmpresa hide. 
botonSolAtendidas hide. 
botonCantSol hide.
listado show.
calendario show. 
nombreE hide.
botonGenerarE hide. 
botonGenerarF show. 
titulo1 show.
]

{ #category : #'as yet unclassified' }
Listados >> mostrarListado [
botonlistadoSolPendientesFecha hide.
botonSolPendientesEmpresa hide. 
botonSolAtendidas hide. 
botonCantSol hide.
listado show.
calendario hide. 
nombreE hide.
titulo1 hide.
botonGenerarF hide.
]

{ #category : #'as yet unclassified' }
Listados >> mostrarListados [
	botonSolPendientesEmpresa mouseAction: [ self mostrarFormListadoPendientesEmpresa ].
	botonSolAtendidas mouseAction: [ self mostrarListado. 
		self update:(UnGestor generarListadoSolResueltas)].
	botonlistadoSolPendientesFecha mouseAction: [ self mostrarFormListadoPendientesFecha].
	botonCantSol mouseAction: [ self mostrarListado. 
		self update:(UnGestor generarListadoEmpresasOrdenadas )].
	
	botonGenerarE mouseAction: [self update: (UnGestor generarListadoSolPendientes: nombreE text asString )].
	botonGenerarF mouseAction: [self update:(UnGestor generarListadoSolFecha: calendario date).].
]

{ #category : #updating }
Listados >> update: lis [
lis ifNotNil:[
	lis
		ifEmpty: [ listado setText: 'Listados' ]
		ifNotEmpty: [ listado setText: (UnGestor colAString:lis) ]].
]
