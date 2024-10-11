document.addEventListener('DOMContentLoaded', () => {
    const postagemId = new URLSearchParams(window.location.search).get('id');

    // Função para carregar a postagem
    async function carregarPostagem() {
        try {
            const resposta = await fetch(`/postagem/${postagemId}`);
            const postagem = await resposta.json();

            console.log('Postagem:', postagem);

            document.getElementById('categoria-postagem').innerText = postagem.nome_categoria;
            document.getElementById('conteudo-postagem').innerText = postagem.conteudo;
            document.getElementById('autor-postagem').innerText = `Por: ${postagem.nome_usuario}`;
            document.getElementById('data-postagem').innerText = new Date(postagem.data_postagem).toLocaleString('pt-BR', {
                year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'
            });
        } catch (error) {
            console.error('Erro ao carregar postagem:', error);
        }
    }

    // Função para carregar os comentários
    async function carregarComentarios() {
        try {
            const resposta = await fetch(`/postagens/${postagemId}/comentarios`);
            const comentarios = await resposta.json();

            const listaComentarios = document.getElementById('lista-comentarios');
            listaComentarios.innerHTML = '';

            comentarios.forEach(comentario => {
                const comentarioDiv = document.createElement('div');
                comentarioDiv.classList.add('comentario-item');
                comentarioDiv.innerHTML = `
                    <p><strong>${comentario.nome_usuario}</strong> - ${new Date(comentario.data_resposta).toLocaleString('pt-BR', {
                        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'
                    })}</p>
                    <p>${comentario.conteudo}</p>
                `;
                listaComentarios.appendChild(comentarioDiv);
            });
        } catch (error) {
            console.error('Erro ao carregar comentários:', error);
        }
    }

    carregarPostagem();
    carregarComentarios();
});
