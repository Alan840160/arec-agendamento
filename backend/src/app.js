const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
require('dotenv').config();

const authRoutes = require('./routes/authRoutes');
const resourceRoutes = require('./routes/resourceRoutes');
const errorHandler = require('./middleware/errorHandler');

const app = express();

// ====== MIDDLEWARES DE SEGURANÇA ======
app.use(helmet());
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:3001',
  credentials: true
}));

// ====== MIDDLEWARES DE PARSING ======
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// ====== ROTAS DA API ======
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/resources', resourceRoutes);

// ====== ROTA DE SAÚDE ======
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'OK',
    message: 'API da AREC está funcionando!',
    timestamp: new Date().toISOString()
  });
});

// ====== ROTA DE BEM-VINDO ======
app.get('/', (req, res) => {
  res.status(200).json({
    message: 'Bem-vindo à API da AREC - Sistema de Agendamento',
    version: '1.0.0',
    docs: 'http://localhost:3000/docs'
  });
});

// ====== TRATAMENTO DE ERROS 404 ======
app.use((req, res) => {
  res.status(404).json({
    error: 'Rota não encontrada',
    path: req.path,
    method: req.method
  });
});

// ====== TRATAMENTO DE ERROS GLOBAL ======
app.use(errorHandler);

// ====== INICIAR SERVIDOR ======
if (require.main === module) {
  const PORT = process.env.PORT || 3000;
  const HOST = process.env.HOST || 'localhost';

  app.listen(PORT, () => {
    console.log(`\n✅ Servidor rodando em http://${HOST}:${PORT}`);
    console.log(`📊 Health check: http://${HOST}:${PORT}/health\n`);
  });
}

module.exports = app;
