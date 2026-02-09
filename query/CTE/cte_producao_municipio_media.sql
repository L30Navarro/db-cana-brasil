-- Common Table Expression (CTE) criada para identificar os municípios produtores de cana-de-açúcar
-- do Brasil cujo o volume produzido está acima da média nacional de produção dessa cultura.

WITH producao_municipio AS (
    SELECT municipio.municipio, SUM(cana_de_acucar.volume_produzido) AS volume_total
FROM cana_de_acucar
JOIN municipio ON municipio.id_municipio = cana_de_acucar.id_municipio
GROUP BY municipio.municipio
),

media_producao AS (
  SELECT AVG (volume_total) AS media_producao
FROM producao_municipio
)

SELECT municipio, volume_total, media_producao
FROM producao_municipio
CROSS JOIN media_producao
WHERE volume_total > media_producao
ORDER BY volume_total DESC;




