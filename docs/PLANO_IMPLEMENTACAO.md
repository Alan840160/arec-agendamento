# Plano de Implementação do AREC Agendamento

## Objetivo
Criar um MVP funcional do sistema de agendamento da AREC, começando pelo backend e evoluindo para uma interface simples e segura.

## Fase 1 — Fundação do projeto
- Definir a arquitetura geral do sistema.
- Organizar o backend em módulos claros: rotas, controllers, services, models, middlewares e utils.
- Definir o modelo de dados inicial.
- Definir ambiente de desenvolvimento com Node.js, Express e PostgreSQL.

### Entregáveis
- Estrutura de pastas consistente.
- Arquivo de configuração de ambiente.
- Docker Compose funcionando para PostgreSQL.

## Fase 2 — MVP backend
- Criar conexão com o banco PostgreSQL.
- Implementar models para:
  - usuários
  - recursos
  - reservas
- Implementar rotas básicas:
  - cadastro e login
  - listagem de recursos
  - criação de reservas
  - consulta de reservas
- Implementar validações e tratamento de erros.

### Entregáveis
- API com endpoints iniciais funcionais.
- Banco com tabelas básicas.
- Testes iniciais para os fluxos principais.

## Fase 3 — Autenticação e autorização
- Implementar autenticação com JWT.
- Criar middleware para proteger rotas.
- Definir papéis de usuário:
  - associado
  - administrador
- Criar fluxo de recuperação de senha (opcional na fase inicial).

### Entregáveis
- Login seguro.
- Rotas protegidas.
- Controle básico de permissões.

## Fase 4 — Regras de negócio do agendamento
- Validar conflitos de horário.
- Impedir duplicidade de reserva.
- Criar status de reserva:
  - pendente
  - aprovada
  - cancelada
  - recusada
- Implementar cancelamento e histórico.

### Entregáveis
- Fluxo de reserva funcional.
- Regras básicas de conflito e estado.

## Fase 5 — Frontend inicial
- Criar uma interface simples com React ou outra abordagem leve.
- Implementar telas mínimas:
  - login
  - dashboard do associado
  - listagem de recursos
  - formulário de reserva
- Integrar com a API backend.

### Entregáveis
- Interface funcional para uso básico.
- Experiência inicial do usuário.

## Fase 6 — Qualidade e operação
- Adicionar testes automatizados.
- Criar documentação da API.
- Definir boas práticas de segurança.
- Preparar ambiente para deploy.

### Entregáveis
- Código com melhor cobertura e organização.
- Documentação pronta para suporte e evolução.

## Ordem recomendada de execução
1. Estruturar a arquitetura do backend.
2. Implementar banco e modelos.
3. Criar autenticação.
4. Desenvolver o fluxo de reservas.
5. Montar uma interface simples.
6. Validar e refinar.

## Critério de sucesso do MVP
O MVP estará pronto quando for possível:
- cadastrar e autenticar usuário,
- visualizar recursos,
- criar uma reserva,
- consultar reservas,
- ter uma interface simples funcionando.

## Próximo passo sugerido
Começar pela Fase 2 com a implementação do banco e dos modelos básicos de usuário, recurso e reserva.
