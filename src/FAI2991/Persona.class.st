"
TPO
"
Class {
	#name : #Persona,
	#superclass : #Postulante,
	#instVars : [
		'DNI'
	],
	#classVars : [
		'MAXIMOINDIVIDUAL'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Persona class >> crear: incumben nombre:nombreP DNI:dni [
|nuevaP|
nuevaP:= self new. 
nuevaP inicializarPersona: incumben nombre:nombreP DNI:dni. 
^nuevaP.
]

{ #category : #'as yet unclassified' }
Persona class >> getMaximo [
^MAXIMOINDIVIDUAL 
]

{ #category : #'as yet unclassified' }
Persona class >> maximoPorPersona:max [ 
MAXIMOINDIVIDUAL :=max.
]

{ #category : #'as yet unclassified' }
Persona >> esEmpresaBuscada:nomb [
^false
]

{ #category : #'as yet unclassified' }
Persona >> esEmpresaCombinada [ 
^false.
]

{ #category : #'as yet unclassified' }
Persona >> esPersona [
^true.
]

{ #category : #'as yet unclassified' }
Persona >> inicializarPersona: incumben nombre:nombreP DNI:dni [
nombre:= nombreP.
DNI:= dni.
incumbencias:= incumben. 
]

{ #category : #'as yet unclassified' }
Persona >> puedeSerPostulante:monto tipo:tip [
|exito |
exito:=false. 
((self class getMaximo  >=  monto asInteger)) ifTrue:[exito:=true].
^exito.


]

{ #category : #printing }
Persona >> toString [
|cadena|
cadena:= super toString.
^cadena, String cr, 'DNI: ', DNI. 

]
