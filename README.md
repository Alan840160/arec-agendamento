# AREC - Sistema de Gestão e Agendamento

Aplicação web responsiva para apoiar o processo de reservas de recursos recreativos da Associação Recreativa dos Colaboradores da Copasul (AREC).

## Módulo 2 — Frontend

O frontend do MVP foi desenvolvido com **Vue 3, Vite, JavaScript, HTML5 semântico e CSS3 responsivo**. Esta implementação dá continuidade aos requisitos levantados no Módulo 1 do Projeto Integrador.

### Funcionalidades implementadas

- Solicitação de nova reserva por recurso, data e horário.
- Validação de campos obrigatórios.
- Validação do horário de término em relação ao início.
- Detecção de conflito de horário para o mesmo recurso e data.
- Listagem das reservas.
- Cancelamento de reserva.
- Resumo de reservas ativas e recursos disponíveis.
- Interface responsiva para diferentes tamanhos de tela.
- Estrutura semântica e recursos básicos de acessibilidade.

> Nesta versão do frontend, os dados são mantidos em memória. A persistência definitiva e a integração completa com o backend permanecem como evolução do projeto.

## Estrutura principal

```
arec-agendamento/
├── backend/                 # Estrutura base da API Express.js
├── frontend/                # Aplicação Vue 3 + Vite
│   ├── src/
│   │   ├── assets/
│   │   ├── components/
│   │   ├── App.vue
│   │   └── main.js
│   ├── index.html
│   ├── package.json
│   └── vite.config.js
├── docs/
└── .github/workflows/       # Validação automatizada do frontend
```

## Executar o frontend

```bash
cd frontend
npm install
npm run dev
```

Para validar a versão de produção:

```bash
npm run build
```

## Tecnologias

### Frontend
- Vue 3
- Vite
- JavaScript
- HTML5
- CSS3

### Backend — estrutura existente
- Node.js
- Express.js
- PostgreSQL

### Validação e publicação
- GitHub Actions para validação do build
- Vercel para publicação do frontend

## Status

### Frontend do Módulo 2
- [x] Configuração Vue 3 + Vite
- [x] Interface responsiva
- [x] Formulário de reserva
- [x] Validação de horários
- [x] Validação de conflitos
- [x] Listagem de reservas
- [x] Cancelamento
- [x] Build automatizado validado
- [x] Implantação web validada

### Evoluções previstas
- [ ] Persistência das reservas no backend
- [ ] Autenticação
- [ ] Painel administrativo
- [ ] Notificações
- [ ] Relatórios e auditoria

## Autor

Alan da Silva Oliveira — Tecnologia da Informação / UFMS.
