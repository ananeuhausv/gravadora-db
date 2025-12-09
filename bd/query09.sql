-- Consulta 09: Lista o nome dos produtores musicais que trabalharam em mais de 5 músicas diferentes. Exibe o nome do produtor e a quantidade de músicas produzidas.

SELECT
    P.nome,
    COUNT(MP.id_musica) AS musicas_produzidas

FROM
    estudio.produtor PROD

INNER JOIN
    estudio.pessoa P ON PROD.id_pessoa = P.id_pessoa

INNER JOIN
    estudio.musica_produtor MP ON PROD.id_pessoa = MP.id_produtor

GROUP BY
    P.id_pessoa, P.nome

HAVING
    COUNT(MP.id_musica) > 5;