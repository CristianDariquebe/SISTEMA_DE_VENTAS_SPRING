-- =============================================
-- Creación de la Base de Datos
-- =============================================
CREATE DATABASE COMPUVENTAS;

--DROP DATABASE IF EXISTS COMPUVENTAS;




-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE COMPUVENTAS;
--SET NAMES 'utf8';


-- =============================================
-- CREACION DE TABLAS
-- =============================================

CREATE TABLE EMPLEADO
(
	idemp                INTEGER AUTO_INCREMENT,
	nombre               VARCHAR(50) NOT NULL,
	apellido             VARCHAR(50) NOT NULL,
	email                VARCHAR(50) NOT NULL,
	telefono             VARCHAR(20) NULL,
	dni                  VARCHAR(15) NOT NULL,
	direccion            VARCHAR(100) NOT NULL,
	CONSTRAINT PK_EMPLEADO PRIMARY KEY (idemp)
);



CREATE TABLE USUARIO
(
	idemp                INTEGER NOT NULL,
	usuario              VARCHAR(20) NOT NULL,
	clave                VARCHAR(40) NOT NULL,
	estado               NUMERIC(2,0) NOT NULL  CHECK ( estado IN (1, 0) ),
	CONSTRAINT PK_USUARIO PRIMARY KEY (idemp),
	CONSTRAINT FK_USUARIO_EMPLEADO FOREIGN KEY (idemp) REFERENCES EMPLEADO (idemp)
);



CREATE TABLE ROL
(
	idrol                INTEGER AUTO_INCREMENT,
	nombre               VARCHAR(30) NOT NULL,
	descripcion          VARCHAR(150) NOT NULL,
	estado               NUMERIC(2,0) NOT NULL CHECK ( estado IN (1, 0) ),
	CONSTRAINT PK_ROL PRIMARY KEY (idrol)
);



CREATE TABLE PERMISO
(
	idrol                INTEGER NOT NULL,
	idemp                INTEGER NOT NULL,
	estado               NUMERIC(2,0) NOT NULL CHECK ( estado IN (1, 0) ),
	CONSTRAINT PK_PERMISO PRIMARY KEY (idrol,idemp),
	CONSTRAINT FK_PERMISO_USUARIO FOREIGN KEY FK_PERMISO_USUARIO (idemp) REFERENCES USUARIO (idemp),
	CONSTRAINT FK_PERMISO_ROL     FOREIGN KEY FK_PERMISO_ROL (idrol) REFERENCES ROL (idrol)
);


-- =============================================
-- INGRESO DE DATOS
-- =============================================


-- Tabla EMPLEADO

--    idemp   nombre    apellido  email     telefono   dni       direccion  estado   

INSERT INTO EMPLEADO 
VALUES(1001,'CRISTIAN JULIAN','DARIQUEBE LAURA','cdariquebe@gmail.com','98456732','98435687','OLIVOS');

INSERT INTO EMPLEADO 
VALUES(1002,'ALEX TORRES','TORRES TORRES','atorres@gmail.com','967345634','56423698','MOLINA');

INSERT INTO EMPLEADO  
VALUES(1003,'JUAN NOLBERTO','GUTIERREZ FERNANDEZ','jgutierrez@gmail.com','995466783','56324587','LINCE');

INSERT INTO EMPLEADO  
VALUES(1004,'FERNANDA LEONOR','CORONEL CARRASCO','fcoronel@gmail.com','986754373','45963258','LIMA');

INSERT INTO EMPLEADO  
VALUES(1005,'JUAN CARLOS','ROMERO CARRASCO','jcarlos@gmail.com','986544521','45636545','LA MOLINA');

INSERT INTO EMPLEADO  
VALUES(1006,'ALICIA JANETH','ARBIETO MENDOZA','aarbieto@gmail.com','975698451','96584521','LA MOLINA');

INSERT INTO EMPLEADO  
VALUES(1007,'CRISTINA ELENA','ALFARO VELAZQUE','calfarov@gmail.com','965486267','10365845','LOS OLIVOS');


