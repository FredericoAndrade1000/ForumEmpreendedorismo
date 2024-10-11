const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../db'); // Aqui está sua conexão com o banco de dados
const router = express.Router();

// Rota para login
router.post('/login', async (req, res) => {
  const { email, senha } = req.body;

  try {
    const [rows] = await db.execute('SELECT * FROM usuarios WHERE email = ?', [email]);
    const user = rows[0];

    if (!user || !(await bcrypt.compare(senha, user.senha))) {
      return res.status(400).json({ message: 'Credenciais inválidas' });
    }

    // Gerar o token JWT
    const token = jwt.sign({ id: user.id, email: user.email }, process.env.JWT_SECRET, { expiresIn: '1h' });
    res.json({ token });
  } catch (error) {
    res.status(500).json({ message: 'Erro ao autenticar usuário.' });
    console.error(error);
  }
});

// Rota para registrar um novo usuário
router.post('/register', async (req, res) => {
  const { nome_usuario, email, senha, profissao, interesses } = req.body;

  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(senha, salt);

  try {
    await db.execute(
      'CALL criar_usuario(?, ?, ?, ?, ?)',
      [nome_usuario, email, hashedPassword, profissao, interesses]
    );
    res.status(201).json({ message: 'Usuário registrado com sucesso!' });
  } catch (error) {
    res.status(500).json({ message: 'Erro ao registrar usuário.' });
    console.error(error);
  }
});

module.exports = router;
