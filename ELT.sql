
-- Tabla Calendario
CREATE OR REPLACE TABLE TablaCalendario AS
  SELECT 
    DATEADD(DAY, seq4(), '2015-01-01') AS Fecha,
    DATE_PART(YEAR, DATEADD(DAY, seq4(), '2015-01-01')) AS Anio,
    DATE_PART(QUARTER, DATEADD(DAY, seq4(), '2015-01-01')) AS Trimestre,
    DATE_PART(MONTH, DATEADD(DAY, seq4(), '2015-01-01')) AS Mes,
    DATE_PART(DAYOFWEEK, DATEADD(DAY, seq4(), '2015-01-01')) AS DiaSemana,
    DATE_PART(DAY, DATEADD(DAY, seq4(), '2015-01-01')) AS DiaMes
  FROM TABLE(GENERATOR(ROWCOUNT => 3000));

-- Verificar la tabla calendario
SELECT * FROM TablaCalendario order by fecha desc limit 4;


-- Tabla Canal de Venta
-- Sin transformaciones por el momento

-- Tabla Clientes
-- Cambiar , por . en la columna 'x' y 'y'
UPDATE cliente
SET X = TO_DECIMAL(REPLACE(X, ',', '.'),12,10);

UPDATE cliente
SET Y = TO_DECIMAL(REPLACE(Y, ',', '.'),12,10);


-- Tabla Compra 
