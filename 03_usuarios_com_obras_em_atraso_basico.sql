USE biblioteca_universitaria;

-- 3. Usuários com Obras em Atraso
-- Mostra empréstimos ainda não devolvidos e com data prevista menor que hoje.
-- Multa calculada: R$ 2,00 por dia de atraso.

SELECT
    u.nome AS nome_usuario,
    tu.tipo_usuario,
    tel.telefone AS celular,
    o.titulo AS titulo_obra,
    t.tipo AS tipo_obra,
    e.data_emprestimo,
    e.data_prevista_devolucao,
    DATEDIFF(CURDATE(), e.data_prevista_devolucao) AS dias_em_atraso,
    DATEDIFF(CURDATE(), e.data_prevista_devolucao) * 2.00 AS multa_calculada_hoje
FROM emprestimo e
INNER JOIN usuario u ON e.id_usuario = u.id_usuario
INNER JOIN tipo_usuario tu ON u.id_tipo_usuario = tu.id_tipo_usuario
INNER JOIN exemplar ex ON e.rfid_exemplar = ex.rfid
INNER JOIN obra o ON ex.id_obra = o.id_obra
INNER JOIN tipo_obra t ON o.id_tipo_obra = t.id_tipo_obra
LEFT JOIN telefone_usuario tel ON u.id_usuario = tel.id_usuario AND tel.tipo = 'Celular'
WHERE e.data_devolucao IS NULL
  AND e.data_prevista_devolucao < CURDATE()
ORDER BY dias_em_atraso DESC, u.nome;
