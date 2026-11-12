
-- PROYECTO: ANALISIS DE VENTAS
-- CONSULTA 03: RENTABILIDAD POR CATEGORIA

SELECT
    Categoria,
    SUM(Cantidad) AS Unidades_Vendidas,
    ROUND(SUM(Facturacion), 2) AS Facturacion_Total,
    ROUND(SUM(Costo_Total), 2) AS Costo_Total,
    ROUND(SUM(Ganancia_Bruta), 2) AS Ganancia_Bruta,
    ROUND(
        SUM(Ganancia_Bruta) * 100.0 /
        NULLIF(SUM(Facturacion), 0), 2
    ) AS Margen_Bruto_Porcentaje
FROM dbo.vw_Ventas_Detalladas
GROUP BY Categoria
ORDER BY Facturacion_Total DESC;
