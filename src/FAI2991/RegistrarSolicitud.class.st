Class {
	#name : #RegistrarSolicitud,
	#superclass : #Ventana,
	#instVars : [
		'solicitudTrabajo',
		'solicitudServicio',
		'solicitudServicioProducto',
		'id',
		'tipo',
		'monto',
		'producto',
		'guardadoTrabajo',
		'guardadoServicio',
		'guardadoServicioYP',
		'listadoSolicitudes',
		'calendar',
		'titulo1',
		'rub',
		'nombreEmpresa'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
RegistrarSolicitud >> crearComponentes [ 
|espacioDerecha |

   espacioDerecha:= self left + 100.
	calendar:=  CalendarMorph openOn: Date today.
	calendar left: espacioDerecha ; top:200.
	
	solicitudTrabajo := Boton nombre: 'Solicitud de Trabajo' tamanio: 200 @ 30.
	solicitudServicio  := Boton nombre: 'Solicitud de Servicio' tamanio: 200 @ 30.
	solicitudServicioProducto  := Boton nombre: 'Solicitud de Servicio y Producto' tamanio: 200 @ 30.
	listadoSolicitudes  := RubScrolledTextMorph new.
	listadoSolicitudes  beReadOnly; extent:  400@ 500; left: self left + 500; top: 60.
	
	id:=  RubTextFieldMorph new.
   id extent: 200 @ 90; left: self left+100 ; top:60; ghostText: 'Ingrese el id'.

	
	nombreEmpresa:=  RubTextFieldMorph new.
   nombreEmpresa extent: 200 @ 90; left: self left+100 ; top:380; ghostText: 'Ingrese el nombre de la empresa'.
	monto:=  RubTextFieldMorph new.
	monto extent: 200 @ 90; left: self left+100 ; top: 460 ; ghostText: 'Ingrese el monto'.
	
	titulo1  := Titulo crearConTitulo: 'Ingrese la fecha de validez' tam: 11.
	titulo1 left: espacioDerecha ; top: 170; color:Color white.


	 tipo := SearchMorph new.
	 tipo content: 'Actividades Uniformes'.
	 tipo content: 'Actividades Puntuales'.
	 tipo content: 'Combinadas'.
	 tipo extent: 200 @30 ; left: espacioDerecha ; top:415.
	
	 rub := SearchMorph new.
	 rub content: 'Ropa'.
	 rub content: 'Limpieza'.
	 rub content: 'Limpieza'.
	 rub content: 'Construccion'.
	 rub extent: 200 @25 ; left: espacioDerecha ; top:90.
	
	 producto := SearchMorph new.
	producto content: 'Cartel'.
	 producto content: 'Ladrillos'.
	 producto content: 'Conteiner'.
	 producto extent: 200 @25 ; left: espacioDerecha ; top:130.	
   guardadoTrabajo:= Boton nombre: 'Guardar solicitud de trabajo' tamanio: 200 @ 30.
	guardadoServicio := Boton nombre: 'Guardar solicitud de servicio' tamanio: 200 @ 30. 
	guardadoServicioYP := Boton nombre: 'Guardar solicitud de servicio y producto' tamanio: 250 @ 30.


	
	solicitudTrabajo  left: self left + 150; top:150.	
	solicitudServicio  left: self left + 400; top:150. 
	solicitudServicioProducto  left: self left + 650; top:150.
	
	guardadoTrabajo  left: espacioDerecha  ;top:430.
	guardadoServicio left: espacioDerecha ; top:500.
	guardadoServicioYP left: espacioDerecha ; top:520.
	

self 
	addMorph: solicitudTrabajo;
	addMorph: solicitudServicio;
	addMorph: solicitudServicioProducto;
	addMorph: guardadoServicio;
	addMorph: guardadoTrabajo;
	addMorph: guardadoServicioYP;
	addMorph: producto;
	addMorph: tipo;
	addMorph: calendar;
	addMorph: rub;
	addMorph: id;
	addMorph:monto;
	addMorph: listadoSolicitudes;
	addMorph: titulo1;
	addMorph: nombreEmpresa.

	self iniciar. 
	UnGestor addDependent: self.
		

	
]

{ #category : #'as yet unclassified' }
RegistrarSolicitud >> formularioServicioYProd [
solicitudTrabajo hide.
solicitudServicio hide.
solicitudServicioProducto hide. 
id show.
nombreEmpresa show.
titulo1 show.
calendar show. 
rub show.  
monto show.
tipo show.
producto show.
guardadoTrabajo  hide.
guardadoServicio hide.
guardadoServicioYP show.
listadoSolicitudes show.
]

{ #category : #'as yet unclassified' }
RegistrarSolicitud >> formularioSolServicio [
solicitudTrabajo hide.
solicitudServicio hide.
solicitudServicioProducto hide. 
id show.
nombreEmpresa show.
titulo1 show. 
calendar show. 
rub show. 
 
tipo show.
monto show.
producto hide.
guardadoTrabajo  hide.
guardadoServicio show.
guardadoServicioYP hide.
listadoSolicitudes show.
]

{ #category : #'as yet unclassified' }
RegistrarSolicitud >> formularioSolTrabajo [ 
solicitudTrabajo hide.
solicitudServicio hide.
solicitudServicioProducto hide. 
id show.
nombreEmpresa show.
titulo1 show. 
calendar  show. 
rub show.  
tipo hide.
monto hide.
producto hide.
guardadoTrabajo  show.
guardadoServicio hide.
guardadoServicioYP hide.
listadoSolicitudes show.
]

{ #category : #'as yet unclassified' }
RegistrarSolicitud >> iniciar [ 
solicitudTrabajo show.
solicitudServicio show.
solicitudServicioProducto show. 
id hide.
nombreEmpresa hide. 
rub hide. 

tipo hide.
titulo1 hide. 
calendar hide. 
monto hide.
producto hide.

guardadoTrabajo  hide.
 guardadoServicio hide.
guardadoServicioYP hide.
listadoSolicitudes hide.


]

{ #category : #initialization }
RegistrarSolicitud >> initialize [ 
super initialize.
self crearComponentes.
self registrarNuevasSolicitudes.
self update: (UnGestor getColSolicitudes)
]

{ #category : #'as yet unclassified' }
RegistrarSolicitud >> registrarNuevasSolicitudes [

solicitudTrabajo mouseAction: [ self formularioSolTrabajo].
solicitudServicio mouseAction: [ self formularioSolServicio].
solicitudServicioProducto mouseAction: [ self formularioServicioYProd].
	
				
			guardadoTrabajo mouseAction: [UnGestor registrarSolicitud: (id  text asString) caracteristicas: (rub selectedItem) asString unNombre: nombreEmpresa text asString fechaValidez: calendar date.]
				.
			
			guardadoServicioYP mouseAction: [ 
			
				UnGestor registrarSolicitud: id text asString  caracteristicas: (rub selectedItem) asString unNombre: nombreEmpresa text asString fechaValidez: calendar date tipo:tipo selectedItem monto:monto text asString	producto:(producto selectedItem) asString.
			].
			
			guardadoServicio mouseAction: [UnGestor registrarSolicitud: (id text asString) caracteristicas: (rub selectedItem) asString unNombre: nombreEmpresa text asString fechaValidez: calendar date 	tipo:tipo selectedItem  monto: monto text asString .
						
							].
		
]

{ #category : #updating }
RegistrarSolicitud >> update:colSol [
colSol 
	ifEmpty: [ listadoSolicitudes setText:'Listado Solicitudes Vacio' ]
	ifNotEmpty:[listadoSolicitudes  setText: (UnGestor colAString: colSol)].
]
