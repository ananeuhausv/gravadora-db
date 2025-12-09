-- Consulta 07: Listar o nome artístico dos artistas que participaram de turnês em mais de 3 países diferentes, incluindo a quantidade de países distintos.

SELECT 
    A.nome_artistico,
    COUNT(DISTINCT C.pais) AS quantidade_paises
FROM 
    estudio.artista A
INNER JOIN estudio.artista_turne AT ON A.id_pessoa = AT.id_artista
INNER JOIN estudio.turne T ON AT.id_turne = T.id_turne
INNER JOIN estudio.concerto C ON T.id_turne = C.id_turne
GROUP BY 
    A.nome_artistico
HAVING
    COUNT(DISTINCT C.pais) > 3
ORDER BY
    quantidade_paises DESC;