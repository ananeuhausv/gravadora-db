-- Consulta 08: Lista o nome do artista, o título da música e a quantidade de streams apenas das músicas que estão acima da média geral de streams de todas as músicas do estúdio.

SELECT 
    A.nome_artistico,
    M.titulo,
    M.qtd_stream

FROM 
    estudio.artista A

INNER JOIN 
    estudio.artista_musica AM ON A.id_pessoa = AM.id_artista

INNER JOIN 
    estudio.musica M ON AM.id_musica = M.id_musica

WHERE 
    M.qtd_stream > (
        SELECT AVG(qtd_stream)
        FROM estudio.musica
    )

ORDER BY
    M.qtd_stream DESC;