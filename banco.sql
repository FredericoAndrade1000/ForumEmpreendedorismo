/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `banco_de_dados_forum_empreendedorismo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco_de_dados_forum_empreendedorismo`;

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

REPLACE INTO `categorias` (`id`, `nome`, `descricao`) VALUES
	(1, 'Inovação e Tecnologia', 'Discussões sobre novas tecnologias, inovações e tendências que impactam o mundo dos negócios.'),
	(2, 'Finanças e Investimentos', 'Dicas e estratégias sobre como gerenciar as finanças de um negócio e investir no crescimento.'),
	(3, 'Marketing e Vendas', 'Tudo sobre estratégias de marketing digital, publicidade e técnicas de vendas.'),
	(4, 'Empreendedorismo Social', 'Foco em negócios que buscam impacto social positivo, além do lucro financeiro.'),
	(5, 'Startups', 'Discussões sobre o mundo das startups, desde a ideia inicial até o crescimento escalável.'),
	(6, 'Gestão de Pessoas', 'Como gerenciar equipes, desenvolver lideranças e manter um ambiente de trabalho saudável.'),
	(7, 'E-commerce', 'Tópicos relacionados ao comércio eletrônico e às melhores práticas para vender online.'),
	(8, 'Sustentabilidade nos Negócios', 'Como implementar práticas sustentáveis nos negócios e ao mesmo tempo manter a rentabilidade.'),
	(9, 'Desenvolvimento Pessoal', 'Discussões sobre crescimento pessoal, produtividade e habilidades essenciais para empreendedores.'),
	(10, 'Franquias', 'Tópicos relacionados a modelos de franquia, desde a compra até a operação de franquias.');

CREATE TABLE IF NOT EXISTS `postagens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conteudo` text NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `data_postagem` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `postagens_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `postagens_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

REPLACE INTO `postagens` (`id`, `conteudo`, `usuario_id`, `categoria_id`, `data_postagem`) VALUES
	(1, 'Alguém aqui já aplicou soluções de IA em pequenas empresas? Tô pensando em colocar um chatbot, mas não sei por onde começar. Alguém dá uma força?', 1, 1, '2024-10-06 22:00:00'),
	(2, 'Tô pensando em investir numa startup de tecnologia. Alguém tem experiência com isso? Quais os maiores riscos que eu deveria considerar?', 5, 2, '2024-10-06 22:00:00'),
	(3, 'Meu site tem um bom tráfego, mas as vendas não tão acompanhando. Alguma dica pra melhorar as conversões?', 8, 3, '2024-10-06 22:00:00'),
	(4, 'Tô tocando um projeto de impacto social em educação, mas tá difícil atrair investidores. Alguma sugestão?', 12, 4, '2024-10-06 22:00:00'),
	(5, 'Tô começando uma startup, mas não manjo nada da parte técnica. Alguém sabe onde posso encontrar um cofundador técnico?', 17, 5, '2024-10-06 22:00:00'),
	(6, 'Tenho um colaborador que era super engajado, mas agora parece que tá desmotivado. Já conversei, mas nada mudou. Alguma ideia?', 10, 6, '2024-10-06 22:00:00'),
	(7, 'Tô montando uma loja virtual e tô na dúvida sobre qual plataforma escolher. Alguém aí tem sugestões?', 13, 7, '2024-10-06 22:00:00'),
	(8, 'Quero tornar minha pequena empresa mais sustentável, mas tô meio perdida por onde começar. Alguém já passou por isso?', 11, 8, '2024-10-06 22:00:00'),
	(9, 'Tô trabalhando remoto há meses e tô sentindo uma falta de motivação. Alguma dica pra melhorar minha rotina?', 9, 9, '2024-10-06 22:00:00'),
	(10, 'Tô pensando em abrir uma franquia de baixo custo, mas não sei se vale a pena. Alguém aqui tem experiência com isso?', 15, 10, '2024-10-06 22:00:00');

