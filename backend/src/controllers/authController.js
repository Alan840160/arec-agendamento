const AuthService = require('../services/authService');

class AuthController {
  constructor(userRepository) {
    this.authService = new AuthService(userRepository);
  }

  register = async (req, res, next) => {
    try {
      const result = await this.authService.register(req.body);
      return res.status(201).json(result);
    } catch (error) {
      next(error);
    }
  };

  login = async (req, res, next) => {
    try {
      const result = await this.authService.login(req.body);
      return res.status(200).json(result);
    } catch (error) {
      next(error);
    }
  };
}

module.exports = AuthController;
