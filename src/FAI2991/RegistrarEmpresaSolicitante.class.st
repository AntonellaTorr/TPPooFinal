Class {
	#name : #RegistrarEmpresaSolicitante,
	#superclass : #Ventana,
	#instVars : [
		'botonRegistrar',
		'nombreEmpresa',
		'rubro1',
		'rubro2',
		'rubro3',
		'rubro4',
		'rango',
		'producto1',
		'producto2',
		'producto3',
		'listadoEmpresasSol',
		'tipo',
		'tituloRan',
		'tituloProd',
		'tituloTipo',
		'tituloRub'
	],
	#category : #FAI2991
}

{ #category : #'as yet unclassified' }
RegistrarEmpresaSolicitante >> crearComponentes [
    | espacioDerecha|
    botonRegistrar    := Boton nombre: 'Guardar' tamanio: 200 @ 30.
    nombreEmpresa     := RubTextFieldMorph new.
    rango             := SearchMorph new.
    listadoEmpresasSol := RubScrolledTextMorph new.
    rubro1         := CheckboxMorph new.
    rubro2         := CheckboxMorph new.
    rubro3         := CheckboxMorph new.
    rubro4         := CheckboxMorph new.
    producto1     := CheckboxMorph new.
    producto2     := CheckboxMorph new.
    producto3     := CheckboxMorph new.

    espacioDerecha:= self left + 100.

    tituloRub := Titulo crearConTitulo: 'Seleccione el rubro' tam:  11.
	 tituloRub top: 100; left: espacioDerecha; color: Color white .

	 tituloProd := Titulo crearConTitulo: 'Seleccione los productos(si posee)' tam:  11.
	 tituloProd top: 270; left: espacioDerecha; color: Color white .	
	
	 tituloRan := Titulo crearConTitulo: 'Seleccione el rango' tam:  11.
	 tituloRan top: 200; left: espacioDerecha; color: Color white .	
    tituloTipo:= Titulo crearConTitulo: 'Seleccione el tipo de empresa' tam: 11.
	 tituloTipo top: 380; left: espacioDerecha; color: Color white. 



  
    nombreEmpresa extent: 350 @ 90; left: espacioDerecha ; top: 60; ghostText: 'Ingrese el nombre'; borderStyle: (BottomBorder new width: 2); color: (Color r: 0.40 g: 0.42 b: 0.60).
 

    rubro1 label: 'Ropa'; extent: 100 @ 20; left: espacioDerecha ; top: nombreEmpresa bottom + 50.
    rubro2 label: 'Limpieza'; extent: 100 @ 20; left: espacioDerecha + 100; top: nombreEmpresa bottom + 50.
    rubro3 label: 'Mecanica'; extent: 100 @ 20; left: espacioDerecha ; top: nombreEmpresa bottom + 90.
    rubro4 label: 'Construccion'; extent: 100 @ 20; left: espacioDerecha + 100; top: nombreEmpresa bottom + 90.

 	 producto1 label: 'Cartel'; extent: 100 @ 20; left: espacioDerecha  ; top: nombreEmpresa bottom + 220.
    producto2 label: 'Conteiner'; extent: 100 @ 20; left: espacioDerecha + 100; top: nombreEmpresa bottom + 220.
    producto3 label: 'Ladrillos'; extent: 100 @ 20; left: espacioDerecha  ; top: nombreEmpresa bottom + 270.



   

 	rango extent: 200 @ 20; left: espacioDerecha ; top: 230.

    botonRegistrar left: espacioDerecha ; top: 500.

    listadoEmpresasSol beReadOnly; extent: 300 @ 500; left: self left + 500; top: 60.

		tipo := SearchMorph new.
		tipo content: 'Actividades Uniformes'.
		tipo content: 'Actividades Puntuales'.
		tipo content: 'Combinadas'.
		tipo  left: espacioDerecha ; top: 400.
		rango content: '100'.
		rango content: '150'.
	 	rango content: '200'.
	 	rango content: '250'.	
	 	rango content: '300'. 
 
        self addMorph: tituloRub; 
		  addMorph: tituloProd; 
        addMorph: botonRegistrar;
        addMorph: nombreEmpresa;
        addMorph: rango;
        addMorph: rubro1;
        addMorph: rubro2;
        addMorph: rubro3;
        addMorph: rubro4;
  		  addMorph: producto1;
        addMorph: producto2;
        addMorph: producto3;
		  addMorph:tituloTipo;
		  addMorph:tituloRan;
        addMorph: listadoEmpresasSol;
		  addMorph: tipo. 
		

    UnGestor addDependent: self.
    
			
	

]

{ #category : #initialization }
RegistrarEmpresaSolicitante >> initialize [

	super initialize.
	self crearComponentes. 
	self registrarEmpresaS.
	 

	
]

{ #category : #'as yet unclassified' }
RegistrarEmpresaSolicitante >> registrarEmpresaS [
|colProductos colRubros|
botonRegistrar
        mouseAction: [ colProductos := OrderedCollection new.
            colRubros := OrderedCollection new.
            rubro1 buttonMorph selected
                ifTrue: [ colRubros add: rubro1 label ].
            rubro2 buttonMorph selected
                ifTrue: [ colRubros add: rubro2 label ].
            rubro3 buttonMorph selected
                ifTrue: [ colRubros add: rubro3 label ].
  				rubro4 buttonMorph selected
                ifTrue: [ colRubros add: rubro4 label ].
            producto1 buttonMorph selected
                ifTrue: [ colProductos add: producto1 label ].
            producto2 buttonMorph selected
                ifTrue: [ colProductos add: producto2 label ].
            producto3 buttonMorph selected
                ifTrue: [ colProductos add: producto3 label ] .

 	UnGestor  registrarEmpresasSolicitantes: nombreEmpresa text asString
				rubro: colRubros
				tipo: tipo selectedItem
				rango: rango selectedItem
				productos: colProductos. 
				 ].
]

{ #category : #'as yet unclassified' }
RegistrarEmpresaSolicitante >> update:colActualizada [
	colActualizada
		ifEmpty: [ listadoEmpresasSol  setText: 'Listado empresas solicitantes Vacio' ]
		ifNotEmpty: [ listadoEmpresasSol setText: (UnGestor  colAString: colActualizada ) ]. 

]
