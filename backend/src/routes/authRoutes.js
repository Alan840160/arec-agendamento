const express = require('express');
const AuthController = require('../controllers/authController');

const router = express.Router();

const userRepository = {
  users: [],
  async findByEmail(email) {
    return this.users.find((user) => user.email === email);
  },
  async create(user) {
    const newUser = { id: Date.now().toString(), ...user };
    this.users.push(newUser);
    return newUser;
  }
};

const authController = new AuthController(userRepository);

router.post('/register', authController.register);
router.post('/login', authController.login);

module.exports = router;
