-- Creación de tabla usuario (Tabla pápa)
CREATE TABLE usuario(
    idUsuario           VARCHAR(30) NOT NULL,
    nombre              VARCHAR(50) NOT NULL,
    apellido_pat        VARCHAR(50) NOT NULL,
    apellido_mat        VARCHAR(50) NOT NULL,
    calle               VARCHAR(30) NOT NULL,
    numero              INT NOT NULL,
    colonia             VARCHAR(30) NOT NULL,
    municipio           VARCHAR(30) NOT NULL,
    estado              VARCHAR(30) NOT NULL,
    email               VARCHAR(50) NOT NULL,
    contrasena          VARCHAR(15) NOT NULL,
    telefono            VARCHAR(10) NOT NULL,
    rfc                 VARCHAR(13) NOT NULL,
    tipoPersona         VARCHAR(10) NOT NULL,
    regimenFiscal       VARCHAR(50) NOT NULL,
    nombreComercial     VARCHAR(100) NOT NULL,
    Csf                 LONGBLOB NOT NULL,        
  Constraint PK_usuario PRIMARY KEY(idUsuario)
);

-- Creación de tabla mesa de ayuda
CREATE TABLE mesaAyuda(
    IdProblema          VARCHAR(20) NOT NULL,
    titulo              VARCHAR(30) NOT NULL,
    descripcion         text NOT NULL,
    solucion            text NOT NULL,
    archivo             LONGBLOB NOT NULL,
    FKidUsuario         VARCHAR(30) NOT NULL,
   Constraint PK_mesaAyuda PRIMARY KEY(IdProblema),
   Constraint FK_usumes FOREIGN KEY(FKidUsuario) REFERENCES usuario(idUsuario)
);

-- Creación de tabla factura
CREATE TABLE factura(
    IdFactura           VARCHAR(20) NOT NULL,
    FKidUsuario1        VARCHAR(30) NOT NULL,
    Constraint Pk_factura PRIMARY KEY(IdFactura),
    Constraint FK_usufac FOREIGN KEY(FKidUsuario1) REFERENCES usuario(idUsuario)
);

-- Creación de tabla sucursal
CREATE TABLE sucursal(
    numeroSerie         VARCHAR(30) NOT NULL,
    nombreComercial     VARCHAR(60) NOT NULL,
    calle               VARCHAR(50) NOT NULL,
    numero              INT NOT NULL,
    colonia             VARCHAR(30) NOT NULL, 
    municipio           VARCHAR(35) NOT NULL,
    estado              VARCHAR(30) NOT NULL,
    telefono            VARCHAR(10) NOT NULL,
    nombreContacto      VARCHAR(70) NOT NULL,
    FKidUsuario2        VARCHAR(30) NOT NULL,
    Constraint Pk_numeroSerie PRIMARY KEY(numeroSerie),
    Constraint FK_ususuc FOREIGN KEY(FKidUsuario2) REFERENCES usuario(idUsuario)
);

-- Creación de tabla Ticket
CREATE TABLE ticket(
    IdTicket            VARCHAR(30) NOT NULL,
    fecha               DATE NOT NULL,
    estado              VARCHAR(30) NOT NULL,
    asunto              VARCHAR(60) NOT NULL,
    descripcion         text NOT NULL,
    imagen              LONGBLOB NOT NULL,
    notas               text NOT NULL,
    FK_idUsuario3       VARCHAR(30) NOT NULL,
    Constraint Pk_IdTicket PRIMARY KEY(IdTicket),
    Constraint FK_usutic FOREIGN KEY(FK_idUsuario3) REFERENCES usuario(idUsuario)
);

-- Creación de tabla departamento
CREATE TABLE departamento(
    IdDepartamento      VARCHAR(30) NOT NULL,
    nombreDepartamento  VARCHAR(35) NOT NULL,
    encargado           VARCHAR(25) NOT NULL,
    email               VARCHAR(35) NOT NULL,
    FK_IdTicket         VARCHAR(30) NOT NULL,
    Constraint PK_IdDepartamento PRIMARY KEY(IdDepartamento),
    Constraint FK_ticdep FOREIGN KEY(FK_IdTicket) REFERENCES ticket(IdTicket)
);

-- Creación de tabla Hardware 
CREATE TABLE hardware(
    IdHardware          VARCHAR(15) NOT NULL,
    nombre              VARCHAR(25) NOT NULL,
    descripcion         text NOT NULL,
    Constraint Pk_IdHardware PRIMARY KEY(IdHardware)
);

