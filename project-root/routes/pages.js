const express = require('express');
const path = require('path');
const router = express.Router();
const fs = require('fs');

// Função utilitária para servir arquivos HTML
function servePage(page) {
  console.log('Serving page:', page);

  // Ler o arquivo principal (main.html)
  let mainTemplate = fs.readFileSync(path.join(__dirname, '..', 'public', 'main.html'), 'utf-8');
  let pageContent = fs.readFileSync(path.join(__dirname, '..', 'public', page), 'utf-8');

  // Remover o BOM caso exista
  mainTemplate = mainTemplate.replace(/^\uFEFF/, '');
  pageContent = pageContent.replace(/^\uFEFF/, '');

  // Substituir o placeholder pelo conteúdo da página
  const html = mainTemplate.replace('replaced_content', pageContent);

  return (req, res) => {
      res.send(html);
  };
}


router.get('/inicio', servePage('inicio.html'));
router.get('/sobre', servePage('sobre.html'));
router.get('/contato', servePage('contato.html'));
router.get('/categorias', servePage('categorias.html'));
router.get('/entrar', servePage('entrar.html'));
router.get('/cadastrar', servePage('cadastrar.html'));
router.get('/categoria', servePage('categoria.html'));
router.get('/postagem', servePage('postagem.html')); 

module.exports = router;
