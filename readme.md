# 📊 Data Lakehouse: Sistema Analítico de Tickets PQRS

![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)
![Delta Lake](https://img.shields.io/badge/Delta_Lake-43B02A?style=for-the-badge&logo=databricks&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

## 📝 Descripción del Proyecto
Este proyecto implementa una solución de Ingeniería de Datos moderna de extremo a extremo (End-to-End) diseñada para procesar, limpiar y analizar miles de solicitudes, quejas y reclamos (PQRS) del departamento de servicio al cliente. 

El sistema ingesta datos estructurados y semi-estructurados (JSON), evalúa texto mediante expresiones regulares (Regex) para determinar la criticidad de los tickets, y consolida Datamarts analíticos para el consumo del equipo de Data Analytics a través de Power BI.

## 🏗️ Arquitectura de la Solución (Medallion Architecture)

El pipeline de datos está diseñado bajo el patrón **Medallion Architecture** sobre Delta Lake, garantizando escalabilidad, calidad de datos transaccional (ACID) y características de Time Travel.

1. **🥉 Capa Bronze (Raw Data):** - Ingesta de datos crudos desde sistemas fuentes (Azure SQL / APIs).
   - Almacenamiento del estado inmutable e histórico (Archivos JSON/CSV).
2. **🥈 Capa Silver (Clean & Conformed Data):** - Transformaciones en PySpark.
   - Limpieza de datos (Drop nulls, Trim, Cast de variables).
   - Aplanamiento de estructuras complejas (Flattening de `detalles_tecnicos`).
   - Cruces de información de agentes y tickets (Left Joins).
   - Creación de métricas calculadas mediante Regex (Clasificación de Criticidad).
3. **🥇 Capa Gold (Aggregated Data & Datamarts):** - Creación de Modelos Estrella para KPIs de negocio.
   - Tablas optimizadas para conectividad con Power BI (`kpi_agentes`, `kpi_tecnologia`, `kpi_tendencias`).

## 🛠️ Stack Tecnológico
* **Orquestación y Cómputo:** Databricks Workflows / Clusters
* **Procesamiento de Datos:** Apache Spark (PySpark)
* **Almacenamiento:** Delta Lake (Formato Parquet optimizado)
* **CI/CD (Despliegue Continuo):** GitHub Actions
* **Visualización:** Power BI

## 🔄 Flujo de Integración y Despliegue Continuo (CI/CD)
Este repositorio cuenta con un pipeline automatizado en `deploy.yml`. Cada vez que un Data Engineer realiza un `push` a la rama `main`:
1. GitHub Actions inicializa un contenedor Ubuntu.
2. Utiliza credenciales seguras (Secrets) para autenticarse en el Databricks Workspace.
3. Ejecuta una función personalizada basada en Databricks REST API (usando cURL).
4. Sobrescribe de manera atómica los notebooks `.ipynb` en la carpeta de Producción (`PQRS_Prod`).

## 🚀 Cómo ejecutar este proyecto localmente
1. Clona el repositorio: `git clone https://github.com/tu-usuario/pqrs-data-lakehouse.git`
2. Configura los secretos en tu repositorio (`DATABRICKS_HOST`, `DATABRICKS_TOKEN`).
3. Ejecuta los notebooks en orden numérico:
   - `00_preparacion_ambiente.ipynb` (DCL y DDL de base de datos).
   - `01_extract.ipynb` (Ingesta a Bronze).
   - `02_transform.ipynb` (Limpieza a Silver).
   - `03_load.ipynb` (Agregaciones a Gold).

## 💡 Manejo de Errores y Calidad de Datos Implementados
* **Auto-Optimize / Concurrent Writes:** Prevención de colisiones de transacciones Delta mediante esperas explícitas para tareas asíncronas.
* **Regex Case-Insensitive:** Extracción tolerante a fallos gramaticales en la caja de comentarios del usuario final (ej. `(?i)pésimo|robo|cierra sola`).
* **Dynamic Renaming:** Tolerancia al esquema de origen (Case-Insensitivity en columnas de bases de datos relacionales).

---
*Desarrollado con ❤️ por el Equipo de Data Engineering - Alvaro Jose Muñoz Murillo.*
