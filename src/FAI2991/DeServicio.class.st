"
TPO
"
Class {
	#name : #DeServicio,
	#superclass : #Solicitud,
	#instVars : [
		'tipo',
		'monto'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
DeServicio class >> crearConId: unID fechaVal:unaFechaValidez caracteristicas: car tipo:tip monto:m [ 
|unaS|
unaS:= self new.
unaS inicializarConId: unID fechaVal:unaFechaValidez caracteristicas: car tipo:tip monto:m.
^unaS.
]

{ #category : #'as yet unclassified' }
DeServicio >> cumpleRequisitos: pos [ 
  
^ (super cumpleRequisitos: pos) & (pos puedeSerPostulante: monto tipo: tipo) .
            
  

]

{ #category : #'as yet unclassified' }
DeServicio >> inicializarConId: unID fechaVal:unaFechaValidez caracteristicas: car tipo:tip monto:m [ 
id :=unID.
fechaRegistro := Date today.
fechaValidez := unaFechaValidez. 
caracteristicas := car.
estado:= 'pendiente'.
tipo:= tip.
monto:=m. 
]

{ #category : #printing }
DeServicio >> toString [ 
|cadena|
cadena:= super toString. 
^cadena, String cr, 'Tipo: ', tipo, String cr, 'Monto: ',monto.
]
