![](https://imageio.forbes.com/specials-images/imageserve/61de7798bbf30165eca665bc/0x0.jpg?format=jpg&width=1200)

![Static Badge](https://img.shields.io/badge/Snowflake-gray?style=flat&logo=snowflake)
![Static Badge](https://img.shields.io/badge/AWS--S3-orange?style=flat&logo=redshift)
![Static Badge](https://img.shields.io/badge/SQL-gray?style=flat&logo=SQL)
![Static Badge](https://img.shields.io/badge/Python-green?style=flat&logo=python)
![Static Badge](https://img.shields.io/badge/-Pandas-black?style=flat&logo=pandas)
![Static Badge](https://img.shields.io/badge/Json-gray?style=flat&logo=Json)


# Data Engineering on SQL Snowflake and AWS

## Resumen del proyecto

En este proyecto vamos a crear un data lake en AWS S3 y un data warehouse en Snowflake. Para ello, vamos a utilizar un dataset de una tienda de equipo electrónico, que contiene información sobre las ventas clientes proveedores y productos.

Vamos a realizar las transformaciones necesarias para cargar los datos en el data lake y en el data warehouse de snowflake y mediante commandos de SQL vamos a realizar la transformación del data set y dejar una base de datos normalizada.


## Dataset
El data set cuenta con 10 tablas en formatos csv tanto como en xlsx. Las tablas son las siguientes:

- **Canal de venta**: contiene información sobre los diferentes tipos de formas como se puede crear una venta.
- **Clientes**: Una base de datos de los clientes que han realizado compras en la tienda.
- **Compra**: Contiene información sobre las compras realizadas las sucurales de la tienda.
- **Empleados**: Contiene información sobre los empleados de la tienda.
- **Gasto**: Contiene información sobre los gastos fijos realizados por las sucursales de la tienda.
- **Productos**: Contiene información sobre los productos que se venden en la tienda.
- **Proveedores**: Contiene información sobre los proveedores de los productos que se venden en la tienda.
- **Sucursales**: Contiene información sobre las sucursales de la tienda.
- **Tipos de Gasto**: Contiene información sobre los tipos de gastos que se realizan en las sucursales.
- **Venta**: Contiene información sobre las ventas realizadas en las sucursales de la tienda.

## Arquitectura inicial

![Arquitectura inicial](./src/QuickDBD-Free%20Diagram.png)

## Arquitectura final

![Arquitectura final](./src/QuickDBD-Free%20Diagram%20(1).png)

## ETL

Las transformaciones realizadas en el ETL son las siguientes:

- **Canal de venta**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Clientes**: Se eliminan las columnas que no se van a utilizar, se cambia el nombre de las columnas para que sean más descriptivas ademas que se cambia el formato de las columnas X y Y que ahora son longitud y latitud para que estén en formato decimal (10,12) .

- **Compra**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Empleados**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Gasto**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Productos**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Proveedores**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Sucursales**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Tipos de Gasto**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Venta**: Se eliminan las columnas que no se van a utilizar y se cambia el nombre de las columnas para que sean más descriptivas.

- **Fact**: Se crea una tabla con la información de las ventas y se le agrega una columna con el id de la sucursal.

- **Dim_Producto**: Se crea una tabla con la información de los productos y se le agrega una columna con el id del proveedor.

- **Tabla Calendario**: Se crea una tabla con la información de las fechas.

Estas transformaciones se realizan en el archivo `elt.sql`
