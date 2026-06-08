USE biblioteca_universitaria;

-- 2. Estatísticas de Uso por Obra
-- Versão básica: a popularidade é indicada pela ordenação do maior para o menor total.

SELECT
    o.id_obra,
    o.titulo,
    t.tipo AS tipo_obra,
    COUNT(e.id_emprestimo) AS total_emprestimos,
    ROUND(COUNT(e.id_emprestimo) / 12, 2) AS media_mensal_aproximada,
    ROUND(COUNT(e.id_emprestimo) / 2, 2) AS media_semestral_aproximada,
    SUM(CASE
        WHEN m.status = 'Paga' THEN m.valor - IFNULL(m.desconto, 0)
        ELSE 0
    END) AS soma_historica_multas_pagas
FROM obra o
INNER JOIN tipo_obra t ON o.id_tipo_obra = t.id_tipo_obra
LEFT JOIN exemplar ex ON o.id_obra = ex.id_obra
LEFT JOIN emprestimo e ON ex.rfid = e.rfid_exemplar
LEFT JOIN multa m ON e.id_emprestimo = m.id_emprestimo
GROUP BY o.id_obra, o.titulo, t.tipo
ORDER BY total_emprestimos DESC, o.titulo;
