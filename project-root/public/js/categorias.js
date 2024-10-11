// Função para carregar as categorias
async function carregarCategorias() {
    try {
        const response = await fetch('/buscar_categorias');
        const categorias = await response.json();
        const container = document.getElementById('categorias-container');
        container.innerHTML = '';

        categorias.forEach(categoria => {
            const categoriaDiv = document.createElement('div');
            categoriaDiv.classList.add('categoria-item');
            categoriaDiv.innerHTML = `
                        <h3>${categoria.nome}</h3>
                        <p>${categoria.descricao}</p>
                        <a href="categoria?categoriaId=${categoria.id}">Ver Postagens</a>
                    `;
            container.appendChild(categoriaDiv);
        });
    } catch (error) {
        console.error('Erro ao carregar categorias:', error);
    }
}

// Função para carregar postagens por categoria
async function carregarPostagens(categoriaId) {
    try {
        const response = await fetch(`/categorias/${categoriaId}/postagens`);
        const postagens = await response.json();
        const container = document.getElementById('postagens-container');
        container.innerHTML = '';

        if (postagens.length > 0) {
            postagens.forEach(postagem => {
                const postagemDiv = document.createElement('div');
                postagemDiv.classList.add('postagem-item');
                postagemDiv.innerHTML = `
                            <h4>${postagem.nome_usuario} - ${new Date(postagem.data_postagem).toLocaleDateString()}</h4>
                            <p>${postagem.conteudo}</p>
                        `;
                container.appendChild(postagemDiv);
            });
        } else {
            container.innerHTML = '<p>Nenhuma postagem encontrada nesta categoria.</p>';
        }

        // Exibir a seção de postagens e esconder as categorias
        document.getElementById('postagens-list').style.display = 'block';
        document.getElementById('categorias-list').style.display = 'none';
    } catch (error) {
        console.error('Erro ao carregar postagens:', error);
    }
}

// Função para voltar à lista de categorias
function voltarParaCategorias() {
    document.getElementById('postagens-list').style.display = 'none';
    document.getElementById('categorias-list').style.display = 'block';
}

// Carregar as categorias quando a página for carregada
window.onload = carregarCategorias;