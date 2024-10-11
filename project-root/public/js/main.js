function loadPage(page) {
    const mainContent = document.getElementById('main-content');

    fetch(page)
        .then(response => {
            if (!response.ok) {
                throw new Error("HTTP error! status: ");
            }
            return response.text();
        })
        .then(html => {
            mainContent.innerHTML = html;
        })
        .catch(error => {
            mainContent.innerHTML = "<p>Erro ao carregar a página: </p>";
        });
}

const isLoggedIn = false;

function logout() {
    alert("Você saiu!");
    window.location.reload();
}

function enviarEmail() {
    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
    const mensagem = document.getElementById('mensagem').value;

    const assunto = `Contato de ${nome}`;
    const corpoEmail = `Nome: ${nome}%0D%0AEmail: ${email}%0D%0AMensagem:%0D%0A${mensagem}`;

    // Montando o esquema mailto
    const mailtoLink = `mailto:contato@forumempreendedorismo.com?subject=${encodeURIComponent(assunto)}&body=${encodeURIComponent(corpoEmail)}`;

    // Abrindo o cliente de e-mail padrão
    window.location.href = mailtoLink;
}

async function processarRegistro() {
    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
    const senha = document.getElementById('senha').value;
    const profissao = document.getElementById('profissao').value;
    const interesses = document.getElementById('interesses').value;


    // mandar um POST para o servidor, /register nome_usuario, email, senha, profissao, interesses

    await fetch('/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ nome_usuario: nome, email, senha, profissao, interesses })
    });

    alert('Usuário registrado com sucesso!');

    loadPage('login.html');
}

async function processarLogin() {
    const email = document.getElementById('email').value;
    const senha = document.getElementById('senha').value;

    // mandar um POST para o servidor, /login email, senha

    const response = await fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email, senha })
    });

    const { token } = await response.json();

    localStorage.setItem('token', token);

    alert('Login efetuado com sucesso!');

    loadPage('home.html');
}

