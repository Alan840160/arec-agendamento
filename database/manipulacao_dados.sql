-- Sistema de Gestão de Reservas AREC-Copasul
-- Exemplos de INSERT, SELECT, UPDATE e DELETE
-- Execute após database/schema.sql

USE arec_reservas;

-- =====================================================
-- 1. INSERÇÃO DE DADOS (INSERT)
-- =====================================================

INSERT INTO tipo_usuario (nome) VALUES
('Associado'),
('Dependente'),
('Administrador');

INSERT INTO status_recurso (nome) VALUES
('Disponível'),
('Indisponível'),
('Manutenção');

INSERT INTO status_reserva (nome) VALUES
('Pendente'),
('Confirmada'),
('Cancelada');

INSERT INTO usuario
(nome, cpf, telefone, email, senha, tipo_usuario_id)
VALUES
('João da Silva', '111.111.111-11', '(67) 99999-1111',
 'joao@example.com', 'senha_exemplo_hash', 1),
('Maria Oliveira', '222.222.222-22', '(67) 99999-2222',
 'maria@example.com', 'senha_exemplo_hash', 2);

INSERT INTO recurso
(nome, descricao, capacidade, localizacao, status_id)
VALUES
('Campo de Futebol', 'Campo destinado à prática de futebol', 22,
 'AREC - Naviraí/MS', 1),
('Salão de Festas', 'Espaço destinado a confraternizações', 80,
 'AREC - Naviraí/MS', 1);

INSERT INTO reserva
(id_usuario, id_recurso, data_reserva, hora_inicio, hora_fim,
 numero_pessoas, status_id, observacao)
VALUES
(1, 1, '2026-10-10', '18:00:00', '20:00:00', 12, 2,
 'Reserva para atividade recreativa'),
(2, 2, '2026-10-11', '19:00:00', '22:00:00', 40, 1,
 'Confraternização familiar');

-- =====================================================
-- 2. CONSULTAS (SELECT)
-- =====================================================

-- Listar usuários cadastrados
SELECT id_usuario, nome, cpf, email
FROM usuario;

-- Listar recursos disponíveis
SELECT r.id_recurso, r.nome, r.capacidade, sr.nome AS status
FROM recurso r
INNER JOIN status_recurso sr ON sr.id_status = r.status_id
WHERE sr.nome = 'Disponível';

-- Listar reservas com usuário, recurso e status
SELECT
    rv.id_reserva,
    u.nome AS usuario,
    r.nome AS recurso,
    rv.data_reserva,
    rv.hora_inicio,
    rv.hora_fim,
    rv.numero_pessoas,
    sr.nome AS status
FROM reserva rv
INNER JOIN usuario u ON u.id_usuario = rv.id_usuario
INNER JOIN recurso r ON r.id_recurso = rv.id_recurso
INNER JOIN status_reserva sr ON sr.id_status = rv.status_id
ORDER BY rv.data_reserva, rv.hora_inicio;

-- Consulta auxiliar para verificar conflito de horário
SELECT id_reserva
FROM reserva
WHERE id_recurso = 1
  AND data_reserva = '2026-10-10'
  AND status_id <> 3
  AND '19:00:00' < hora_fim
  AND '21:00:00' > hora_inicio;

-- =====================================================
-- 3. ATUALIZAÇÃO (UPDATE)
-- =====================================================

-- Confirmar uma reserva pendente
UPDATE reserva
SET status_id = 2
WHERE id_reserva = 2;

-- Alterar telefone do usuário
UPDATE usuario
SET telefone = '(67) 99999-3333'
WHERE id_usuario = 1;

-- =====================================================
-- 4. REMOÇÃO (DELETE)
-- =====================================================

-- Exemplo acadêmico de remoção de uma reserva.
-- Em uso real, o sistema pode preferir alterar o status para Cancelada
-- para manter o histórico.
DELETE FROM reserva
WHERE id_reserva = 2;

-- =====================================================
-- 5. CONSULTA FINAL PARA CONFERÊNCIA
-- =====================================================

SELECT
    rv.id_reserva,
    u.nome AS usuario,
    r.nome AS recurso,
    rv.data_reserva,
    rv.hora_inicio,
    rv.hora_fim,
    sr.nome AS status
FROM reserva rv
INNER JOIN usuario u ON u.id_usuario = rv.id_usuario
INNER JOIN recurso r ON r.id_recurso = rv.id_recurso
INNER JOIN status_reserva sr ON sr.id_status = rv.status_id
ORDER BY rv.id_reserva;
