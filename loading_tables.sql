-- CREATE DATABASE AND WAREHOUSE
CREATE OR REPLACE DATABASE DE-SNOWFLAKE-AWS;
CREATE OR REPLACE WAREHOUSE RETAIL_WH;

USE DE_SNOWFLAKE_AWS;

-- Linking AWS to Snowflake
CREATE OR REPLACE STAGE s3_stage
URL = 's3://de-snowflake-raw/'
CREDENTIALS = (AWS_KEY_ID = '' AWS_SECRET_KEY = '');

LIST @s3_stage;

-- Table tipo_gasto

CREATE  or replace table tipo_gasto(
Id_Gasto int,
descripcion varchar(50),
Monto int 
);

COPY INTO tipo_gasto
FROM @s3_stage/TiposDeGasto.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);

SELECT * FROM tipo_gasto;


-- Table venta ------------------

CREATE  or replace table venta(
Id_Venta int,
fecha date,
fecha_entrega date,
id_Canal int,
Id_Cliente int,
Id_Sucursal int,
Id_Empleado int,
Id_Producto int,
Precio decimal(10,2),
Cantidad int
);

COPY INTO venta
FROM @s3_stage/Venta.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

SELECT * FROM venta limit 10;


-- Table canal ------------------

CREATE  or replace table canal(
id_canal int,
canal_nombre varchar(50)
);


COPY INTO canal
FROM @s3_stage/CanalDeVenta.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);


SELECT * FROM canal limit 10;

-- Table Clientes ------------------
-- columns: ID	Provincia	Nombre_y_Apellido	Domicilio	Telefono	Edad	Localidad	X	Y	Fecha_Alta	Usuario_Alta	Fecha_Ultima_Modificacion	Usuario_Ultima_Modificacion	Marca_Baja	col10


CREATE  or replace table clientes(
id_cliente int,
provincia varchar(200),  
nombre_y_apellido varchar(200),
domicilio varchar(200),
telefono varchar(50),
edad int,
localidad varchar(50),
x VARCHAR(20),
y VARCHAR(20),
fecha_alta date,
usuario_alta varchar(50),
fecha_ultima_modificacion date,
usuario_ultima_modificacion varchar(50),
marca_baja varchar(50),
col10 varchar(50)
);

COPY INTO clientes
FROM @s3_stage/Clientes.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ';' SKIP_HEADER = 1);

SELECT * FROM clientes limit 10;

-- Table Compra ------------------
-- Columns: IdCompra	Fecha	IdProducto	Cantidad	Precio	IdProveedor

CREATE  or replace table compra(
id_compra int,
fecha date,
id_producto int,
cantidad int,
precio decimal(10,2),
id_proveedor int
);

COPY INTO compra
FROM @s3_stage/Compra.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

SELECT * FROM compra limit 10;

-- Table Empleados ------------------
-- Columns: ID_empleado	Apellido	Nombre	Sucursal	Sector	Cargo	Salario

CREATE  or replace table empleados(
id_empleado int,
apellido varchar(50),
nombre varchar(50),
sucursal varchar(50),
sector varchar(50),
cargo varchar(50),
salario decimal(10,2)
);

COPY INTO empleado
FROM @s3_stage/Empleados.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

SELECT * FROM empleados limit 10;

-- Table Gasto ------------------
-- Columns: IdGasto	IdSucursal	IdTipoGasto	Fecha	Monto

CREATE  or replace table gasto(
id_gasto int,
id_sucursal int,
id_tipo_gasto int,
fecha date,
monto decimal(10,2)
);

COPY INTO gasto
FROM @s3_stage/Gasto.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

SELECT * FROM gasto limit 10;


-- Table Producto ------------------
-- Columns: ID	ID_PRODUCTO	Concepto	Tipo	 Precio 

CREATE  or replace table producto(
id int,
id_producto int,
producto varchar(50),
tipo varchar(50),
precio decimal(10,2)
);

COPY INTO producto
FROM @s3_stage/Producto.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

SELECT * FROM producto limit 10;

-- Table Proveedor ------------------
-- Columns: IDProveedor	Nombre	Address	City	State	Country	departamen

CREATE  or replace table proveedor(
id_proveedor int,
nombre varchar(50),
direccion varchar(50),
ciudad varchar(50),
estado varchar(50),
pais varchar(50),
departamento varchar(50)
);

COPY INTO proveedor
FROM @s3_stage/Proveedores.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

SELECT * FROM proveedor limit 10;


-- Table Sucursal ------------------
-- Columns: ID	Sucursal	Direccion	Localidad	Provincia	Latitud	Longitud

CREATE  or replace table sucursal(
id_sucursal int,
sucursal varchar(50),
direccion varchar(50),
localidad varchar(50),
provincia varchar(50),
latitud varchar(50),
longitud varchar(50)
);

COPY INTO sucursal
FROM @s3_stage/Sucursales.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ';' SKIP_HEADER = 1);

SELECT * FROM sucursal limit 10;


-- Table Venta ------------------
-- Columns: IdVenta	Fecha	Fecha_Entrega	IdCanal	IdCliente	IdSucursal	IdEmpleado	IdProducto	Precio	Cantidad

CREATE  or replace table venta(
id_venta int,
fecha date,
fecha_entrega date,
id_canal int,
id_cliente int,
id_sucursal int,
id_empleado int,
id_producto int,
precio decimal(10,2),
cantidad int
);

COPY INTO venta
FROM @s3_stage/Venta.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1);

SELECT * FROM venta limit 10;














