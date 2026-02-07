CREATE OR REPLACE VIEW vw_produtividade_cana_mesorregiao AS
WITH produtividade_mesorregiao AS (
SELECT mesorregiao.mesorregiao, mesorregiao.area_mesorregiao, estado.uf, cana_de_acucar.safra, 
       SUM(cana_de_acucar.volume_produzido) AS producao_total,
	   AVG(cana_de_acucar.volume_produzido) AS media_producao
FROM cana_de_acucar
JOIN municipio ON municipio.id_municipio = cana_de_acucar.id_municipio
JOIN microrregiao ON microrregiao.id_microrregiao = municipio.id_microrregiao
JOIN mesorregiao ON mesorregiao.id_mesorregiao = microrregiao.id_mesorregiao
JOIN estado ON estado.id_estado = municipio.id_estado
WHERE cana_de_acucar.volume_produzido > 0 
      AND mesorregiao.area_mesorregiao > 0 
      AND cana_de_acucar.safra BETWEEN 2015 AND 2022
GROUP BY mesorregiao.mesorregiao, mesorregiao.area_mesorregiao, estado.uf, cana_de_acucar.safra
)
SELECT mesorregiao, uf, safra, 
       ROUND((producao_total / area_mesorregiao)::NUMERIC, 2) AS produtividade_mesorregiao,
       media_producao
FROM produtividade_mesorregiao;



