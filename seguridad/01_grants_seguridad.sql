-- =====================================================================================
-- PROYECTO: PORTAL DE TICKETS PQRS
-- ETAPA: SEGURIDAD Y PERMISOS (GRANTS)
-- OBJETIVO: Brindar acceso de lectura a los analistas sobre las capas de consumo.
-- =====================================================================================

-- 1. Dar permiso para "ver" y usar el catálogo
GRANT USAGE ON CATALOG catalogo_pqrs TO `account users`;

-- 2. Dar permiso para "entrar" a los esquemas de consumo
GRANT USAGE ON SCHEMA catalogo_pqrs.silver TO `account users`;
GRANT USAGE ON SCHEMA catalogo_pqrs.gold TO `account users`;

-- 3. Dar permiso de LECTURA (Select) sobre las tablas específicas
GRANT SELECT ON TABLE catalogo_pqrs.silver.tickets_enriquecidos TO `account users`;
GRANT SELECT ON TABLE catalogo_pqrs.gold.kpi_tickets_region TO `account users`;
