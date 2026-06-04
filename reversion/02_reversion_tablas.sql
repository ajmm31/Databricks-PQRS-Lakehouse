-- =====================================================================================
-- PROYECTO: PORTAL DE TICKETS PQRS
-- ETAPA: REVERSIÓN (CLEANUP)
-- OBJETIVO: Eliminar tablas lógicas, catálogos y ubicaciones externas para reiniciar el entorno.
-- =====================================================================================

-- 1. Eliminar el catálogo y todo su contenido (esquemas y tablas) en cascada
DROP CATALOG IF EXISTS catalogo_pqrs CASCADE;

-- 2. Eliminar las ubicaciones externas (External Locations)
DROP EXTERNAL LOCATION IF EXISTS ubicacion_raw;
