-- Consulta 02: Lista o nome e o ano de cada turnê, junto com o público total alcançado em todos os seus concertos, ordenando do maior para o menor público.

SELECT 
    T.nome,
    T.ano,
    SUM(C.publico) AS publico_total
FROM 
    estudio.turne T

INNER JOIN estudio.concerto C ON T.id_turne = C.id_turne

GROUP BY
    T.id_turne,
    T.nome, 
    T.ano

ORDER BY
    publico_total DESC;
