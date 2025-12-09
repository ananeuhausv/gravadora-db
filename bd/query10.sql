-- Consulta 10: Lista o nome do álbum, o título da sua música mais ouvida e a quantidade de streams dessa música, apenas para álbuns com mais de 5 faixas. 

SELECT 
    A.titulo,
    M.titulo,
    M.qtd_stream

FROM estudio.album A

INNER JOIN 
    estudio.musica M ON A.id_album = M.id_album

WHERE 
    A.num_faixas > 5
    AND M.qtd_stream = (
        SELECT MAX(MUS.qtd_stream)
        FROM estudio.musica MUS
        WHERE MUS.id_album = A.id_album
    )

ORDER BY
    M.qtd_stream DESC;