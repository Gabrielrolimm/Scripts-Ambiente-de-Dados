USE biblioteca_universitaria;

-- 1. Empréstimos por Mês e Tipo de Obra - últimos 12 meses
-- Versão básica, usando apenas agrupamento por mês existente na tabela.

SELECT
    DATE_FORMAT(e.data_emprestimo, '%Y-%m') AS mes,
    t.tipo AS tipo_obra,
    COUNT(e.id_emprestimo) AS quantidade_emprestimos,
    SUM(CASE
        WHEN m.status = 'Paga' THEN m.valor - IFNULL(m.desconto, 0)
        ELSE 0
    END) AS total_multas_pagas
FROM emprestimo e
INNER JOIN exemplar ex ON e.rfid_exemplar = ex.rfid
INNER JOIN obra o ON ex.id_obra = o.id_obra
INNER JOIN tipo_obra t ON o.id_tipo_obra = t.id_tipo_obra
LEFT JOIN multa m ON e.id_emprestimo = m.id_emprestimo
WHERE e.data_emprestimo >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY DATE_FORMAT(e.data_emprestimo, '%Y-%m'), t.tipo
ORDER BY mes, tipo_obra;
