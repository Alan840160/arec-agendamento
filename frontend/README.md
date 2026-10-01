# Frontend AREC — Módulo 2

Aplicação web dinâmica e responsiva para gestão de reservas de recursos recreativos da AREC-Copasul. Esta etapa implementa um MVP baseado nos requisitos levantados no Módulo 1 do Projeto Integrador.

## Tecnologias

- Vue 3
- Vite
- JavaScript
- HTML5 semântico
- CSS3 responsivo

## Funcionalidades do MVP

- Solicitação de reserva por recurso, data e horário
- Validação de campos obrigatórios
- Validação de horário inicial e final
- Detecção de conflito de horário para o mesmo recurso e data
- Listagem das reservas
- Cancelamento de reserva
- Resumo de reservas ativas e recursos
- Interface adaptável a telas menores

Os dados são mantidos apenas em memória nesta versão do frontend. A integração persistente com o backend não faz parte deste MVP do Módulo 2.

## Estrutura

`src/App.vue` concentra o estado do MVP e as regras de interação. A interface é dividida em componentes em `src/components`: cabeçalho, formulário e lista de reservas. Os estilos globais estão em `src/assets/main.css`.

## Executar

Requer Node.js instalado.

```bash
cd frontend
npm install
npm run dev
```

Para verificar a compilação de produção:

```bash
npm run build
```

## Projeto acadêmico

Projeto Integrador — Tecnologia da Informação — UFMS Digital — 2026.2.
