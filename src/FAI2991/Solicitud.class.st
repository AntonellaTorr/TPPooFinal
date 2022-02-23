"
TPO
"
Class {
	#name : #Solicitud,
	#superclass : #Object,
	#instVars : [
		'id',
		'fechaRegistro',
		'fechaValidez',
		'caracteristicas',
		'estado'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Solicitud >> cumpleCondiciones:fechaBuscada [
^(fechaRegistro =fechaBuscada)
]

{ #category : #'as yet unclassified' }
Solicitud >> cumpleRequisitos:pos [

^(pos getIncumbencias) anySatisfy: [:incumbencia|incumbencia= caracteristicas].
]

{ #category : #'as yet unclassified' }
Solicitud >> estaPendiente [
^estado='pendiente'
]

{ #category : #'as yet unclassified' }
Solicitud >> estaVencida [
^(fechaValidez < Date today). 
]

{ #category : #'as yet unclassified' }
Solicitud >> getId [
^id.
]

{ #category : #'as yet unclassified' }
Solicitud >> revalidar: fechaNueva [
fechaValidez := fechaNueva. 
]

{ #category : #initialization }
Solicitud >> setEstado: es [ 
estado:=es.
]

{ #category : #printing }
Solicitud >> toString [ 
^'Solicitud con id: ', id asString, String cr,'FechaRegistro: ', (fechaRegistro  asString),String cr,'FechaValidez: ', (fechaValidez asString),String cr, 'Caracteristicas: ', caracteristicas,String cr,'Estado: ', estado. 
]
