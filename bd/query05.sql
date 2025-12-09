-- Consulta 05: Lista o nome e o país de origem das pessoas que atuam tanto como Artistas quanto como Produtores no estúdio.

SELECT 
    P.nome,
    P.pais_origem

FROM
    estudio.pessoa P

WHERE 
    P.id_pessoa IN (
        SELECT 
            A.id_pessoa
        FROM 
            estudio.artista A
    )
    AND
    P.id_pessoa IN (
        SELECT 
            PROD.id_pessoa
        FROM 
            estudio.produtor PROD
    );