# Modelagem do Banco de Dados - AREC-Copasul

## Objetivo

Esta modelagem representa os dados necessários para o Sistema de Gestão de Reservas AREC-Copasul, permitindo organizar usuários, recursos recreativos e reservas.

## Entidades

### USUARIO
- id_usuario: INT - chave primária
- nome: VARCHAR(100) - obrigatório
- cpf: VARCHAR(14) - obrigatório e único
- telefone: VARCHAR(20)
- email: VARCHAR(120) - único
- tipo_usuario: VARCHAR(30) - obrigatório

### RECURSO
- id_recurso: INT - chave primária
- nome: VARCHAR(100) - obrigatório
- descricao: VARCHAR(255)
- capacidade: INT - obrigatório
- status: VARCHAR(20) - obrigatório

### RESERVA
- id_reserva: INT - chave primária
- id_usuario: INT - chave estrangeira para USUARIO
- id_recurso: INT - chave estrangeira para RECURSO
- data_reserva: DATE - obrigatório
- hora_inicio: TIME - obrigatório
- hora_fim: TIME - obrigatório
- numero_pessoas: INT - obrigatório
- status: VARCHAR(20) - obrigatório
- data_criacao: DATETIME - obrigatório

## Relacionamentos

- Um USUARIO pode realizar várias RESERVAS.
- Cada RESERVA pertence a um único USUARIO.
- Um RECURSO pode possuir várias RESERVAS.
- Cada RESERVA está associada a um único RECURSO.

## Cardinalidades

USUARIO 1:N RESERVA

RECURSO 1:N RESERVA

## Regras iniciais

- CPF de usuário não pode ser repetido.
- O número de pessoas deve ser maior que zero.
- O horário final deve ser posterior ao horário inicial.
- A quantidade de pessoas de uma reserva deve respeitar a capacidade do recurso.
- Reservas para o mesmo recurso, data e período não devem possuir horários sobrepostos.
