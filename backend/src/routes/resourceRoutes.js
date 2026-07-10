const express = require('express');
const router = express.Router();

const resources = [
  { id: '1', name: 'Quadra de Basquete', type: 'Esporte', capacity: 20 },
  { id: '2', name: 'Salão de Festas', type: 'Eventos', capacity: 80 }
];

router.get('/', (req, res) => {
  res.status(200).json(resources);
});

module.exports = router;
