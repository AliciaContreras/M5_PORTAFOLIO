-- =====================================================================
-- 3: Utilizar Lenguaje de Manipulación de Datos (DML)
-- =====================================================================

USE universo_db;

-- ---------------------------------------------------------------------
-- 1. Inserción de Datos (INSERT)
-- Escenario: Se ha descubierto un nuevo exoplaneta y se debe registrar
-- tanto el objeto como su primera observación en el sistema.
-- ---------------------------------------------------------------------

-- Primero, se inserta el nuevo objeto celeste en el catálogo.
INSERT INTO Objetos_Celestes (nombre_comun, tipo_objeto, distancia_ly, descripcion)
VALUES ('Próxima Centauri b', 'Planeta', 4.24, 'Exoplaneta rocoso que orbita dentro de la zona habitable de la estrella Próxima Centauri.');

-- Segundo, se registra la observación que confirmó su descubrimiento.
-- (Asumiendo que el `id_objeto` generado para 'Próxima Centauri b' es 3).
INSERT INTO Observaciones (fecha_observacion, telescopio_usado, notas, id_objeto)
VALUES ('2016-08-24', 'Telescopio de 3.6m de ESO', 'Confirmación final mediante el método de velocidad radial.', 3);


-- ---------------------------------------------------------------------
-- 2. Actualización de Datos (UPDATE)
-- Escenario: Nuevas mediciones del Telescopio Espacial James Webb han
-- proporcionado una estimación de distancia más precisa para la "Nebulosa de Orión".
-- Se debe actualizar el registro correspondiente.
-- ---------------------------------------------------------------------
UPDATE Objetos_Celestes
SET 
    distancia_ly = 1345.50,
    descripcion = 'Una de las nebulosas más brillantes. Nuevas mediciones confirman una distancia de 1345.50 años luz.'
WHERE 
    nombre_comun = 'Nebulosa de Orión';


-- ---------------------------------------------------------------------
-- 3. Eliminación de Datos (DELETE)
-- Escenario: Una observación registrada fue invalidada debido a una
-- falla en los instrumentos del telescopio. Se debe eliminar el registro
-- erróneo de la base de datos.
-- ---------------------------------------------------------------------

-- Primero, se inserta un registro que simularemos como erróneo.
INSERT INTO Observaciones (fecha_observacion, telescopio_usado, notas, id_objeto)
VALUES ('2025-01-10', 'Observatorio de La Silla', 'Datos corruptos por falla del sensor.', 2);

-- Ahora, se elimina la observación específica usando su clave primaria.
-- (Asumiendo que el `id_observacion` generado para el registro erróneo es 4).
DELETE FROM Observaciones 
WHERE 
    id_observacion = 4;

-- IMPORTANTE: Una sentencia DELETE sin la cláusula WHERE eliminaría
-- TODOS los registros de la tabla. Por ejemplo, la siguiente consulta (comentada
-- para seguridad) vaciaría la tabla de observaciones por completo:
-- DELETE FROM Observaciones;