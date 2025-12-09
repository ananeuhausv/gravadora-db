-- Consulta 07: Listar o nome artístico dos artistas que participaram de turnês em mais de 3 cidades diferentes, incluindo a quantidade de cidades distintas.

SELECT 
    A.nome_artistico,
    COUNT(DISTINCT C.cidade) AS quantidade_cidades
FROM 
    estudio.artista A

INNER JOIN 
    estudio.artista_turne AT ON A.id_pessoa = AT.id_artista

INNER JOIN 
    estudio.turne T ON AT.id_turne = T.id_turne

INNER JOIN
    estudio.concerto C ON T.id_turne = C.id_turne

GROUP BY 
    A.nome_artistico

HAVING
    COUNT(DISTINCT C.cidade) > 3

ORDER BY
    quantidade_cidades DESC;