# 2. Documentación de Consultas SQL para la Base de Datos Astronómica

## Introducción

Este documento describe el propósito y la lógica detrás de una serie de consultas SQL diseñadas para extraer información significativa de la base de datos `universo_db`. Las consultas demuestran la capacidad de realizar desde simples recuperaciones de datos hasta análisis más complejos, combinando y agrupando información de diferentes tablas.

El objetivo es mostrar cómo se utiliza el Lenguaje Estructurado de Consultas (SQL) para satisfacer requerimientos específicos, transformando datos crudos en respuestas claras y útiles.

---

### Descripción de las Consultas Realizadas

#### Consulta 1: Selección y Filtrado Básico
Esta consulta fue diseñada para recuperar un subconjunto específico de datos. Su función es listar todos los objetos celestes que pertenecen a una categoría particular, como 'Galaxia'. Esto demuestra la capacidad de filtrar registros basándose en un criterio definido.

#### Consulta 2: Combinación de Tablas
Para satisfacer el requerimiento de encontrar todas las observaciones de un objeto celeste específico, se implementó una consulta que combina datos de la tabla `Observaciones` y `Objetos_Celestes`. Al unir estas tablas, es posible presentar un reporte detallado que muestra información del objeto junto con los datos de cada una de sus observaciones.

#### Consulta 3: Agrupación y Funciones de Agregación
Esta consulta tiene como objetivo resumir datos para obtener estadísticas. Se implementó para contar el número total de observaciones registradas para cada objeto celeste. El resultado permite identificar rápidamente cuáles son los objetos más estudiados. Se utilizó una unión de tipo `LEFT JOIN` para asegurar que todos los objetos fueran incluidos en el análisis, incluso aquellos sin observaciones.

#### Consulta 4: Filtrado con Múltiples Condiciones
Para demostrar una lógica de filtrado más compleja, se desarrolló una consulta que recupera observaciones que cumplen con al menos uno de varios criterios. Específicamente, busca todas las observaciones pertenecientes a un objeto de interés O aquellas realizadas con un telescopio particular. Los resultados se presentan ordenados cronológicamente para facilitar el análisis de la línea de tiempo.