-- =====================================================================================
-- PROYECTO: PORTAL DE TICKETS PQRS
-- ETAPA: SEGURIDAD Y GOBIERNO DE DATOS (UNITY CATALOG)
-- OBJETIVO: Brindar permisos de solo lectura a la capa Gold para el equipo de Analítica
-- =====================================================================================

-- Nota: En un entorno real, el grupo 'equipo_analitica' se crea desde la Consola de Administración.
-- Aquí documentamos la asignación de permisos siguiendo las mejores prácticas (Roles / Grupos).

-- 1. Permiso para usar el catálogo principal
GRANT USAGE ON CATALOG catalogo_pqrs TO `equipo_analitica`;

-- 2. Permiso para usar el esquema Gold (donde están los Datamarts)
GRANT USAGE ON SCHEMA catalogo_pqrs.gold TO `equipo_analitica`;

-- 3. Permiso de lectura (SELECT) sobre todas las tablas actuales en la capa Gold
GRANT SELECT ON SCHEMA catalogo_pqrs.gold TO `equipo_analitica`;

-- 4. (Opcional pero Recomendado) Permiso para que el grupo pueda leer futuras tablas que se creen en Gold
ALTER SCHEMA catalogo_pqrs.gold OWNER TO `admin_pqrs`; -- Ajusta 'admin_pqrs' a tu usuario administrador si lo deseas
