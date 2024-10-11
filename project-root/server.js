const express = require('express');
const dotenv = require('dotenv');
const path = require('path');
const forumRoutes = require('./routes/forum');
const pageRoutes = require('./routes/pages');
const authRoutes = require('./routes/auth');

dotenv.config();

const app = express();

// Middleware para servir arquivos estáticos como CSS, JS e imagens
app.use(express.static(path.join(__dirname, 'public')));

// Middleware para trabalhar com JSON
app.use(express.json());

// Redirecionar o caminho "/" para "/inicio" antes das outras rotas
app.get('/', (req, res) => {
  res.redirect('/inicio');
});

// Rotas para o fórum
app.use('/', forumRoutes);

// Rotas para as páginas estáticas
app.use('/', pageRoutes);

// Rotas para autenticação
app.use('/', authRoutes);

// Inicializar o servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
