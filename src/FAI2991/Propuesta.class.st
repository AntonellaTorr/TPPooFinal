"
TPO
"
Class {
	#name : #Propuesta,
	#superclass : #Object,
	#instVars : [
		'solicitud',
		'postulante',
		'estado'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Propuesta class >> crearCon:sol postulante:pos [ 
|nuevaP|
nuevaP:= self new. 
nuevaP inicializarCon:sol postulante:pos.
^nuevaP.
]

{ #category : #'as yet unclassified' }
Propuesta >> esPropuestaBuscada:unaS [
^unaS=solicitud 
]

{ #category : #'as yet unclassified' }
Propuesta >> getPostulante [
^postulante 
]

{ #category : #'as yet unclassified' }
Propuesta >> getSolicitud [
^solicitud 
]

{ #category : #'as yet unclassified' }
Propuesta >> inicializarCon:sol postulante:pos [ 
solicitud:= sol.
postulante:= pos. 
estado:='pendiente'.
]

{ #category : #initialization }
Propuesta >> setEstado:es [
estado:=es.
]

{ #category : #printing }
Propuesta >> toString [ 
^'Propuesta con :', String cr,
'.', (solicitud toString),
String cr, ' .Postulante ' ,(postulante toString).
]
