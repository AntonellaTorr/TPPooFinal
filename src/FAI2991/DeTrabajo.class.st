"
TPO
"
Class {
	#name : #DeTrabajo,
	#superclass : #Solicitud,
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
DeTrabajo class >> crearConId: unID fechaVal:unaFechaValidez caracteristicas: car [ 
|nuevaS|
nuevaS := self new. 
nuevaS inicializarConId: unID fechaVal:unaFechaValidez caracteristicas: car.
^nuevaS.
]

{ #category : #'as yet unclassified' }
DeTrabajo >> cumpleRequisitos: pos [ 
|res cumple|
cumple:=false.
res:=super cumpleRequisitos: pos.
(res) ifTrue:[(pos esPersona) ifTrue: [cumple:=true]].
	^cumple.
]

{ #category : #'as yet unclassified' }
DeTrabajo >> inicializarConId: unID fechaVal:unaFechaValidez caracteristicas: car [ 
id :=unID.
fechaRegistro := Date today.
fechaValidez := unaFechaValidez. 
caracteristicas := car.
estado:= 'pendiente'.
]
