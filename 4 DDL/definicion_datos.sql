-- =====================================================================
-- 4: Utilizar Lenguaje de Definición de Datos (DDL)
-- =====================================================================

USE universo_db;

-- ---------------------------------------------------------------------
-- 1. Creación de una nueva tabla (CREATE TABLE)
-- Escenario: Crear una tabla para almacenar información
-- sobre los Telescopios utilizados en las observaciones. Esto permite
-- normalizar la base de datos, evitando repetir el nombre del telescopio
-- en cada observación.
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Telescopios (
    id_telescopio       INT AUTO_INCREMENT PRIMARY KEY,
    nombre_telescopio   VARCHAR(255) NOT NULL UNIQUE,
    tipo_telescopio     ENUM('Reflector', 'Refractor', 'Radiotelescopio', 'Espacial') NOT NULL,
    diametro_metros     DECIMAL(6, 2),
    fecha_lanzamiento   DATE COMMENT 'Aplica solo a telescopios espaciales'
);

-- Se insertan algunos datos para que la tabla tenga contenido.
INSERT INTO Telescopios (nombre_telescopio, tipo_telescopio, diametro_metros, fecha_lanzamiento) VALUES
('Hubble Space Telescope', 'Espacial', 2.4, '1990-04-24'),
('James Webb Space Telescope', 'Espacial', 6.5, '2021-12-25'),
('Telescopio de 3.6m de ESO', 'Reflector', 3.6, NULL);


-- ---------------------------------------------------------------------
-- 2. Modificación de una tabla existente (ALTER TABLE)
-- Escenario: La tabla `Observaciones` actualmente almacena el nombre del
-- telescopio como un simple texto (`VARCHAR`). Ahora que existe una tabla
-- `Telescopios`, se modifica `Observaciones` para que se relacione
-- con la nueva tabla mediante una clave foránea.
-- ---------------------------------------------------------------------

-- 2.1: Añadir una nueva columna para la clave foránea.
-- Se declara como `NULL` para poder poblarla después.
ALTER TABLE Observaciones
ADD COLUMN id_telescopio INT NULL;

-- 2.2: Poblar la nueva columna con los IDs correspondientes.
-- Se actualizan los registros existentes para que apunten al ID correcto
-- de la tabla Telescopios.
UPDATE Observaciones SET id_telescopio = 1 WHERE telescopio_usado = 'Hubble Space Telescope';
UPDATE Observaciones SET id_telescopio = 2 WHERE telescopio_usado = 'James Webb Space Telescope';
UPDATE Observaciones SET id_telescopio = 3 WHERE telescopio_usado = 'Telescopio de 3.6m de ESO';

-- 2.3: Añadir la restricción de clave foránea.
-- Esto formaliza la relación entre `Observaciones` y `Telescopios`.
ALTER TABLE Observaciones
ADD CONSTRAINT fk_observacion_telescopio
FOREIGN KEY (id_telescopio) REFERENCES Telescopios(id_telescopio);

-- 2.4: Eliminar la columna antigua.
-- Una vez que la nueva clave foránea está funcionando, la columna
-- `telescopio_usado` es redundante y puede ser eliminada para
-- completar la normalización.
ALTER TABLE Observaciones
DROP COLUMN telescopio_usado;


-- ---------------------------------------------------------------------
-- 3. Eliminación de un objeto de la base de datos (DROP TABLE)
-- Escenario: Se crea una tabla temporal para un análisis que ya ha
-- concluido. La tabla ya no es necesaria y debe ser eliminada.
-- ---------------------------------------------------------------------

-- Se crea una tabla de ejemplo para el análisis.
CREATE TABLE IF NOT EXISTS Analisis_Temporal (
    id_analisis INT PRIMARY KEY,
    resultado   TEXT
);

-- Una vez que el trabajo está hecho, se elimina la tabla por completo.
-- Esta acción es irreversible y elimina tanto la estructura
-- como todos los datos de la tabla.
DROP TABLE IF EXISTS Analisis_Temporal;