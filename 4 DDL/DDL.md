# 4. Documentación del Lenguaje de Definición de Datos (DDL)

## Introducción

Este documento describe el uso del Lenguaje de Definición de Datos (DDL) para la creación y mantenimiento de la estructura de la base de datos `universo_db`. Las sentencias DDL, como `CREATE`, `ALTER` y `DROP`, son fundamentales para definir los objetos de la base de datos y adaptar el esquema a medida que los requerimientos del proyecto evolucionan.

---

### 1. Creación de Nuevos Objetos (`CREATE TABLE`)

La sentencia `CREATE` se utiliza para construir nuevos objetos dentro de la base de datos, siendo `CREATE TABLE` la más común.

**Escenario Aplicado: Creación de la Tabla `Telescopios`**
Para cumplir con el requerimiento de crear una nueva tabla, se adaptó el escenario a la creación de una tabla `Telescopios`. Originalmente, la tabla `Observaciones` almacenaba el nombre del telescopio como un campo de texto, lo que generaba redundancia y potencial de inconsistencias (errores de tipeo).

La creación de la tabla `Telescopios` permitió normalizar la base de datos. Esta nueva tabla almacena de forma centralizada la información de cada telescopio, como su nombre, tipo y diámetro, utilizando una clave primaria (`id_telescopio`) para identificar cada uno de forma única.

---

### 2. Modificación de Estructuras Existentes (`ALTER TABLE`)

La sentencia `ALTER TABLE` es una herramienta poderosa que permite modificar la estructura de una tabla existente sin necesidad de borrarla y volverla a crear.

**Escenario Aplicado: Relacionar `Observaciones` con `Telescopios`**
Una vez creada la tabla `Telescopios`, fue necesario modificar la tabla `Observaciones` para que utilizara esta nueva estructura. Este proceso se realizó en varios pasos lógicos:
1.  **Añadir una nueva columna**: Se utilizó `ALTER TABLE ... ADD COLUMN` para agregar una columna `id_telescopio` a la tabla `Observaciones`, destinada a funcionar como clave foránea.
2.  **Poblar los datos**: Se ejecutaron sentencias `UPDATE` para llenar la nueva columna con los IDs correspondientes de la tabla `Telescopios`, basándose en el texto de la columna antigua.
3.  **Establecer la relación**: Se usó `ALTER TABLE ... ADD CONSTRAINT` para definir formalmente la clave foránea, enlazando `Observaciones` con `Telescopios` y garantizando así la integridad referencial.
4.  **Eliminar la columna redundante**: Finalmente, se empleó `ALTER TABLE ... DROP COLUMN` para eliminar la columna de texto original (`telescopio_usado`), completando el proceso de normalización y eliminando la redundancia.

Este proceso demuestra cómo `ALTER TABLE` se utiliza para hacer evolucionar un esquema de base de datos de manera controlada.

---

### 3. Eliminación de Objetos (`DROP TABLE`)

La sentencia `DROP` se utiliza para eliminar permanentemente un objeto de la base de datos.

**Escenario Aplicado: Eliminar una Tabla Temporal**
Se simuló la creación de una tabla `Analisis_Temporal` para un estudio específico. Una vez que el análisis concluyó, dicha tabla dejó de ser necesaria.

La sentencia `DROP TABLE Analisis_Temporal` se utilizó para eliminar por completo la tabla. Es importante destacar que esta operación es irreversible: borra tanto la estructura de la tabla como todos los datos que contiene, por lo que debe usarse con extrema precaución en un entorno de producción.