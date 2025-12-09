-- Consulta 06: Lista o nome artístico, o título do álbum, a data de lançamento e o total de faixas presentes no álbum mais recente do artista, ordenado cronologicamente.  

SELECT 
    A.nome_artistico,
    AL.titulo,
    AL.data_lancamento,
    COUNT(M.id_musica) AS quantidade_musicas

FROM
    estudio.artista A

INNER JOIN
    estudio.artista_musica AM ON A.id_pessoa = AM.id_artista

INNER JOIN
    estudio.musica MUS ON AM.id_musica = MUS.id_musica

INNER JOIN
    estudio.album AL ON A.id_pessoa = AL.id_artista

LEFT JOIN
    estudio.musica M ON M.id_album = AL.id_album

WHERE
    AL.data_lancamento = (
        SELECT MAX(ALB.data_lancamento)
        FROM estudio.album ALB
        INNER JOIN
            estudio.musica MUSB ON ALB.id_album = MUSB.id_album
        INNER JOIN
            estudio.artista_musica AMB ON MUSB.id_musica = AMB.id_musica
        WHERE AMB.id_artista = A.id_pessoa
    )

GROUP BY
    A.nome_artistico,
    AL.titulo,
    AL.data_lancamento

ORDER BY
    AL.data_lancamento DESC;