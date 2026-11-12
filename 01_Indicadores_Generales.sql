
-- PROYECTO: ANALISIS DE VENTAS
-- CONSULTA 01: INDICADORES GENERALES
-- Herramienta: SQL Server

SELECT
    COUNT(DISTINCT ID_Venta) AS Total_Ventas,
    COUNT(DISTINCT ID_Cliente) AS Clientes_Activos,
    SUM(Facturacion) AS Facturacion_Total,
    SUM(Costo_Total) AS Costo_Total,
    SUM(Ganancia_Bruta) AS Ganancia_Bruta,
    ROUND(
        SUM(Ganancia_Bruta) * 100.0 /
        NULLIF(SUM(Facturacion), 0), 2
    ) AS Margen_Bruto_Porcentaje,
    ROUND(
        SUM(Facturacion) /
        NULLIF(COUNT(DISTINCT ID_Venta), 0), 2
    ) AS Ticket_Promedio
FROM dbo.vw_Ventas_Detalladas;
