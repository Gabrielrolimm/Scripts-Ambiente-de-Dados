USE biblioteca_universitaria;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE notificacao;
TRUNCATE TABLE multa;
TRUNCATE TABLE emprestimo;
TRUNCATE TABLE endereco_usuario;
TRUNCATE TABLE telefone_usuario;
TRUNCATE TABLE usuario;
TRUNCATE TABLE tipo_usuario;
TRUNCATE TABLE exemplar;
TRUNCATE TABLE obra_autor;
TRUNCATE TABLE obra;
TRUNCATE TABLE autor;
TRUNCATE TABLE categoria;
TRUNCATE TABLE area_conhecimento;
TRUNCATE TABLE tipo_obra;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO tipo_obra (id_tipo_obra, tipo) VALUES
(1, 'Livro'),
(2, 'Tese'),
(3, 'Dissertação'),
(4, 'Periódico'),
(5, 'E-book'),
(6, 'Relatório Técnico'),
(7, 'Artigo Científico'),
(8, 'Manual'),
(9, 'Anais de Evento'),
(10, 'Monografia');

INSERT INTO area_conhecimento (id_area_conhecimento, nome_area) VALUES
(1, 'Computação'),
(2, 'Engenharia'),
(3, 'Saúde'),
(4, 'Ciências Humanas'),
(5, 'Administração'),
(6, 'Direito'),
(7, 'Educação'),
(8, 'Matemática'),
(9, 'Física'),
(10, 'Linguística');

INSERT INTO categoria (id_categoria, id_area_conhecimento, tipo_categoria) VALUES
(1, 1, 'Banco de Dados'),
(2, 1, 'Inteligência Artificial'),
(3, 1, 'Engenharia de Software'),
(4, 2, 'Engenharia de Produção'),
(5, 3, 'Saúde Pública'),
(6, 4, 'História'),
(7, 5, 'Gestão Estratégica'),
(8, 6, 'Direito Digital'),
(9, 7, 'Metodologia de Ensino'),
(10, 8, 'Estatística Aplicada');

INSERT INTO autor (id_autor, nome) VALUES
(1, 'Carlos Heuser'),
(2, 'Abraham Silberschatz'),
(3, 'Peter Rob'),
(4, 'Stuart Russell'),
(5, 'Peter Norvig'),
(6, 'Ian Sommerville'),
(7, 'Aline Pereira'),
(8, 'Marcos Souza'),
(9, 'Fernanda Lima'),
(10, 'José Oliveira'),
(11, 'Maria Clara Santos'),
(12, 'Rafael Costa'),
(13, 'Ana Beatriz Rocha'),
(14, 'Bruno Martins'),
(15, 'Patrícia Almeida');

INSERT INTO obra (id_obra, id_tipo_obra, id_categoria, titulo, data_publicacao, isbn) VALUES
(1, 1, 1, 'Projeto de Banco de Dados', '2018-03-15', '9788535281231'),
(2, 1, 1, 'Sistemas de Banco de Dados', '2020-05-10', '9788582605000'),
(3, 1, 2, 'Inteligência Artificial: Uma Abordagem Moderna', '2021-02-20', '9788577809999'),
(4, 1, 3, 'Engenharia de Software', '2019-08-12', '9788579361081'),
(5, 2, 2, 'Modelos Preditivos para Evasão Universitária', '2022-11-30', NULL),
(6, 3, 1, 'Otimização de Consultas em Bancos Relacionais', '2023-06-18', NULL),
(7, 4, 5, 'Revista Brasileira de Saúde Pública', '2024-01-15', '0102311X202401'),
(8, 1, 6, 'História das Universidades Brasileiras', '2017-09-05', '9788520410010'),
(9, 1, 7, 'Gestão Estratégica em Instituições de Ensino', '2022-04-25', '9788535255555'),
(10, 6, 8, 'Relatório de Privacidade e Proteção de Dados', '2024-10-01', NULL),
(11, 5, 3, 'DevOps e Entrega Contínua', '2023-02-10', '9786500001234'),
(12, 1, 4, 'Lean Manufacturing para Serviços', '2020-10-22', '9788575227777'),
(13, 7, 9, 'Práticas Pedagógicas Ativas', '2021-07-19', NULL),
(14, 8, 10, 'Manual de Estatística Aplicada', '2020-03-08', '9788500001111'),
(15, 10, 6, 'Memória e Patrimônio Universitário', '2022-09-14', NULL);

