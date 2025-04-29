# Evaluación Técnica: Ingeniero de datos
Hemos preparado unos ejercicios o problemas prácticos del día a día en el mundo del desarrollo, integración y BigData. Queremos con esto validar y valorar tus conocimientos e iniciativas para resolverlos.

`Importante`: Se evaluará la forma en que el candidato organice sus ficheros, uso de estándares para la creación de estructuras, adecuada gestión de celdas en los notebook y documentación con la explicación del ejercicio.

## Ejercicio 1: Diseño y construcción de esquema de base de datos. (4pts)
**Descripción:** Diseñar un esquema de base de datos para una aplicación de comercio electrónico para una empresa llamada MP3. Los clientes tendrán acceso a un catálogo de productos, y podrán realizar órdenes de compra con uno o varios artículos (Nombre, descripción y precio), el sistema no posee una pasarela de pago, para realizar el pago se deberá realizar desde cualquier corresponsal con el número de orden de compra.

**Requisitos:**
- Crear diagrama entidad-relación (1p)
- Construir estructuras basado en el diagrama (1p)
- Incluir atributos relevantes como PK, FK, Nombres de clientes, detalle de productos, fecha de orden de compra (1p)
- Incluir datos de personas o productos con tildes, ñ, guión bajo, guión medio.
- Incluir valores decimales con 5 dígitos. (1p)

**Entregables:**
Incluir dentro del proyecto:
- Diagrama entidad-relación
- Script SQL con los DLL de las estructuras y la insercción de los datos de prueba.

## Ejercicio 2: Diseño y construcción de modelo data warehouse. (4pts)
**Descripción**: Se plantea diseñar un modelo data warehouse sencillo a partir del resultado del ejercicio 1, construido directamente con notebooks jupyter, para ello el modelo debe satisfacer las siguientes necesidades:
- Productos más vendidos
- Clientes con el mayor número de pedidos
- Corresponsal con el mayor número de pedidos
- Total de pagos diario y mensual por productos
- Total de pagos diario y mensual por clientes
- Total de pagos diario y mensual por corresponsal

**Requisitos:**
- Diseñar un modelo de data warehouse de tipo estrella, incluir tablas de hechos y dimensiones que satisfagan los reportes de BI
- Construcción de diagrama data warehouse.

**Entregables:**
Incluir dentro del proyecto:
- Diagrama de data warehouse (1p)
- Notebook Jupyter que realice lo siguiente:
    - Limpieza de datos: (2p)
        - Nombres en mayúsculas, sin tildes, sin ñ, sin guiones bajos y medios.
        - Valores numéricos con solo dos decimales redondeados al inmediato superior.
    - Integración de los datos: (1p)
        - Scripts con la creación de las tablas de dimensiones
        - Scripts con la creación de las tablas de hechos

## Ejercicio 3: Reportes BI (7pts)
**Descripción:** Con la estructura DWH construida en el ejercicio 2, se debe generar los mismos reportes solicitados por el área de negocio.
- Top 10 Productos más vendidos (1p)
- Top 5 Clientes con el mayor número de pedidos (1p)
- Top 5 Corresponsales con el mayor número de pedidos (1p)
- Total de pagos diario y mensual por productos (1p)
- Total de pagos diario y mensual por clientes (1p)
- Total de pagos diario y mensual por corresponsal (1p)
- Variación diaria, mensual de pedidos por productos y corresponsal (1p)

**Entregables:**
- Notebook Jupyter con las consultas, agregaciones y filtros necesarios para presentar el reporte solicitado. 