CREATE TABLE IF NOT EXISTS `respostas_postagens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conteudo` text NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `postagem_id` int DEFAULT NULL,
  `data_resposta` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `postagem_id` (`postagem_id`),
  CONSTRAINT `respostas_postagens_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `respostas_postagens_ibfk_2` FOREIGN KEY (`postagem_id`) REFERENCES `postagens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

REPLACE INTO `respostas_postagens` (`id`, `conteudo`, `usuario_id`, `postagem_id`, `data_resposta`) VALUES
	(1, 'Opa Carlos, aqui a gente colocou um chatbot na loja online e foi show! Usamos o ManyChat, super fácil de mexer.', 2, 1, '2024-10-06 22:00:00'),
	(2, 'Cara, cuidado com esses chatbots. Eles podem ajudar bastante, mas se não for bem configurado, só irrita o cliente.', 3, 1, '2024-10-06 22:00:00'),
	(3, 'Já pensou em automatizar o marketing com IA também? Funciona bem pra e-commerce.', 4, 1, '2024-10-06 22:00:00'),
	(4, 'Mariana, o risco maior é a liquidez. Investir em startup pode demorar anos pra ver algum retorno, fica de olho.', 6, 2, '2024-10-06 22:00:00'),
	(5, 'Eu investi numa startup ano passado, foi arriscado, mas deu certo. Se a equipe for boa e o mercado tiver crescendo, pode valer a pena.', 7, 2, '2024-10-06 22:00:00'),
	(6, 'Não esquece de diversificar. Apostar tudo numa startup só pode ser bem arriscado.', 8, 2, '2024-10-06 22:00:00'),
	(7, 'Bruno, já deu uma olhada no checkout? Às vezes o problema tá lá, muita gente desiste no final.', 9, 3, '2024-10-06 22:00:00'),
	(8, 'Investir em remarketing ajuda bastante! A maioria das minhas vendas vem de pessoas que já passaram pelo site várias vezes.', 10, 3, '2024-10-06 22:00:00'),
	(9, 'Mete mais chamadas pra ação, CTAs visíveis. Isso ajudou bastante a aumentar minhas conversões.', 11, 3, '2024-10-06 22:00:00'),
	(10, 'Eduardo, tenta apresentar seu projeto em eventos de pitch pra fundos de impacto. Tem uns eventos legais pra isso.', 5, 4, '2024-10-06 22:00:00'),
	(11, 'Já pensou em fazer parceria com ONGs que atuam no mesmo setor? Às vezes unir forças ajuda a atrair mais investidores.', 13, 4, '2024-10-06 22:00:00'),
	(12, 'Cara, foca em mostrar resultados logo de cara. Investidor de impacto gosta de ver números concretos.', 9, 4, '2024-10-06 22:00:00'),
	(13, 'Rafael, eventos de networking pra startups são ótimos pra conhecer desenvolvedores. Dá uma olhada nesses eventos.', 15, 5, '2024-10-06 22:00:00'),
	(14, 'Tenta buscar comunidades online, tipo Slack de startups. Eu encontrei meu CTO assim.', 8, 5, '2024-10-06 22:00:00'),
	(15, 'Importante encontrar alguém que compartilhe sua visão de longo prazo, não só que tenha habilidades técnicas.', 4, 5, '2024-10-06 22:00:00'),
	(16, 'Patrícia, já tentou oferecer um treinamento novo? Às vezes a galera desanima por falta de desafios novos.', 12, 6, '2024-10-06 22:00:00'),
	(17, 'Acho que uma conversa direta e sincera pode ajudar. Pergunta como ele tá se sentindo no trabalho.', 3, 6, '2024-10-06 22:00:00'),
	(18, 'Tenta estabelecer metas mais claras e realistas, isso pode ajudar a trazer a motivação de volta.', 4, 6, '2024-10-06 22:00:00'),
	(19, 'Felipe, Shopify é uma mão na roda pra quem tá começando. Super fácil e cheio de integrações.', 14, 7, '2024-10-06 22:00:00'),
	(20, 'Já usei o WooCommerce, bom se você já manja de WordPress.', 15, 7, '2024-10-06 22:00:00'),
	(21, 'Dá uma olhada no MercadoShops se você quer algo mais simples e integrado com o Mercado Livre.', 12, 7, '2024-10-06 22:00:00'),
	(22, 'Letícia, começa pelo básico: economizar energia e fazer a gestão dos resíduos. Pequenos passos já ajudam.', 9, 8, '2024-10-06 22:00:00'),
	(23, 'Pensou em procurar fornecedores sustentáveis? Isso também faz uma baita diferença.', 11, 8, '2024-10-06 22:00:00'),
	(24, 'Oferece incentivos pros clientes participarem também, tipo reciclagem de produtos.', 13, 8, '2024-10-06 22:00:00'),
	(25, 'Amanda, ter uma rotina fixa, com pausas e até um pouco de exercício físico, me ajudou muito.', 6, 9, '2024-10-06 22:00:00'),
	(26, 'Tenta separar um espaço só pro trabalho. Isso ajuda demais a manter o foco.', 5, 9, '2024-10-06 22:00:00'),
	(27, 'Já tentou o método Pomodoro? Me ajudou bastante a manter a produtividade durante o dia.', 7, 9, '2024-10-06 22:00:00'),
	(28, 'Ricardo, eu comecei com uma franquia de baixo custo, mas no começo foi bem complicado. Escolhe bem o segmento!', 16, 10, '2024-10-06 22:00:00'),
	(29, 'Depende muito do suporte que o franqueador oferece. Se o suporte for bom, faz toda a diferença.', 9, 10, '2024-10-06 22:00:00'),
	(30, 'Se for algo que escale bem, vale a pena. Dá uma olhada no retorno do investimento (ROI) antes de decidir.', 7, 10, '2024-10-06 22:00:00');

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `profissao` varchar(255) DEFAULT NULL,
  `interesses` text,
  `data_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

REPLACE INTO `usuarios` (`id`, `nome_usuario`, `email`, `senha`, `profissao`, `interesses`, `data_registro`) VALUES
	(1, 'Carlos Souza', 'carlos.souza@example.com', 'senha123', 'Empresário', NULL, '2024-10-06 22:00:00'),
	(2, 'Ana Maria', 'ana.maria@example.com', 'senha123', 'Gestora de Marketing', NULL, '2024-10-06 22:00:00'),
	(3, 'Lucas Mendes', 'lucas.mendes@example.com', 'senha123', 'Desenvolvedor', NULL, '2024-10-06 22:00:00'),
	(4, 'Paula Lima', 'paula.lima@example.com', 'senha123', 'Consultora de TI', NULL, '2024-10-06 22:00:00'),
	(5, 'Mariana Ribeiro', 'mariana.ribeiro@example.com', 'senha123', 'Investidora', NULL, '2024-10-06 22:00:00'),
	(6, 'Pedro Silva', 'pedro.silva@example.com', 'senha123', 'Consultor Financeiro', NULL, '2024-10-06 22:00:00'),
	(7, 'Fernanda Costa', 'fernanda.costa@example.com', 'senha123', 'Analista Financeira', NULL, '2024-10-06 22:00:00'),
	(8, 'Bruno Ferreira', 'bruno.ferreira@example.com', 'senha123', 'Vendedor Digital', NULL, '2024-10-06 22:00:00'),
	(9, 'Camila Azevedo', 'camila.azevedo@example.com', 'senha123', 'Consultora de Marketing', NULL, '2024-10-06 22:00:00'),
	(10, 'Patrícia Carvalho', 'patricia.carvalho@example.com', 'senha123', 'Gerente de RH', NULL, '2024-10-06 22:00:00'),
	(11, 'Letícia Souza', 'leticia.souza@example.com', 'senha123', 'Empreendedora', NULL, '2024-10-06 22:00:00'),
	(12, 'Eduardo Nascimento', 'eduardo.nascimento@example.com', 'senha123', 'Empreendedor Social', NULL, '2024-10-06 22:00:00'),
	(13, 'Felipe Moreira', 'felipe.moreira@example.com', 'senha123', 'Vendedor', NULL, '2024-10-06 22:00:00'),
	(14, 'Gabriela Fonseca', 'gabriela.fonseca@example.com', 'senha123', 'Consultora de E-commerce', NULL, '2024-10-06 22:00:00'),
	(15, 'Ricardo Sampaio', 'ricardo.sampaio@example.com', 'senha123', 'Franqueado', NULL, '2024-10-06 22:00:00'),
	(16, 'Vera Mendes', 'vera.mendes@example.com', 'senha123', 'Franqueada', NULL, '2024-10-06 22:00:00'),
	(17, 'Rafael Almeida', 'rafael.almeida@example.com', 'senha123', 'Empreendedor em Startups', NULL, '2024-10-06 22:00:00');

DELIMITER //
CREATE PROCEDURE `atualizar_perfil_usuario`(
    IN usuario_id INT,
    IN nome_usuario VARCHAR(255),
    IN email VARCHAR(255),
    IN profissao VARCHAR(255),
    IN interesses TEXT
)
BEGIN
    UPDATE usuarios
    SET nome_usuario = nome_usuario,
        email = email,
        profissao = profissao,
        interesses = interesses
    WHERE id = usuario_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `criar_postagem`(
    IN conteudo TEXT,
    IN usuario_id INT,
    IN categoria_id INT
)
BEGIN
    INSERT INTO postagens (conteudo, usuario_id, categoria_id)
    VALUES (conteudo, usuario_id, categoria_id);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `criar_resposta`(
    IN conteudo TEXT,
    IN usuario_id INT,
    IN postagem_id INT
)
BEGIN
    INSERT INTO respostas_postagens (conteudo, usuario_id, postagem_id)
    VALUES (conteudo, usuario_id, postagem_id);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `criar_usuario`(
    IN nome VARCHAR(255),
    IN email VARCHAR(255),
    IN senha VARCHAR(255),
    IN profissao VARCHAR(255),
    IN interesses TEXT
)
BEGIN
    INSERT INTO usuarios (nome_usuario, email, senha, profissao, interesses)
    VALUES (nome, email, senha, profissao, interesses);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `listar_postagens_por_categoria`(
    IN categoria_id INT
)
BEGIN
    SELECT p.id, p.conteudo, p.data_postagem, u.nome_usuario
    FROM postagens p
    JOIN usuarios u ON p.usuario_id = u.id
    WHERE p.categoria_id = categoria_id
    ORDER BY p.data_postagem DESC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `listar_respostas_por_postagem`(
    IN postagem_id INT
)
BEGIN
    SELECT r.id, r.conteudo, r.data_resposta, u.nome_usuario
    FROM respostas_postagens r
    JOIN usuarios u ON r.usuario_id = u.id
    WHERE r.postagem_id = postagem_id
    ORDER BY r.data_resposta ASC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `recuperar_dados_usuario`(
    IN usuario_id INT
)
BEGIN
    SELECT nome_usuario, email, profissao, interesses, data_registro
    FROM usuarios
    WHERE id = usuario_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `ver_categorias`()
BEGIN
    SELECT id, nome, descricao
    FROM categorias
    ORDER BY nome ASC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `ver_postagem`(
	IN `postagem_id` INT
)
BEGIN

SELECT p.*, u.nome_usuario, c.nome AS nome_categoria
FROM postagens p
JOIN usuarios u ON p.usuario_id = u.id
JOIN categorias c ON p.categoria_id = c.id
WHERE p.id = postagem_id;


END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
