-- Consulta 03: Lista o nome artístico e o nome dos artistas, cujo país de origem seja o Brasil.

SELECT 
    A.nome_artistico,
    P.nome,
    P.pais_origem
FROM
    estudio.artista A

INNER JOIN estudio.pessoa P ON A.id_pessoa = P.id_pessoa

WHERE
    P.pais_origem = 'Brasil';