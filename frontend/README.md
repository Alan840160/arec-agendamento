# 🎨 AREC Frontend

Frontend React + Next.js para o Sistema de Gestão e Agendamento da AREC.

## 🚀 Quick Start

### Pré-requisitos
- Node.js 18+
- npm ou yarn

### Instalação

```bash
cd frontend
npm install
cp .env.example .env.local
npm run dev
```

Acesse: `http://localhost:3000`

## 📦 Scripts

- `npm run dev` - Inicia servidor de desenvolvimento
- `npm run build` - Build para produção
- `npm run start` - Inicia servidor de produção
- `npm run lint` - Verifica linting
- `npm run lint:fix` - Corrige erros de linting

## 🏗️ Estrutura

```
src/
├── app/              # Páginas (App Router)
│   ├── page.tsx      # Home
│   ├── login/        # Login
│   ├── register/     # Registro
│   ├── dashboard/    # Dashboard (TODO)
│   └── layout.tsx    # Layout principal
├── components/       # Componentes reutilizáveis (TODO)
├── lib/              # Utilitários
│   └── api.ts        # Cliente Axios
├── styles/           # Estilos globais
└── types/            # TypeScript types
```

## 🎯 Próximos Passos

- [ ] Integrar autenticação com backend
- [ ] Implementar dashboard
- [ ] Criar calendário de reservas
- [ ] Adicionar testes
- [ ] Implementar notificações

## 🛠️ Stack

- **Next.js 14** - Framework React
- **React 18** - UI library
- **TypeScript** - Type safety
- **Tailwind CSS** - Styling
- **Axios** - HTTP client
- **js-cookie** - Cookie management

## 📚 Documentação

Ver [../README.md](../README.md) para mais informações sobre todo o projeto.