-- Tabla USUARIO

-- idemp   usuario   clave   estado 

INSERT INTO USUARIO VALUES(1001,'cristian',SHA('dariquebe'),1);
INSERT INTO USUARIO VALUES(1002,'alex',SHA('torres'),1);
INSERT INTO USUARIO VALUES(1003,'juan',SHA('princesa'),1);
INSERT INTO USUARIO VALUES(1004,'leonor',SHA('cerebro'),1);
INSERT INTO USUARIO VALUES(1006,'janeth',SHA('felicidad'),1);
INSERT INTO USUARIO VALUES(1007,'cristina',SHA('encantadora'),1);


-- Tabla: ROLES

-- idrol       nombre       descripcion        estado      

INSERT INTO ROL VALUES(1,'Administrador','No tiene ningun tipo de restricción',1);
INSERT INTO ROL VALUES(2,'Vendeor','Tiene acceso a los módulos de Ventas y Consultas',1);
INSERT INTO ROL VALUES(3,'Operador','Tiene acceso a los módulos de Mantenimiento, Consultas y Reportes',1);
INSERT INTO ROL VALUES(4,'Usuario','Tiene acceso a los módulos de Consultas y Reportes',1);



-- Tabla: PERMISOS

-- idrol   idemp    estado

-- Usuario 1001

INSERT INTO PERMISO VALUES(1,1001,1);
INSERT INTO PERMISO VALUES(2,1001,0);
INSERT INTO PERMISO VALUES(3,1001,0);
INSERT INTO PERMISO VALUES(4,1001,0);


-- Usuario 1002

INSERT INTO PERMISO VALUES(1,1002,0);
INSERT INTO PERMISO VALUES(2,1002,1);
INSERT INTO PERMISO VALUES(3,1002,0);
INSERT INTO PERMISO VALUES(4,1002,0);


-- Usuario 1003

INSERT INTO PERMISO VALUES(1,1003,0);
INSERT INTO PERMISO VALUES(2,1003,0);
INSERT INTO PERMISO VALUES(3,1003,1);
INSERT INTO PERMISO VALUES(4,1003,0);


-- Usuario 1004

INSERT INTO PERMISO VALUES(1,1004,0);
INSERT INTO PERMISO VALUES(2,1004,0);
INSERT INTO PERMISO VALUES(3,1004,0);
INSERT INTO PERMISO VALUES(4,1004,1);


-- Usuario 1006

INSERT INTO PERMISO VALUES(1,1006,0);
INSERT INTO PERMISO VALUES(2,1006,0);
INSERT INTO PERMISO VALUES(3,1006,1);
INSERT INTO PERMISO VALUES(4,1006,0);

-- Usuario 1007

INSERT INTO PERMISO VALUES(1,1007,0);
INSERT INTO PERMISO VALUES(2,1007,1);
INSERT INTO PERMISO VALUES(3,1007,0);
INSERT INTO PERMISO VALUES(4,1007,0);


-- =============================================
-- USUARIO PARA LAS APLICACIONES
-- =============================================

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'ventas'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON *.* TO 'ventas'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;

USE COMPUVENTAS;


-- =============================================
-- Crea las tablas
-- =============================================


CREATE TABLE CATEGORIA
(
	idcat                INTEGER AUTO_INCREMENT,
	nombre               VARCHAR(50) NOT NULL,
	descripcion          TEXT NOT NULL,
	CONSTRAINT PK_CATEGORIA PRIMARY KEY (idcat)
);



CREATE TABLE PRODUCTO
(
	idprod               INTEGER AUTO_INCREMENT,
	idcat                INTEGER NOT NULL,
	nombre               VARCHAR(100) NOT NULL,
	descripcion          TEXT NOT NULL,
	precio               NUMERIC(10,2) NOT NULL,
	stock                INTEGER NOT NULL,
	CONSTRAINT PK_PRODUCTO PRIMARY KEY (idprod),
	FOREIGN KEY FK_PRODUCTO_CATEGORIA (idcat) REFERENCES CATEGORIA (idcat)
);