-- Creación de tabla cotización
CREATE TABLE cotizacion(
    IdCotizacion        VARCHAR(30) NOT NULL,
    fechaSolicitud      DATE NOT NULL,
    FK_idUsuario4       VARCHAR(30) NOT NULL,
    FK_idHardware       VARCHAR(15) NOT NULL,
    Constraint PK_IdCotizacion PRIMARY KEY(IdCotizacion),
    Constraint FK_usucot FOREIGN KEY(FK_idUsuario4) REFERENCES usuario(idUsuario),
    Constraint FK_harcot FOREIGN KEY(FK_idHardware) REFERENCES hardware(IdHardware)    
);
-- Creación de tabla curso
CREATE TABLE curso(
    idCurso              VARCHAR(15) NOT NULL,
    nombre               VARCHAR(30) NOT NULL,
    temario              TEXT NOT NULL,
    modalidad            VARCHAR(15) NOT NULL,
    nivel                VARCHAR(20) NOT NULL,
    precio               DOUBLE NOT NULL,
    cupoMinimo           INT NOT NULL,
    fechaInicio          DATE NOT NULL,
    fechaFin             DATE NOT NULL,
    CONSTRAINT pk_curso PRIMARY KEY(idCurso)
);
-- Creación de tabla cfdi
CREATE TABLE cfdi(
    idCFDI               VARCHAR(20) NOT NULL,
    estatus              VARCHAR(20) NOT NULL,
    fechaInicio          DATE NOT NULL,
    precio               DOUBLE NOT NULL, 
    CONSTRAINT pk_idCFDI PRIMARY KEY(idCFDI)
);
-- Creación de tabla poliza
CREATE TABLE poliza(
    idPoliza             VARCHAR(30) NOT NULL,
    nombre               VARCHAR(50) NOT NULL, 
    descripcion          TEXT NOT NULL,
    perioricidad         VARCHAR(25) NOT NULL,
    costo                DOUBLE NOT NULL,
    fechaServicio        DATE NOT NULL,
    cantidad             INT NOT NULL,
    CONSTRAINT pk_poliza PRIMARY KEY(idPoliza)
);
-- Creación de tabla software
CREATE TABLE software(
    idSoftware           VARCHAR(30) NOT NULL,
    nombre               VARCHAR(50) NOT NULL,
    precio               DOUBLE NOT NULL,
    numeroSerie          VARCHAR(30) NOT NULL,
    descripcion          TEXT NOT NULL,
    versionSof           VARCHAR(20) NOT NULL,
    perioricidad         VARCHAR(30) NOT NULL,
    estatus              VARCHAR(30) NOT NULL,
    fechaActivacion      DATE NOT NULL,
    fechaProximoPago     DATE NOT NULL,
    bloqueo              BOOLEAN,
    CONSTRAINT pk_software PRIMARY KEY(idSoftware)
);
-- Creación de tabla suscripción
CREATE TABLE suscripcion(
    idSuscripcion        VARCHAR(20) NOT NULL,
    fkidPoliza           VARCHAR(30),
    fkidSoftware         VARCHAR(30),
    CONSTRAINT pk_suscripcion PRIMARY KEY(idSuscripcion),
    CONSTRAINT fk_poliza FOREIGN KEY(fkidPoliza) REFERENCES poliza(idPoliza),
    CONSTRAINT fk_software FOREIGN KEY(fkidSoftware) REFERENCES software(idSoftware)
);
-- Creación de tabla servicio
CREATE TABLE servicio(
    idServicio          VARCHAR(30) NOT NULL,
    numeroControl       VARCHAR(25) NOT NULL,
    factura             BOOLEAN NOT NULL,
    contrasena          VARCHAR(15) NOT NULL,
    claveActivacion     VARCHAR(20) NOT NULL,
    fkidPedido          VARCHAR(30) NOT NULL,
    CONSTRAINT pk_servicio PRIMARY KEY(idServicio)
);
-- Creación de tabla pedido
CREATE TABLE pedido(
    idPedido            VARCHAR(30) NOT NULL, 
    cantidad            INT NOT NULL,
    fechaPedido         DATE NOT NULL,    
    descuento           DOUBLE NOT NULL, 
    total               DOUBLE NOT NULL,
    factura             BOOLEAN NOT NULL,
    imagen              LONGBLOB NOT NULL,
    fkidUsuario         VARCHAR(30),
    fkidServicio        VARCHAR(30),
    fkidCurso           VARCHAR(15),
    fkDEidPoliza          VARCHAR(30),
    fkDEidSoftware        VARCHAR(30),
    fkidcfdi            VARCHAR(20),
    CONSTRAINT pk_pedido PRIMARY KEY(idPedido),
    CONSTRAINT fk_usuario FOREIGN KEY(fkidUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_servicio FOREIGN KEY(fkidServicio) REFERENCES servicio(idServicio),
    CONSTRAINT fk_curso FOREIGN KEY(fkidCurso) REFERENCES curso(idCurso),
    CONSTRAINT fk_poliza1 FOREIGN KEY(fkDEidPoliza) REFERENCES poliza(idPoliza),
    CONSTRAINT fk_software1 FOREIGN KEY(fkDEidSoftware) REFERENCES software(idSoftware),
    CONSTRAINT fk_cfdi FOREIGN KEY(fkidcfdi) REFERENCES cfdi(idCFDI)  
);
-- Creación de tabla pago
CREATE TABLE pago(
    claveRastreo         VARCHAR(30) NOT NULL,
    monto                DOUBLE NOT NULL,
    formaPago            VARCHAR(30) NOT NULL,
    fecha                DATE NOT NULL,
    ObsAutorizacion      VARCHAR(40) NOT NULL,
    fkidPedido           VARCHAR(30) NOT NULL,
    CONSTRAINT pk_pago PRIMARY KEY(claveRastreo),
    CONSTRAINT fk_pedido FOREIGN KEY(fkidPedido) REFERENCES pedido(idPedido)
);
-- Creación de tabla login
CREATE TABLE login(
    idUsuario      VARCHAR(10) NOT NULL,
    usuario        VARCHAR(15) NOT NULL,
    contrasena     VARCHAR(30) NOT NULL,
    activacion     INT NOT NULL,
    token          VARCHAR(40),
    token_password VARCHAR(40) NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY(idUsuario)
);
