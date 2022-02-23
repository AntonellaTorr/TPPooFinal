"
TPO
"
Class {
	#name : #EmpresaCombinada,
	#superclass : #Empresa,
	#instVars : [
		'colProductos'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
EmpresaCombinada class >> crearCon:incun nombre:nomb tipo:tip rango:ran colProductos:prod [ 
|emp|
emp:= self new.
emp inicializarCon:incun nombre:nomb tipo:tip rango:ran colProductos:prod.
^emp.
]

{ #category : #'as yet unclassified' }
EmpresaCombinada >> esEmpresaCombinada [ 
^true.
]

{ #category : #'as yet unclassified' }
EmpresaCombinada >> existeProducto:prod [
^colProductos includes:prod. 
]

{ #category : #'as yet unclassified' }
EmpresaCombinada >> inicializarCon:incun nombre:nomb tipo:tip rango:ran colProductos:prod [ 
super inicializarCon:incun nombre:nomb tipo:tip rango:ran. 
colProductos:=prod.

]

{ #category : #'as yet unclassified' }
EmpresaCombinada >> puedeSerPostulante: mont tipo: tip [ 
^false.  
]

{ #category : #printing }
EmpresaCombinada >> toString [ 
|cadena|
cadena:= super toString.
^cadena, String cr, 'Productos: ', colProductos asString.

]

{ #category : #'as yet unclassified' }
EmpresaCombinada >> verificarDescripcion:des [ 
^incumbencias anySatisfy: [ :incumbencia| incumbencia =des].
]
