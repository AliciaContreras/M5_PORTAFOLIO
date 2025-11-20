-- =====================================================================
-- 2: Utilizar Lenguaje Estructurado de Consultas (SQL)
-- =====================================================================

USE universo_db;
-- ---------------------------------------------------------------------
-- Consulta 1: Selección simple con filtrado (Cláusula WHERE)
-- Objetivo: Obtener todos los objetos celestes que son de tipo 'Galaxia'.
-- ---------------------------------------------------------------------
SELECT 
    nombre_comun, 
    tipo_objeto, 
    distancia_ly
FROM 
    Objetos_Celestes
WHERE 
    tipo_objeto = 'Galaxia';

-- ---------------------------------------------------------------------
-- Consulta 2: Combinación de tablas (Cláusula JOIN)
-- Objetivo: Obtener todas las observaciones realizadas para la "Galaxia de Andrómeda".
-- ---------------------------------------------------------------------
SELECT
    oc.nombre_comun AS 'Objeto Observado',
    o.fecha_observacion,
    o.telescopio_usado,
    o.notas
FROM 
    Observaciones o
JOIN 
    Objetos_Celestes oc ON o.id_objeto = oc.id_objeto
WHERE
    oc.nombre_comun = 'Galaxia de Andrómeda';

-- ---------------------------------------------------------------------
-- Consulta 3: Agrupación de datos y funciones de agregación (GROUP BY y COUNT)
-- Objetivo: Contar cuántas observaciones se han registrado para cada objeto celeste.
-- ---------------------------------------------------------------------
SELECT
    oc.nombre_comun,
    COUNT(o.id_observacion) AS 'Numero_de_Observaciones'
FROM
    Objetos_Celestes oc
LEFT JOIN
    Observaciones o ON oc.id_objeto = o.id_objeto
GROUP BY
    oc.nombre_comun
ORDER BY
    Numero_de_Observaciones DESC;

-- ---------------------------------------------------------------------
-- Consulta 4: Filtrado con múltiples condiciones y ordenamiento (AND, OR, ORDER BY)
-- Objetivo: Encontrar todas las observaciones de la "Galaxia de Andrómeda" O
-- cualquier observación realizada con el "James Webb Space Telescope".
-- ---------------------------------------------------------------------
SELECT
    oc.nombre_comun,
    o.fecha_observacion,
    o.telescopio_usado
FROM
    Observaciones o
JOIN
    Objetos_Celestes oc ON o.id_objeto = oc.id_objeto
WHERE
    oc.nombre_comun = 'Galaxia de Andrómeda'
    OR o.telescopio_usado = 'James Webb Space Telescope'
ORDER BY
    o.fecha_observacion ASC; -- Ordenar cronológicamente