CREATE TABLE PROMOCION
(
	idprom               INTEGER AUTO_INCREMENT,
	fecInicio            DATE NOT NULL,
	fecFin               DATE NOT NULL,
	precio               NUMERIC(10,2) NOT NULL,
	oferta               NUMERIC(10,2) NOT NULL,
	idprod               INTEGER NOT NULL,
	estado               INTEGER NOT NULL,
	CONSTRAINT PK_PROMOCION PRIMARY KEY (idprom),
	FOREIGN KEY FK_PROMOCION_PRODUCTO (idprod) REFERENCES PRODUCTO (idprod)
);



CREATE TABLE CAMPANIA
(
	idcamp               INTEGER AUTO_INCREMENT,
	nombre               VARCHAR(150) NOT NULL,
	descripcion          TEXT NOT NULL,
	idcat				 INTEGER NOT NULL,	
	fecInicio            DATE NOT NULL,
	fecFin               DATE NOT NULL,
	porcDcto             NUMERIC(10,2) NOT NULL,
	estado               INTEGER NOT NULL,
	CONSTRAINT PK_CAMPANIA PRIMARY KEY (idcamp),
	FOREIGN KEY FK_CAMPANIA_CATEGORIA (idcat) REFERENCES CATEGORIA (idcat)
);



-- =============================================
-- Datos
-- =============================================

-- Tabla CATEGORIA

INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(1,'COMPUTADORA GAMER','Marca AZUS, velocidad 16 GB memoria Ram ');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(2,'COMPUTADORA STANDAR','Marca Dell, Velocidad 8GB memoria Ram ');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(3,'LAPTOP GAMER','Marca Toshiba, core i7');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(4,'LAPTOP STANDAR','Marca HP, core i5');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(5,'MINI COMPUTADORA','Marca Samsung, intel core');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(6,'MINI LAPTOP','Marca LG, intel core 2.6');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(7,'TECLADOS','Teclados gamer, teclados standar');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(8,'DISCO DURO','1 TB, 500 GB');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(9,'MONITORES','Mejores pantallas con buena resolucion');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(10,'MOUSE','Todo tipo de mouse gamer y clasico');


-- Tabla PRODUCTO

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION)
VALUES(1,1,'COMPUTADORA OPTIMUS',3000,100,'La mejor computadora en velocidad para juegos');

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION)
VALUES(2,7,'COMPUTADORA CLASICA',1700,100,'Computadora adecuada para trabajos en formato');

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION)
VALUES(3,1,'LAPTOP GAMAER',1800,100,'Es una laptop portatil que puedes llevarlo contigo');

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION)
VALUES(4,7,'LAPTOP STANDAR',2000,100,'Laptop que te puede servir para diferentes trabajos de estudio');

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION)
VALUES(5,6,'DISCO DURO',150.00,250,'Este producto obtimizado para cualquier pc');

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION)
VALUES(6,6,'MONITOR DE PC',110.00,350,'Las mejores resoluciones en pantalla');

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION)
VALUES(7,6,'MOUSE',30.0,450,'Diferentes tipos de mouse');



-- Tabla PROMOCION


-- idprom    fecInicio  fecFin     precio     oferta     idprod     estado     anulado   

INSERT INTO PROMOCION VALUES(1,'20160701','20160731',90.0,70.0,1,1);
INSERT INTO PROMOCION VALUES(2,'20161101','20161130',130.0,100.0,3,1);


--Tabla de Campania

--	idcamp nombre descripcion	idcat fecInicio fecFin porcDcto estado

INSERT INTO CAMPANIA VALUES(101,'DDLM','Navidad',5,'20161201','20161215',0.4,1);
INSERT INTO CAMPANIA VALUES(102,'DDLP','Fiestas Patrias',6,'20161216','20161231',0.3,1);




