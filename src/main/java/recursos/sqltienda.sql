######## Creacion y uso de la base de datos ########
#CREATE DATABASE **********;
USE **********;

######## modulo de login y usuarios ########
CREATE TABLE usuarios (
    cedula_usuario BIGINT PRIMARY KEY,
    email_usuario VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL
); 

INSERT INTO usuarios VALUES(001,'ps.joan3@gmail.com','Sebastian Pabon','admin123456','admininicial');
INSERT INTO usuarios VALUES(002,'ps.joan3@gmail.com','Sebastian Pabon','pass','user');
INSERT INTO usuarios VALUES(003,'ps.joan3@gmail.com','Sebastian Pabon','pass2','user2');



CREATE UNIQUE INDEX usuario_unico 
ON usuarios(usuario);

######## modulo de clientes ########
CREATE TABLE clientes (
    cedula_cliente BIGINT PRIMARY KEY,
    direccion_cliente VARCHAR(255) NOT NULL,
    email_cliente VARCHAR(255) NOT NULL,
    nombre_cliente VARCHAR(255) NOT NULL,
    telefono_cliente VARCHAR(255) NOT NULL
);

INSERT INTO clientes VALUES(001,'Calle falsa 123','ps.joan3@gmail.com','Sebastian Pabon','222222222');


######## modulo de proveedores ########
CREATE TABLE proveedores (
    nit_proveedor BIGINT PRIMARY KEY,
    ciudad_proveedor VARCHAR(255) NOT NULL,
    direccion_proveedor VARCHAR(255) NOT NULL,
    nombre_proveedor VARCHAR(255) NOT NULL,
    telefono_proveedor VARCHAR(255) NOT NULL
);

INSERT INTO proveedores VALUES(001,'Cali','Calle 1','Frutas ltda','111111');
INSERT INTO proveedores VALUES(002,'Medellin','Calle 2','Verduras ltda','222222');
INSERT INTO proveedores VALUES(003,'Cucuta','Calle 3','Lacteos ltda','333333');
INSERT INTO proveedores VALUES(004,'Pereira','Calle 4','abc ltda','444444');
INSERT INTO proveedores VALUES(005,'Nariño','Calle 5','xyz ltda','555555');

######## modulo de productos ########
CREATE TABLE productos (
    codigo_producto BIGINT PRIMARY KEY,
    iva_compra DOUBLE NOT NULL,
    nit_proveedor BIGINT NOT NULL,
    nombre_producto VARCHAR(255) NOT NULL,
    precio_compra DOUBLE NOT NULL,
    precio_venta DOUBLE NOT NULL,
    FOREIGN KEY (nit_proveedor) REFERENCES proveedores(nit_proveedor)
);

INSERT INTO productos VALUES(100,0.19,1,'Manzanas',1500.0,2500.0);

######## modulo de ventas ########
create table ventas(
codigo_venta bigint primary key auto_increment,
cedula_cliente bigint,
cedula_usuario bigint,
ivaventa double,
total_venta double,
valor_venta double,
FOREIGN KEY (cedula_cliente) REFERENCES clientes(cedula_cliente)
);

ALTER TABLE ventas
ADD FOREIGN KEY (cedula_usuario) REFERENCES usuarios(cedula_usuario);


######## tabla detalle_ventas del modulo de ventas ########

create table detalle_ventas(
codigo_detalle_venta bigint primary key auto_increment,
cantidad_producto int,
codigo_producto bigint,
codigo_venta bigint,
valor_total double,
valor_venta double,
valoriva double,
FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
);

ALTER TABLE detalle_ventas
ADD FOREIGN KEY (codigo_venta) REFERENCES ventas(codigo_venta);

############# revisar estado de la bd 
select id, user, host, db, command, time, state, info, progress
from information_schema.processlist;

####### obteniendo el siguiente consecutivo en ventas
SELECT `AUTO_INCREMENT`
FROM  INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = '***********'
AND   TABLE_NAME   = 'ventas';