INSERT INTO obra_autor (id_obra, id_autor) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(5, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(10, 13),
(11, 14),
(12, 15),
(13, 7),
(14, 9),
(15, 11);

INSERT INTO exemplar (rfid, id_obra, status) VALUES
('RFID-OBRA-0001', 1, 'Disponível'),
('RFID-OBRA-0002', 1, 'Disponível'),
('RFID-OBRA-0003', 1, 'Disponível'),
('RFID-OBRA-0004', 2, 'Disponível'),
('RFID-OBRA-0005', 2, 'Disponível'),
('RFID-OBRA-0006', 2, 'Disponível'),
('RFID-OBRA-0007', 3, 'Disponível'),
('RFID-OBRA-0008', 3, 'Disponível'),
('RFID-OBRA-0009', 3, 'Disponível'),
('RFID-OBRA-0010', 4, 'Disponível'),
('RFID-OBRA-0011', 4, 'Disponível'),
('RFID-OBRA-0012', 5, 'Disponível'),
('RFID-OBRA-0013', 6, 'Disponível'),
('RFID-OBRA-0014', 7, 'Disponível'),
('RFID-OBRA-0015', 8, 'Disponível'),
('RFID-OBRA-0016', 9, 'Disponível'),
('RFID-OBRA-0017', 10, 'Disponível'),
('RFID-OBRA-0018', 11, 'Disponível'),
('RFID-OBRA-0019', 12, 'Disponível'),
('RFID-OBRA-0020', 13, 'Disponível'),
('RFID-OBRA-0021', 14, 'Disponível'),
('RFID-OBRA-0022', 15, 'Disponível');

INSERT INTO tipo_usuario (id_tipo_usuario, tipo_usuario) VALUES
(1, 'Aluno'),
(2, 'Professor'),
(3, 'Pesquisador'),
(4, 'Bibliotecário'),
(5, 'Técnico Administrativo'),
(6, 'Visitante'),
(7, 'Coordenador'),
(8, 'Diretor'),
(9, 'Monitor'),
(10, 'Egresso');

INSERT INTO usuario (id_usuario, id_tipo_usuario, nome, data_nascimento, matricula, curso, rfid) VALUES
(1, 1, 'Lucas Andrade', '2002-04-12', 'MAT20230001', 'Ciência da Computação', 'RFID-USR-0001'),
(2, 1, 'Mariana Costa', '2001-09-21', 'MAT20230002', 'Sistemas de Informação', 'RFID-USR-0002'),
(3, 1, 'Pedro Henrique Silva', '2003-01-08', 'MAT20230003', 'Engenharia de Software', 'RFID-USR-0003'),
(4, 1, 'Camila Fernandes', '2000-12-02', 'MAT20220004', 'Administração', 'RFID-USR-0004'),
(5, 2, 'Prof. Ricardo Menezes', '1978-05-17', 'PROF000001', 'Departamento de Computação', 'RFID-USR-0005'),
(6, 2, 'Profa. Helena Duarte', '1982-03-28', 'PROF000002', 'Departamento de História', 'RFID-USR-0006'),
(7, 3, 'Dra. Beatriz Nogueira', '1988-07-11', 'PESQ000001', 'Laboratório de IA', 'RFID-USR-0007'),
(8, 1, 'João Vitor Lima', '2004-06-30', 'MAT20240008', 'Direito', 'RFID-USR-0008'),
(9, 1, 'Sofia Ribeiro', '2002-10-14', 'MAT20230009', 'Engenharia de Produção', 'RFID-USR-0009'),
(10, 2, 'Prof. André Carvalho', '1975-11-03', 'PROF000003', 'Departamento de Saúde Pública', 'RFID-USR-0010');

INSERT INTO telefone_usuario (id_telefone, id_usuario, telefone, tipo) VALUES
(1, 1, '(85) 98888-1001', 'Celular'),
(2, 2, '(85) 98888-1002', 'Celular'),
(3, 3, '(85) 98888-1003', 'Celular'),
(4, 4, '(85) 98888-1004', 'Celular'),
(5, 5, '(85) 98888-1005', 'Celular'),
(6, 6, '(85) 98888-1006', 'Celular'),
(7, 7, '(85) 98888-1007', 'Celular'),
(8, 8, '(85) 98888-1008', 'Celular'),
(9, 9, '(85) 98888-1009', 'Celular'),
(10, 10, '(85) 98888-1010', 'Celular');

INSERT INTO endereco_usuario (
    id_endereco, id_usuario, rua, bairro, numero, complemento, cidade, estado, cep, tipo
) VALUES
(1, 1, 'Rua das Acácias', 'Benfica', '101', 'Apto 202', 'Fortaleza', 'CE', '60020-010', 'Residencial'),
(2, 2, 'Av. Universidade', 'Benfica', '2200', NULL, 'Fortaleza', 'CE', '60020-181', 'Residencial'),
(3, 3, 'Rua Padre Ibiapina', 'Centro', '88', NULL, 'Fortaleza', 'CE', '60010-050', 'Residencial'),
(4, 4, 'Rua Silva Paulet', 'Aldeota', '450', 'Casa', 'Fortaleza', 'CE', '60120-020', 'Residencial'),
(5, 5, 'Campus do Pici', 'Pici', '0', 'Bloco 910', 'Fortaleza', 'CE', '60440-900', 'Comercial'),
(6, 6, 'Av. da História', 'Fátima', '321', NULL, 'Fortaleza', 'CE', '60411-050', 'Residencial'),
(7, 7, 'Rua da Pesquisa', 'Parangaba', '78', 'Sala 12', 'Fortaleza', 'CE', '60720-000', 'Comercial'),
(8, 8, 'Rua do Direito', 'Dionísio Torres', '1400', NULL, 'Fortaleza', 'CE', '60135-170', 'Residencial'),
(9, 9, 'Rua da Produção', 'Messejana', '650', 'Casa 2', 'Fortaleza', 'CE', '60840-000', 'Residencial'),
(10, 10, 'Rua da Saúde', 'Meireles', '905', 'Apto 804', 'Fortaleza', 'CE', '60165-120', 'Residencial');

DROP PROCEDURE IF EXISTS sp_carga_movimentacao_biblioteca;

DELIMITER $$

CREATE PROCEDURE sp_carga_movimentacao_biblioteca()
BEGIN
    DECLARE v_i INT DEFAULT 1;
    DECLARE v_usuario INT;
    DECLARE v_rfid VARCHAR(100);
    DECLARE v_data_emp DATE;
    DECLARE v_data_prev DATE;
    DECLARE v_data_dev DATE;
    DECLARE v_dias_atraso INT;
    DECLARE v_valor_multa DECIMAL(10,2);
    DECLARE v_desconto DECIMAL(10,2);
    DECLARE v_data_pagamento DATE;
    DECLARE v_id_emprestimo INT;
    DECLARE v_id_multa INT;

    WHILE v_i <= 300 DO

        SET v_usuario = 1 + MOD(v_i - 1, 10);

        SET v_rfid = CASE MOD(v_i - 1, 22)
            WHEN 0 THEN 'RFID-OBRA-0001'
            WHEN 1 THEN 'RFID-OBRA-0002'
            WHEN 2 THEN 'RFID-OBRA-0003'
            WHEN 3 THEN 'RFID-OBRA-0004'
            WHEN 4 THEN 'RFID-OBRA-0005'
            WHEN 5 THEN 'RFID-OBRA-0006'
            WHEN 6 THEN 'RFID-OBRA-0007'
            WHEN 7 THEN 'RFID-OBRA-0008'
            WHEN 8 THEN 'RFID-OBRA-0009'
            WHEN 9 THEN 'RFID-OBRA-0010'
            WHEN 10 THEN 'RFID-OBRA-0011'
            WHEN 11 THEN 'RFID-OBRA-0012'
            WHEN 12 THEN 'RFID-OBRA-0013'
            WHEN 13 THEN 'RFID-OBRA-0014'
            WHEN 14 THEN 'RFID-OBRA-0015'
            WHEN 15 THEN 'RFID-OBRA-0016'
            WHEN 16 THEN 'RFID-OBRA-0017'
            WHEN 17 THEN 'RFID-OBRA-0018'
            WHEN 18 THEN 'RFID-OBRA-0019'
            WHEN 19 THEN 'RFID-OBRA-0020'
            WHEN 20 THEN 'RFID-OBRA-0021'
            ELSE 'RFID-OBRA-0022'
        END;

        SET v_data_emp = DATE_SUB(CURDATE(), INTERVAL MOD(v_i * 3, 360) DAY);
        SET v_data_prev = DATE_ADD(v_data_emp, INTERVAL (14 + MOD(v_i, 8)) DAY);

        IF MOD(v_i, 5) = 0 THEN

            SET v_dias_atraso = 1 + MOD(v_i, 20);
            SET v_data_dev = DATE_ADD(v_data_prev, INTERVAL v_dias_atraso DAY);
            SET v_valor_multa = v_dias_atraso * 2.00;

            SET v_desconto = CASE
                WHEN MOD(v_i, 10) = 0 THEN 5.00
                WHEN MOD(v_i, 15) = 0 THEN 3.00
                ELSE 0.00
            END;

            IF v_desconto > v_valor_multa THEN
                SET v_desconto = 0.00;
            END IF;

            SET v_data_pagamento = DATE_ADD(v_data_dev, INTERVAL MOD(v_i, 5) DAY);

            INSERT INTO emprestimo (
                id_usuario,
                rfid_exemplar,
                data_emprestimo,
                data_prevista_devolucao,
                data_devolucao,
                status
            )
            VALUES (
                v_usuario,
                v_rfid,
                v_data_emp,
                v_data_prev,
                v_data_dev,
                'Devolvido com atraso'
            );

            SET v_id_emprestimo = LAST_INSERT_ID();

            INSERT INTO multa (
                id_emprestimo,
                valor,
                desconto,
                data_pagamento,
                status
            )
            VALUES (
                v_id_emprestimo,
                v_valor_multa,
                v_desconto,
                v_data_pagamento,
                'Paga'
            );

            SET v_id_multa = LAST_INSERT_ID();

            INSERT INTO notificacao (
                id_usuario,
                id_emprestimo,
                id_multa,
                mensagem,
                status,
                data_envio
            )
            VALUES (
                v_usuario,
                v_id_emprestimo,
                v_id_multa,
                CONCAT(
                    'Multa gerada automaticamente. Empréstimo devolvido com ',
                    v_dias_atraso,
                    ' dia(s) de atraso.'
                ),
                'Enviada',
                CONCAT(v_data_pagamento, ' 09:00:00')
            );

        ELSE

            SET v_dias_atraso = 0;
            SET v_data_dev = DATE_SUB(v_data_prev, INTERVAL MOD(v_i, 4) DAY);

            INSERT INTO emprestimo (
                id_usuario,
                rfid_exemplar,
                data_emprestimo,
                data_prevista_devolucao,
                data_devolucao,
                status
            )
            VALUES (
                v_usuario,
                v_rfid,
                v_data_emp,
                v_data_prev,
                v_data_dev,
                'Devolvido'
            );

        END IF;

        SET v_i = v_i + 1;

    END WHILE;

END$$

DELIMITER ;

CALL sp_carga_movimentacao_biblioteca();

DROP PROCEDURE IF EXISTS sp_carga_movimentacao_biblioteca;

SELECT 'tipo_obra' AS tabela, COUNT(*) AS total FROM tipo_obra
UNION ALL SELECT 'area_conhecimento', COUNT(*) FROM area_conhecimento
UNION ALL SELECT 'categoria', COUNT(*) FROM categoria
UNION ALL SELECT 'autor', COUNT(*) FROM autor
UNION ALL SELECT 'obra', COUNT(*) FROM obra
UNION ALL SELECT 'obra_autor', COUNT(*) FROM obra_autor
UNION ALL SELECT 'exemplar', COUNT(*) FROM exemplar
UNION ALL SELECT 'tipo_usuario', COUNT(*) FROM tipo_usuario
UNION ALL SELECT 'usuario', COUNT(*) FROM usuario
UNION ALL SELECT 'telefone_usuario', COUNT(*) FROM telefone_usuario
UNION ALL SELECT 'endereco_usuario', COUNT(*) FROM endereco_usuario
UNION ALL SELECT 'emprestimo', COUNT(*) FROM emprestimo
UNION ALL SELECT 'multa', COUNT(*) FROM multa
UNION ALL SELECT 'notificacao', COUNT(*) FROM notificacao;

SELECT 
    COUNT(*) AS total_emprestimos,
    SUM(CASE WHEN status = 'Devolvido com atraso' THEN 1 ELSE 0 END) AS emprestimos_com_atraso,
    SUM(CASE WHEN status = 'Devolvido' THEN 1 ELSE 0 END) AS emprestimos_sem_atraso,
    ROUND(SUM(CASE WHEN status = 'Devolvido com atraso' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS percentual_atraso
FROM emprestimo;

SELECT
    e.id_emprestimo,
    u.nome AS usuario,
    u.matricula,
    e.rfid_exemplar,
    o.titulo AS obra,
    e.data_emprestimo,
    e.data_prevista_devolucao,
    e.data_devolucao,
    e.status AS status_emprestimo,
    m.valor AS valor_multa,
    m.desconto,
    m.data_pagamento,
    n.status AS status_notificacao
FROM emprestimo e
INNER JOIN usuario u ON u.id_usuario = e.id_usuario
INNER JOIN exemplar ex ON ex.rfid = e.rfid_exemplar
INNER JOIN obra o ON o.id_obra = ex.id_obra
LEFT JOIN multa m ON m.id_emprestimo = e.id_emprestimo
LEFT JOIN notificacao n ON n.id_emprestimo = e.id_emprestimo
ORDER BY e.id_emprestimo
LIMIT 50;