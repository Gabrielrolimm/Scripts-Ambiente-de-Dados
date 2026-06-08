USE biblioteca_universitaria;

-- 5. Top Usuários - últimos 12 meses

SELECT
    u.id_usuario,
    u.nome,
    tu.tipo_usuario,
    COUNT(e.id_emprestimo) AS total_emprestimos,
    SUM(CASE
        WHEN e.data_devolucao > e.data_prevista_devolucao THEN 1
        WHEN e.data_devolucao IS NULL AND e.data_prevista_devolucao < CURDATE() THEN 1
        ELSE 0
    END) AS numero_atrasos,
    SUM(CASE
        WHEN m.status = 'Paga' THEN m.valor - IFNULL(m.desconto, 0)
        ELSE 0
    END) AS total_multas_pagas
FROM usuario u
INNER JOIN tipo_usuario tu ON u.id_tipo_usuario = tu.id_tipo_usuario
INNER JOIN emprestimo e ON u.id_usuario = e.id_usuario
LEFT JOIN multa m ON e.id_emprestimo = m.id_emprestimo
WHERE e.data_emprestimo >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY u.id_usuario, u.nome, tu.tipo_usuario
ORDER BY total_emprestimos DESC, total_multas_pagas DESC
LIMIT 10;
