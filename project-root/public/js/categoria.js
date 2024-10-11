// Função para extrair o valor de um parâmetro da URL
function getQueryParam(param) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(param);
}

// Função para carregar as postagens da categoria
async function carregarPostagens(categoriaId) {
    try {
        const response = await fetch(`/postagens/${categoriaId}`);
        const postagens = await response.json();
        const container = document.getElementById('postagens-container');
        container.innerHTML = '';

        if (postagens.length > 0) {
            postagens.forEach(postagem => {
                const postagemDiv = document.createElement('div');
                postagemDiv.classList.add('postagem-item');

                // Adiciona um link para a página da postagem, passando o ID como parâmetro
                postagemDiv.innerHTML = `
                    <a href="/postagem?id=${postagem.id}" class="postagem-link">
                        <h4>${postagem.nome_usuario} - ${new Date(postagem.data_postagem).toLocaleString('pt-BR', {
                                        year: 'numeric',
                                        month: '2-digit',
                                        day: '2-digit',
                                        hour: '2-digit',
                                        minute: '2-digit'
                                    })}</h4>
                        <p>${postagem.conteudo}</p>
                    </a>
                `;
                container.appendChild(postagemDiv);
            });
        } else {
            container.innerHTML = '<p>Nenhuma postagem encontrada nesta categoria.</p>';
        }
    } catch (error) {
        console.error('Erro ao carregar postagens:', error);
    }
}

// Função para carregar os detalhes da categoria
async function carregarDetalhesCategoria(categoriaId) {
    try {
        const response = await fetch(`/buscar_categorias`);
        const categoria = await response.json();

        const nome = categoria[categoriaId - 1].nome;
        const descricao = categoria[categoriaId - 1].descricao

        document.getElementById('categoria-nome').textContent = nome;
        document.getElementById('categoria-descricao').textContent = descricao;
    } catch (error) {
        console.error('Erro ao carregar detalhes da categoria:', error);
    }
}

// Função para voltar à lista de categorias
function voltarParaCategorias() {
    window.location.href = 'categorias';
}

// Carregar dados da categoria e postagens ao carregar a página
window.onload = function () {
    const categoriaId = getQueryParam('categoriaId');
    if (categoriaId) {
        carregarDetalhesCategoria(categoriaId);
        carregarPostagens(categoriaId);
    } else {
        alert('Categoria inválida');
        voltarParaCategorias();
    }
};