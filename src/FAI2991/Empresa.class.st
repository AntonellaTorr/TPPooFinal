"
TPO
"
Class {
	#name : #Empresa,
	#superclass : #Postulante,
	#instVars : [
		'tipo',
		'rango'
	],
	#classVars : [
		'VALORPUNTO'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
Empresa class >> crearCon:incun nombre:nomb tipo:tip rango:ran [ 
|emp|
emp:=self new. 
emp inicializarCon:incun nombre:nomb tipo:tip rango:ran .
^emp
]

{ #category : #'as yet unclassified' }
Empresa class >> getValorPorPunto [
^VALORPUNTO 
]

{ #category : #'as yet unclassified' }
Empresa class >> valorPorPunto:valor [
VALORPUNTO :=valor. 
]

{ #category : #'as yet unclassified' }
Empresa >> esEmpresaBuscada: nombreEm [ 
^ nombreEm=nombre 
]

{ #category : #'as yet unclassified' }
Empresa >> esEmpresaCombinada [
^false
]

{ #category : #'as yet unclassified' }
Empresa >> esPersona [
^false.
]

{ #category : #'as yet unclassified' }
Empresa >> inicializarCon:incun nombre:nomb tipo:tip rango:ran [ 
incumbencias :=incun.
nombre:= nomb.
tipo:= tip.
rango:= ran. 

]

{ #category : #'as yet unclassified' }
Empresa >> puedeSerPostulante: monto tipo:ti [
^((self verificarRango:monto) & (tipo=ti)).

]

{ #category : #printing }
Empresa >> toString [
|cadena|
cadena:= super toString.
^cadena, String cr, 'Tipo: ', tipo , String cr,'Rango: ', rango asString

]

{ #category : #'as yet unclassified' }
Empresa >> verificarRango: monto [
|maximo|

maximo:=self class getValorPorPunto * rango asInteger. 
^(monto asInteger<=maximo)
]
