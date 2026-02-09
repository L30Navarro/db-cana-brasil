-- Common Table Expression (CTE) criada para ranquear as mesorregiões produtoras
-- de cana-de-açúcar no estado de São Paulo, com base no volume total produzido durante
-- a safra de 2022.
WITH producao_municipio AS(
     SELECT cana_de_acucar.id_municipio, 
	 SUM (cana_de_acucar.volume_produzido) AS volume_municipio
FROM cana_de_acucar
WHERE cana_de_acucar.safra = 2022
GROUP BY cana_de_acucar.id_municipio
),

producao_mesorregiao AS (
       SELECT mesorregiao.id_mesorregiao, mesorregiao.mesorregiao,
       SUM (producao_municipio.volume_municipio) AS volume_total
FROM producao_municipio
JOIN municipio ON municipio.id_municipio = producao_municipio.id_municipio
JOIN microrregiao ON microrregiao.id_microrregiao = municipio.id_microrregiao
JOIN mesorregiao ON mesorregiao.id_mesorregiao = microrregiao.id_mesorregiao
WHERE municipio.id_estado = '35'
GROUP BY mesorregiao.id_mesorregiao, mesorregiao.mesorregiao
)

SELECT id_mesorregiao, mesorregiao, volume_total,
       RANK () OVER (ORDER BY volume_total DESC) AS Ranqueamento
FROM producao_mesorregiao
ORDER BY Ranqueamento;