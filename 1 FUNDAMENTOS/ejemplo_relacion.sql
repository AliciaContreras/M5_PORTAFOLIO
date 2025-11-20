-- Active: 1755911105013@@127.0.0.1@3306@universo_db
-- =====================================================================
-- 1: Fundamentos de BD Relacional
-- =====================================================================

-- Se establece una base de datos única para todo el proyecto.
CREATE DATABASE IF NOT EXISTS universo_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE universo_db;

-- -----------------------------------------------------
-- Tabla 1: `Objetos_Celestes`
-- Almacena información única sobre cada objeto astronómico.
-- `id_objeto` es la Clave Primaria (PK).
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Objetos_Celestes (
    id_objeto           INT AUTO_INCREMENT PRIMARY KEY,
    nombre_comun        VARCHAR(255) NOT NULL UNIQUE,
    tipo_objeto         ENUM('Estrella', 'Galaxia', 'Nebulosa', 'Planeta') NOT NULL,
    distancia_ly        DECIMAL(20, 4) COMMENT 'Distancia en años luz',
    descripcion         TEXT
);

-- -----------------------------------------------------
-- Tabla 2: `Observaciones`
-- Almacena cada evento de observación.
-- `id_observacion` es la Clave Primaria (PK).
-- `id_objeto` es la Clave Foránea (FK) que se relaciona
-- con la tabla `Objetos_Celestes`.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Observaciones (
    id_observacion      INT AUTO_INCREMENT PRIMARY KEY,
    fecha_observacion   DATE NOT NULL,
    telescopio_usado    VARCHAR(100),
    notas               TEXT,
    -- Este es el campo que contendrá el enlace
    id_objeto           INT NOT NULL,
    -- Aquí se define formalmente la relación entre las dos tablas
    CONSTRAINT fk_observacion_objeto
        FOREIGN KEY (id_objeto) REFERENCES Objetos_Celestes(id_objeto)
);


-- -----------------------------------------------------
-- Inserción de datos de ejemplo para ilustrar la relación
-- -----------------------------------------------------

-- Insertar algunos objetos celestes
INSERT INTO Objetos_Celestes (nombre_comun, tipo_objeto, distancia_ly, descripcion) VALUES
('Galaxia de Andrómeda', 'Galaxia', 2537000.00, 'La galaxia espiral más cercana a la Vía Láctea.'),
('Nebulosa de Orión', 'Nebulosa', 1344.00, 'Una de las nebulosas más brillantes y visibles a simple vista.');

-- Insertar observaciones relacionadas con los objetos anteriores
INSERT INTO Observaciones (fecha_observacion, telescopio_usado, notas, id_objeto) VALUES
('2024-10-15', 'Hubble Space Telescope', 'Imágenes de alta resolución del bulbo galáctico.', 1),
('2024-11-05', 'James Webb Space Telescope', 'Análisis espectrográfico de las regiones de formación estelar.', 2),
('2024-11-20', 'Hubble Space Telescope', 'Seguimiento de estrellas variables en Andrómeda.', 1);

-- Mensaje de finalización
SELECT 'Tablas `Objetos_Celestes` y `Observaciones` creadas y relacionadas exitosamente.' AS Estatus;