# 🏢 AREC - Sistema de Gestão e Agendamento

> Sistema web responsivo para gerenciar reservas de recursos recreativos da Associação Recreativa dos Colaboradores da Copasul (AREC).

## 📋 Objetivo

Digitalizar e automatizar o processo de reservas de recursos recreativos, eliminando problemas como:
- ❌ Reservas duplicadas
- ❌ Falta de transparência
- ❌ Demora na confirmação
- ❌ Dificuldade de controle administrativo
- ❌ Conflitos entre associados

## 🏄 Recursos do Sistema

### Para Associados
- ✅ Login seguro
- ✅ Consultar disponibilidade
- ✅ Criar reservas
- ✅ Cancelar reservas
- ✅ Histórico de reservas
- ✅ Receber notificações

### Para Administradores
- ✅ Gerenciar usuários
- ✅ Gerenciar recursos
- ✅ Aprovar/rejeitar reservas
- ✅ Aplicar penalidades
- ✅ Consultar relatórios
- ✅ Auditar movimentações

## 🏗️ Estrutura do Projeto

```
arec-agendamento/
├── backend/              # API Express.js
│   ├── src/
│   │   ├── config/       # Configurações
│   │   ├── controllers/  # Lógica de negócio
│   │   ├── models/       # Modelos do banco
│   │   ├── routes/       # Rotas da API
│   │   ├── middleware/   # Middlewares
│   │   ├── utils/        # Utilitários
│   │   └── app.js        # App principal
│   ├── docker-compose.yml
│   ├── .env.example
│   └── README.md         # Documentação backend
│
├── frontend/             # React + Next.js (em breve)
│
└── docs/                 # Documentação geral
    ├── ARQUITETURA.md
    ├── API.md
    └── SETUP.md
```

## 🚀 Quick Start

### Backend

```bash
cd backend
npm install
cp .env.example .env
docker-compose up -d
npm run dev
```

API rodando em `http://localhost:3000`

### Frontend (em breve)

```bash
cd frontend
npm install
npm run dev
```

## 🛠️ Tecnologias

### Backend
- **Express.js** - Framework web
- **Node.js** - Runtime JavaScript
- **PostgreSQL** - Banco de dados
- **JWT** - Autenticação

### Frontend
- **React** - UI library
- **Next.js** - Framework React
- **Tailwind CSS** - Estilos
- **Axios** - HTTP client

### DevOps
- **Docker** - Containerização
- **Docker Compose** - Orquestração

## 📚 Documentação

- [📖 Arquitetura do Sistema](./docs/ARQUITETURA.md)
- [🔍 Documentação da API](./docs/API.md)
- [⚙️ Guia de Setup](./docs/SETUP.md)
- [🎯 Backend Express](./backend/README.md)

## 📝 Status do Projeto

### ✅ Fase 1 - Backend Base (Em Progresso)
- [x] Setup inicial Express
- [x] Configuração PostgreSQL
- [x] Estrutura de pastas
- [ ] Autenticação JWT
- [ ] CRUD de usuários
- [ ] CRUD de recursos
- [ ] Sistema de reservas

### ⏳ Fase 2 - Frontend
- [ ] Setup React
- [ ] Login
- [ ] Dashboard
- [ ] Calendário de reservas

### ⏳ Fase 3 - Funcionalidades Avançadas
- [ ] Notificações
- [ ] Relatórios
- [ ] Penalidades
- [ ] Auditoria

## 👥 Contribuidores

- Alan840160 - Desenvolvedor

## 📞 Contato

Para dúvidas ou sugestões, abra uma **Issue** no GitHub.

---

**Desenvolvido com ❤️ para a AREC**
