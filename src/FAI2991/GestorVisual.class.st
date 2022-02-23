Class {
	#name : #GestorVisual,
	#superclass : #FullscreenMorph,
	#instVars : [
		'unGestor',
		'botonRegistrarPostulante',
		'botonRegistrarSolicitud',
		'botonRegistrarEmpresaSolicitante',
		'botonAceptarPropuesta',
		'botonGenerarListado',
		'botonGenerarPropuesta',
		'botonSalida',
		'botonIniciarDia'
	],
	#category : #FAI2991
}

{ #category : #constructor }
GestorVisual class >> crear [
|nuevo|
nuevo:= self new. 
nuevo openInWorld.

]

{ #category : #'as yet unclassified' }
GestorVisual >> agregarBotones [
	botonRegistrarEmpresaSolicitante := Boton nombre: 'Registrar Empresa Solicitante' tamanio: 250 @ 50.
	botonRegistrarSolicitud := Boton nombre: 'Registrar Solicitudes'	tamanio: 250 @ 50.
	botonRegistrarPostulante := Boton nombre: 'Registrar Postulantes' tamanio: 250 @ 50.
	botonAceptarPropuesta := Boton nombre: 'Aceptar Propuesta' tamanio: 250 @ 50.
	botonGenerarPropuesta := Boton	nombre: 'Generar Propuesta'	tamanio: 250 @ 50.
	botonGenerarListado := Boton nombre: 'Generar Listado' tamanio: 250 @ 50.
	botonIniciarDia := Boton nombre: 'Iniciar Dia' tamanio: 250 @ 50.
	botonSalida := Boton nombre: 'X' tamanio: 30 @ 30.

			
	botonIniciarDia disenioBoton.
	botonRegistrarPostulante disenioBoton.
	botonRegistrarSolicitud disenioBoton.
	botonRegistrarEmpresaSolicitante disenioBoton.
	botonAceptarPropuesta disenioBoton.
	botonGenerarListado disenioBoton.
	botonGenerarPropuesta disenioBoton.
	botonSalida disenioBoton.
	
	botonRegistrarSolicitud left: 200;	top: 200; 	mouseAction: [ RegistrarSolicitud	crearCon: 'Seleccione un tipo de solicitud' 	gestorAsociado: unGestor  ].
	botonRegistrarPostulante 	left: 500;top: 200;mouseAction: [ RegistrarPostulante crearCon: 'Seleccione un tipo postulante' 	gestorAsociado: unGestor ].
	botonGenerarPropuesta	left: 800;	top: 200;	mouseAction: [ GenerarPropuestas crearCon: 'Generar Propuestas a Solicitudes Pendientes' gestorAsociado: unGestor ].
	botonAceptarPropuesta 	left: 200;	top: 400; 	mouseAction: [ AceptarPropuesta crearCon: 'Aceptar Propuesta a solicitud ' gestorAsociado: unGestor ].
	botonGenerarListado left: 500; top: 400; mouseAction: [ Listados	crearCon: 'Generar Listados' gestorAsociado: unGestor ].
	botonRegistrarEmpresaSolicitante left: 800;	top: 400; mouseAction: [ RegistrarEmpresaSolicitante crearCon: 'Registrando una empresa solicitante'	gestorAsociado: unGestor ].
	botonIniciarDia left: 500;	top: 550; mouseAction: [ IniciarDia crearCon: 'Iniciar Dia' gestorAsociado: unGestor ].
			
	botonSalida
		left: 30;
		top: 30;
		mouseAction: [ self delete ].
	self
		addMorph: botonRegistrarEmpresaSolicitante;
		addMorph: botonRegistrarSolicitud;
		addMorph: botonRegistrarPostulante;
		addMorph: botonGenerarPropuesta;
		addMorph: botonAceptarPropuesta;
		addMorph:botonIniciarDia;
		addMorph: botonGenerarListado;
		addMorph: botonSalida.
]

{ #category : #'as yet unclassified' }
GestorVisual >> agregarFondo [

  | fondo |
    fondo := (Form fromFileNamed: 'C:\Users\usuario\Downloads\TRABAJO AR.png')
                 asMorph.
    fondo basicExtent: self extent.
    self addMorphBack: fondo
]

{ #category : #initialization }
GestorVisual >> initialize [ 
super initialize .
unGestor := GestorDeEmpleos  crear. 
self  agregarFondo;
agregarBotones. 
]
