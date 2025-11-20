# 1. Fundamentos de Bases de Datos Relacionales en un Proyecto de Astronomía

## Introducción

Este documento describe los componentes clave de una base de datos relacional y cómo estos se aplican para gestionar información en un proyecto de catalogación astronómica. El objetivo es demostrar el rol fundamental que desempeñan las bases de datos en la organización eficiente y escalable de los datos.

---

### Componentes Básicos de una Base de Datos Relacional

Una base de datos relacional organiza la información en un formato estructurado y lógico. Sus componentes principales se describen a continuación.

#### 1. **Tablas**
Las tablas son el objeto principal donde se almacenan los datos. Cada tabla está diseñada para representar una categoría de información específica.
-   **Ejemplo:** En este proyecto, la tabla `Objetos_Celestes` fue creada para guardar la información de entidades como estrellas y galaxias.

#### 2. **Registros (Filas)**
Cada fila dentro de una tabla constituye un registro único. Dicho registro contiene los datos específicos de un solo elemento.
-   **Ejemplo:** Una fila en la tabla `Objetos_Celestes` podría ser el registro correspondiente a la "Galaxia de Andrómeda".

#### 3. **Campos (Columnas)**
Cada columna define un tipo de dato o atributo para todos los registros de la tabla.
-   **Ejemplo:** La tabla `Objetos_Celestes` contiene campos como `nombre_comun`, `tipo_objeto` y `distancia_ly`.

#### 4. **Clave Primaria (Primary Key - PK)**
La clave primaria es una columna que contiene un valor único para cada registro. Su función es identificar de forma inequívoca cada fila en la tabla.
-   **Ejemplo:** El campo `id_objeto` fue definido como la clave primaria en la tabla `Objetos_Celestes`, asegurando que cada objeto posea un identificador único.

#### 5. **Clave Foránea (Foreign Key - FK)**
La clave foránea es una columna en una tabla que se utiliza para referenciar la clave primaria de otra tabla. Este es el mecanismo que permite **crear relaciones** entre tablas.
-   **Ejemplo:** Para registrar qué objeto se está observando, la tabla `Observaciones` incluye una clave foránea `id_objeto` que se conecta con el `id_objeto` de la tabla `Objetos_Celestes`.

---

### Gestión y Almacenamiento de Datos Relacionados

En cualquier organización, es vital mantener los datos consistentes y evitar la duplicación innecesaria de información. Las bases de datos relacionales logran este objetivo mediante la separación de la información en tablas lógicas, las cuales se conectan a través de relaciones.

**Necesidad Organizacional:**
Un observatorio requiere registrar múltiples observaciones para cada objeto celeste. Si se guardara toda la información en una sola tabla, los detalles de cada objeto (como su distancia o tipo) se repetirían en cada registro de observación. Este enfoque es ineficiente y propenso a errores, ya que la corrección de un dato requeriría su modificación en múltiples lugares.

**Solución Implementada:**
Para resolver este problema, se crearon dos tablas separadas:

1.  **Tabla `Objetos_Celestes`**: Almacena los datos que son únicos para cada objeto (su nombre, tipo, etc.). La información de cada objeto se guarda una sola vez.
2.  **Tabla `Observaciones`**: Almacena los datos de cada evento de observación (la fecha, el telescopio, etc.).

**Establecimiento de la Relación:**
La relación entre estas dos tablas se establece utilizando una **clave foránea**. La tabla `Observaciones` incluye una columna `id_objeto` que corresponde a la clave primaria de la tabla `Objetos_Celestes`.

-   **Resultado:** Esto crea una relación de **"Uno a Muchos"**. Un objeto celeste puede tener muchas observaciones, pero cada observación está vinculada a un solo objeto.

Este diseño asegura la **integridad de los datos**: el sistema no permitirá que se registre una observación si el objeto celeste correspondiente no existe en el catálogo principal. Esto demuestra cómo una estructura relacional satisface las necesidades de una organización al mantener los datos organizados, consistentes y fáciles de mantener.