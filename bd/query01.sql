-- Consulta 01: Lista os nomes dos artistas que não possuem nenhum prêmio registrado.

SELECT 
    P.nome

FROM 
    estudio.artista A

INNER JOIN
    estudio.pessoa P ON A.id_pessoa = P.id_pessoa

WHERE 
    A.id_pessoa NOT IN (
        SELECT 
            id_artista
        FROM 
            estudio.artista_premio
    );
