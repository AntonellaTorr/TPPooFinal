"
TPO
"
Class {
	#name : #Postulante,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'incumbencias'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Postulante >> esEmpresaCombinada [ 
^false. 
]

{ #category : #'as yet unclassified' }
Postulante >> esPersona [
^false.
]

{ #category : #'as yet unclassified' }
Postulante >> esPostulanteBuscado:nombreP [
^(nombreP=nombre)
]

{ #category : #'as yet unclassified' }
Postulante >> getIncumbencias [
^incumbencias.
]

{ #category : #'as yet unclassified' }
Postulante >> getNombre [
^nombre
]

{ #category : #printing }
Postulante >> toString [ 
^ 'Nombre: ', nombre, String cr,'Incumbencias: ' ,incumbencias asString .

]
