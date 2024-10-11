const express = require('express');
const db = require('../db');
const router = express.Router();
const authenticateToken = require('../middleware/auth');

// Listar postagens por categoria
router.get('/postagens/:categoria_id', async (req, res) => {
  try {
    const [rows] = await db.execute('CALL listar_postagens_por_categoria(?)', [req.params.categoria_id]);
    res.json(rows[0]);
  } catch (error) {
    res.status(500).send('Erro ao listar postagens.');
  }
});

// Listar postagem

router.get('/postagem/:id', async (req, res) => {
  try {
    const [rows] = await db.execute('CALL ver_postagem(?)', [req.params.id]);
    res.json(rows[0][0]);
  } catch (error) {
    res.status(500).send('Erro ao listar postagem.');
  }
});

// Criar uma nova postagem (precisa de autenticação)
router.post('/postagens', authenticateToken, async (req, res) => {
  const { conteudo, categoria_id } = req.body;
  
  try {
    await db.execute('CALL criar_postagem(?, ?, ?)', [conteudo, req.user.id, categoria_id]);
    res.status(201).send('Postagem criada com sucesso!');
  } catch (error) {
    res.status(500).send('Erro ao criar postagem.');
  }
});

// Listar respostas de uma postagem
router.get('/respostas/:postagem_id', async (req, res) => {
  try {
    const [rows] = await db.execute('CALL listar_respostas_por_postagem(?)', [req.params.postagem_id]);
    res.json(rows);
  } catch (error) {
    res.status(500).send('Erro ao listar respostas.');
  }
});

// Criar uma nova resposta (precisa de autenticação)
router.post('/respostas', authenticateToken, async (req, res) => {
  const { conteudo, postagem_id } = req.body;
  
  try {
    await db.execute('CALL criar_resposta(?, ?, ?)', [conteudo, req.user.id, postagem_id]);
    res.status(201).send('Resposta criada com sucesso!');
  } catch (error) {
    res.status(500).send('Erro ao criar resposta.');
  }
});

router.get('/buscar_categorias', async (req, res) => {
  try {
    const [rows] = await db.execute('CALL ver_categorias()');
    const categorias = rows[0]; // Acessa apenas o array de resultados
    res.json(categorias);
  } catch (error) {
    console.error('Erro ao listar categorias:', error);
    res.status(500).send('Erro ao listar categorias.');
  }
});

// Rota para buscar postagens por categoria listar_postagens_por_categoria(categoria_id)
router.get('/categorias/:categoriaId/postagens', async (req, res) => {
  const { categoriaId } = req.params;
  try {
      const [rows] = await db.execute(`CALL listar_postagens_por_categoria(?)`, [categoriaId]);
      res.json(rows); // Retorna as postagens como JSON
  } catch (error) {
      console.error('Erro ao buscar postagens:', error);
      res.status(500).json({ message: 'Erro ao buscar postagens' });
  }
});

// Rota para buscar os comentários de uma postagem
router.get('/postagens/:id/comentarios', async (req, res) => {
  const postagemId = req.params.id;
  try {
      const comentarios = await db.query(`
          SELECT r.*, u.nome_usuario 
          FROM respostas_postagens r 
          JOIN usuarios u ON r.usuario_id = u.id 
          WHERE r.postagem_id = ? 
          ORDER BY r.data_resposta ASC`, [postagemId]);

      res.json(comentarios[0]);
  } catch (error) {
      res.status(500).json({ error: 'Erro ao buscar os comentários' });
  }
});


module.exports = router;
