# 3. Documentación de Manipulación de Datos (DML)

## Introducción

Este documento detalla el uso del Lenguaje de Manipulación de Datos (DML) para modificar la información contenida en la base de datos `universo_db`. Se presentan ejemplos prácticos de las sentencias `INSERT`, `UPDATE` y `DELETE`, aplicadas a escenarios realistas dentro del contexto de la gestión de datos astronómicos.

---

### 1. Inserción de Datos (`INSERT`)

La sentencia `INSERT` se utiliza para agregar nuevos registros (filas) a una tabla.

**Escenario Aplicado: Registrar un Nuevo Descubrimiento**
Se simuló el descubrimiento de un nuevo exoplaneta, "Próxima Centauri b". Para registrar este evento correctamente en el sistema, fue necesario realizar dos inserciones:
1.  **Inserción en `Objetos_Celestes`**: Se agregó el nuevo planeta al catálogo principal, con sus atributos como nombre, tipo y distancia.
2.  **Inserción en `Observaciones`**: Se registró la observación que confirmó el descubrimiento, vinculándola al nuevo objeto mediante su clave foránea (`id_objeto`).

**Funcionamiento:**
La sintaxis `INSERT INTO nombre_tabla (columna1, columna2, ...) VALUES (valor1, valor2, ...)` permite especificar las columnas y los valores correspondientes para el nuevo registro. Este proceso demuestra cómo se añaden datos de manera relacional, respetando la integridad de la base de datos.

---

### 2. Actualización de Datos (`UPDATE`)

La sentencia `UPDATE` se utiliza para modificar registros existentes en una tabla.

**Escenario Aplicado: Refinar Datos Existentes**
Se planteó un escenario donde nuevas mediciones de un telescopio avanzado proporcionaron una estimación de distancia más precisa para la "Nebulosa de Orión". Para reflejar esta nueva información, se ejecutó una consulta de actualización.

**Funcionamiento:**
-   **`UPDATE Objetos_Celestes`**: Especifica la tabla que será modificada.
-   **`SET columna1 = nuevo_valor1, ...`**: Define las columnas que se van a cambiar y sus nuevos valores.
-   **`WHERE nombre_comun = 'Nebulosa de Orión'`**: Esta cláusula es **fundamental**. Limita la actualización a un registro específico (o un conjunto de registros) que cumpla la condición. Sin la cláusula `WHERE`, la consulta modificaría **todos los registros** de la tabla, lo que podría causar una pérdida de datos irreparable.

---

### 3. Eliminación de Datos (`DELETE`)

La sentencia `DELETE` se utiliza para eliminar registros de una tabla.

**Escenario Aplicado: Eliminar un Registro Erróneo**
Para cumplir con el requerimiento de eliminar un "pedido no procesado", se adaptó el escenario a la eliminación de un registro de observación que fue invalidado por fallas instrumentales.

**Funcionamiento:**
-   **`DELETE FROM Observaciones`**: Indica la tabla de la cual se eliminará un registro.
-   **`WHERE id_observacion = 4`**: Al igual que en `UPDATE`, la cláusula `WHERE` es crucial. Especifica qué registro exacto debe ser eliminado, generalmente utilizando su clave primaria para evitar ambigüedades. La omisión de la cláusula `WHERE` resultaría en la eliminación de todos los datos de la tabla, por lo que su uso correcto es una práctica de seguridad esencial en la gestión de bases de datos.