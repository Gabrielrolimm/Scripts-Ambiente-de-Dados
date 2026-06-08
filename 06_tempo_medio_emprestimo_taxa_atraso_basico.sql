USE biblioteca_universitaria;

-- 6. Tempo Médio de Empréstimo por Obra e Taxa de Atraso
-- Considera tempo médio apenas para empréstimos concluídos, ou seja, com data_devolucao preenchida.

SELECT
    o.id_obra,
    o.titulo,
    t.tipo AS tipo_obra,
    COUNT(e.id_emprestimo) AS total_emprestimos,
    ROUND(AVG(CASE
        WHEN e.data_devolucao IS NOT NULL THEN DATEDIFF(e.data_devolucao, e.data_emprestimo)
        ELSE NULL
    END), 2) AS tempo_medio_emprestimo_dias,
    ROUND(
        SUM(CASE
            WHEN e.data_devolucao > e.data_prevista_devolucao THEN 1
            ELSE 0
        END) / COUNT(e.id_emprestimo) * 100,
        2
    ) AS percentual_devolucoes_com_atraso
FROM obra o
INNER JOIN tipo_obra t ON o.id_tipo_obra = t.id_tipo_obra
INNER JOIN exemplar ex ON o.id_obra = ex.id_obra
INNER JOIN emprestimo e ON ex.rfid = e.rfid_exemplar
GROUP BY o.id_obra, o.titulo, t.tipo
ORDER BY percentual_devolucoes_com_atraso DESC, total_emprestimos DESC;
