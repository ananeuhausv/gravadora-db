-- Consulta 04: Lista o nome artístico, o nome do prêmio e a quantidade de vezes que cada artista recebeu cada prêmio. Ordenado pelo nome do artista e pela quantidade em ordem decrescente.


SELECT 
    A.nome_artistico,
    P.nome,
    COUNT(*) AS quantidade

FROM 
    estudio.artista A

INNER JOIN 
    estudio.artista_premio AP ON A.id_pessoa = AP.id_artista

JOIN 
    estudio.premio P ON P.id_premio = AP.id_premio

GROUP BY 
    A.nome_artistico, P.nome

ORDER BY 
    A.nome_artistico, quantidade DESC;