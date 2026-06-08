USE biblioteca_universitaria;

-- 4. Catálogo por Área do Conhecimento

SELECT
    a.nome_area AS area_conhecimento,
    COUNT(DISTINCT o.id_obra) AS quantidade_obras,
    COUNT(DISTINCT ex.rfid) AS total_exemplares,
    SUM(CASE
        WHEN e.data_devolucao IS NULL THEN 1
        ELSE 0
    END) AS exemplares_emprestados,
    SUM(CASE
        WHEN e.data_devolucao IS NULL
         AND e.data_prevista_devolucao < CURDATE() THEN 1
        ELSE 0
    END) AS exemplares_em_atraso,
    SUM(CASE
        WHEN m.status = 'Paga' THEN m.valor - IFNULL(m.desconto, 0)
        ELSE 0
    END) AS multas_pagas
FROM area_conhecimento a
INNER JOIN categoria c ON a.id_area_conhecimento = c.id_area_conhecimento
INNER JOIN obra o ON c.id_categoria = o.id_categoria
LEFT JOIN exemplar ex ON o.id_obra = ex.id_obra
LEFT JOIN emprestimo e ON ex.rfid = e.rfid_exemplar
LEFT JOIN multa m ON e.id_emprestimo = m.id_emprestimo
GROUP BY a.id_area_conhecimento, a.nome_area
ORDER BY a.nome_area;