-- =============================================
-- Crea las tablas
-- =============================================

CREATE TABLE VENTA
(
	idventa              INTEGER AUTO_INCREMENT,
	idemp                INTEGER NOT NULL,
	cliente              VARCHAR(100) NOT NULL,
	fecha                DATE NOT NULL,
	importe              NUMERIC(10,2) NOT NULL,
	impuesto             NUMERIC(10,2) NOT NULL,
	total                NUMERIC(10,2) NOT NULL,
	CONSTRAINT PK_VENTA PRIMARY KEY (idventa),
	FOREIGN KEY FK_VENTA_USUARIO (idemp) REFERENCES USUARIO (idemp)
);



CREATE TABLE TIPO_PAGO
(
	idtipo               INTEGER NOT NULL,
	nombre               VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TIPO_PAGO PRIMARY KEY (idtipo)
);



CREATE TABLE PAGO
(
	idpago               INTEGER AUTO_INCREMENT,
	idventa              INTEGER NOT NULL,
	idtipo               INTEGER NOT NULL,
	detalle              VARCHAR(100) NOT NULL,
	importe              NUMERIC(10,2) NOT NULL,
	obs                  VARCHAR(1000) NOT NULL,
	CONSTRAINT PK_PAGO PRIMARY KEY (idpago),
	FOREIGN KEY FK_PAGO_VENTA (idventa) REFERENCES VENTA (idventa),
	FOREIGN KEY FK_PAGO_TIPO_PAGO (idtipo) REFERENCES TIPO_PAGO (idtipo)
);



CREATE UNIQUE INDEX U_PAGO_UNIQUE ON PAGO
(
	idventa,
	idtipo
);



CREATE TABLE DETALLE
(
	iddetalle            INTEGER AUTO_INCREMENT,
	idventa              INTEGER NOT NULL,
	idprod               INTEGER NOT NULL,
	cant                 INTEGER NOT NULL,
	precatalogo          NUMERIC(10,2) NOT NULL,
	preventa             NUMERIC(10,2) NULL,
	subtotal             NUMERIC(10,2) NULL,
	CONSTRAINT PK_DETALLE PRIMARY KEY (iddetalle),
	FOREIGN KEY FK_DETALLE_PRODUCTO (idprod) REFERENCES PRODUCTO (idprod),
	FOREIGN KEY FK_DETALLE_VENTA (idventa) REFERENCES VENTA (idventa)
);



CREATE UNIQUE INDEX U_DETALLE ON DETALLE
(
	idventa,
	idprod
);



-- =============================================
-- Datos
-- =============================================

INSERT INTO TIPO_PAGO(IDTIPO,NOMBRE) VALUES(1,'EFECTIVO');
INSERT INTO TIPO_PAGO(IDTIPO,NOMBRE) VALUES(2,'TARJETA CREDITO');
INSERT INTO TIPO_PAGO(IDTIPO,NOMBRE) VALUES(3,'TARJETA DE DEBITO');
INSERT INTO TIPO_PAGO(IDTIPO,NOMBRE) VALUES(5,'NOTA DE CREDITO');
INSERT INTO TIPO_PAGO(IDTIPO,NOMBRE) VALUES(6,'BONO EFECTIVO');
INSERT INTO TIPO_PAGO(IDTIPO,NOMBRE) VALUES(7,'VUELTO');




create view v_promocion(idprom, fecinicio, fecfin, idprod, nombre, pactual, precio, oferta, estado)
as 
select 
	b.idprom, b.fecinicio, b.fecfin, b.idprod, a.nombre, 
	a.precio, b.precio, b.oferta, b.estado 
from producto a
join promocion b on a.idprod = b.idprod;



create view v_pago(idpago, idventa, tipopago, detalle, importe, obs)
as 
select 
	a.idpago, a.idventa, b.nombre, a.detalle, a.importe, a.obs
from pago a 
join tipo_pago b on a.idtipo = b.idtipo;


