-- -------------------------------- --
-- Base de dados do site Gatolândia --
-- -------------------------------- --

-- Apaga o banco de dados caso ele exista
-- ALERTA!!! REMOVA ESTA LINHA APÓS O BANCO ESTAR PRONTO
DROP DATABASE IF EXISTS gatolandia;

-- Cria a base de dados
CREATE DATABASE gatolandia CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE gatolandia;

-- Cria a tabela contatos
CREATE TABLE contatos (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    nome VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL,
    assunto VARCHAR(255) NOT NULL,
    mensagem TEXT NOT NULL,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('recebido', 'lido', 'respondido', 'apagado') DEFAULT 'recebido'
);

--  Cria a tabela autores
CREATE TABLE autores (
    id_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    apelido VARCHAR(127) NOT NULL COMMENT 'Nome que aparece no artigo.',
    foto VARCHAR(255) COMMENT 'URL da foto',
    resumo TEXT COMMENT 'Um mini currículo',
    email VARCHAR(127) NOT NULL,
    senha VARCHAR(63) NOT NULL COMMENT 'Senha de acesso ao dashboard.',
    nascimento DATE,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    campo3 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('inativo', 'ativo') DEFAULT 'ativo'
);

-- Inserção de dados na tabela 'autores'
INSERT INTO autores (
    nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUES (
    'Fulano da Silva', 'Fulano',
    'https://picsum.photos/201/300', 'Escritor em horas vagas.',
    'fulano@silva.com', '12345',
    '1989-10-12'
);
INSERT INTO autores (
    nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUES (
    'Teresinha de Jesus', 'Tere',
    'https://picsum.photos/200/301', 'Escritora e do lar ',
    'tere@jesus.com', '001122',
    '1987-05-21'
);
INSERT INTO autores (
    nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUES (
    'Afonso Torres Barbosa', 'Afonso',
    'https://picsum.photos/199/300', 'Pai de bichos.',
    'afonso.t@yahoo.com', 'amomeusgatos',
    '1993-09-30'
);
INSERT INTO autores (
    nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUES (
    'Cleide Maria dos Santos', 'Cleidinha',
    'https://picsum.photos/199/299', 'blogueira e dona de pet shop.',
    'joca@silva.com', '12345',
    '1981-02-09'
);

-- Cria a tabela categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(127) NOT NULL
);

-- Inserção de dados na tabela 'categorias'
INSERT INTO categorias (nome) VALUES ('Raças');
INSERT INTO categorias (nome) VALUES ('Pelagem');
INSERT INTO categorias (nome) VALUES ('Alimentação');
INSERT INTO categorias (nome) VALUES ('acessórios');
INSERT INTO categorias (nome) VALUES ('Saúde');
INSERT INTO categorias (nome) VALUES ('Cuidados');
INSERT INTO categorias (nome) VALUES ('Filhotes');

-- Cria a tabela artigos
CREATE TABLE artigos (
    id_artigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    titulo VARCHAR(255) NOT NULL,
    imagem VARCHAR(255) COMMENT 'URL da imagem - thumbnail',
    resumo VARCHAR(255) NOT NULL COMMENT 'Resumo do artigo',
    texto LONGTEXT NOT NULL COMMENT 'Texto (HTML) do artigo completo',
    autor_id INT NOT NULL,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    campo3 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('inativo', 'ativo') DEFAULT 'ativo',

    -- Chave estrangeira do autor
    FOREIGN KEY (autor_id) REFERENCES autores (id_autor)
);

-- Inserção de dados na tabela 'artigos'
INSERT INTO artigos (
    titulo, imagem,
    resumo, texto,
    autor_id
) VALUES (
    'Amor aos felinos', 'https://picsum.photos/200',
    'Como essas criaturas nos enche de amor.', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eos, vel explicabo repudiandae libero, suscipit velit, reprehenderit ratione fuga totam tenetur asperiores necessitatibus odio iure consectetur mollitia nesciunt dignissimos aliquam impedit.',
    '1'
);
INSERT INTO artigos (
    titulo, imagem,
    resumo, texto,
    autor_id
) VALUES (
    'Filhos e gatos - atenção dobrada!', 'https://picsum.photos/199',
    'Encarando o dia-a-dia com filhos e gatos.', 'Fusce interdum eleifend orci eu rhoncus. Vivamus id lobortis ligula. Praesent eleifend sapien vitae eros hendrerit maximus. Pellentesque enim est, egestas vitae ultrices in, cursus ac eros. Etiam nibh tellus, facilisis in libero in, venenatis lobortis sem. Duis urna nunc, posuere et congue vitae, porta ut odio. Ut eleifend, justo hendrerit tempus eleifend, turpis ipsum ornare massa, quis sagittis neque lorem vitae justo. Nunc pulvinar imperdiet vestibulum. Donec id nunc turpis. Fusce auctor, nunc in feugiat bibendum, lacus enim porttitor dolor, vitae congue libero felis eget magna. Aliquam semper ut lorem mollis elementum. Cras feugiat, odio quis tincidunt fringilla, nisl urna egestas diam, quis auctor mauris eros a metus.

Donec non justo aliquam dolor tempus tempor. Mauris a sem sit amet libero tincidunt euismod nec id felis. Maecenas at ante lorem. Vestibulum quis tortor tellus. Duis volutpat egestas justo, at cursus mauris aliquam id. Aliquam erat volutpat. Morbi vulputate maximus mauris facilisis tincidunt..',
    '2'
);
INSERT INTO artigos (
    titulo, imagem,
    resumo, texto,
    autor_id
) VALUES (
    'Ser pai é difícil?', 'https://picsum.photos/201',
    'O cotidiano de Pai de bichos.', 'Sed mattis nibh at venenatis convallis. Quisque semper, eros sed imperdiet pellentesque, nulla odio viverra ante, et porta arcu tortor ac dolor. Suspendisse neque est, consequat non mollis sit amet, ultrices sed sapien. Duis accumsan ex vitae quam hendrerit, ac aliquet orci interdum. Morbi in mollis arcu. Vivamus rutrum blandit mi et faucibus. Nullam dolor neque, consectetur auctor ullamcorper id, pretium non lorem. In iaculis mattis justo. Nam accumsan dolor facilisis ligula feugiat, nec porttitor nibh varius. Maecenas gravida efficitur diam vel iaculis. Vivamus mollis semper erat, nec mattis nunc auctor eu. Sed a odio consectetur, dapibus dolor quis, viverra nibh.',
    '3'
);
INSERT INTO artigos (
    titulo, imagem,
    resumo, texto,
    autor_id
) VALUES (
    'Atenção à vacinação dos felinos', 'https://picsum.photos/198',
    'A importância da vacinação.', 'Nam varius bibendum tempor. Vivamus dapibus a tortor et placerat. Suspendisse elementum porttitor enim, pharetra pretium tellus ultricies auctor. Sed varius tempor quam viverra aliquet. Nunc at sem fermentum, euismod tellus id, hendrerit lacus. Vivamus arcu dui, scelerisque sed augue non, viverra auctor nisl. Vestibulum molestie velit eu eros vehicula ornare. Pellentesque quis elementum libero, sit amet molestie sapien. Duis vitae diam risus. Vestibulum varius pulvinar arcu, vel mollis lacus euismod sed.',
    '4'
);
INSERT INTO artigos (
    titulo, imagem,
    resumo, texto,
    autor_id
) VALUES (
    'A alimentação balanceada', 'https://picsum.photos/202',
    'Os cuidados da alimentação para os felinos.', 'Duis interdum ipsum vel justo venenatis egestas. Cras luctus mauris est, ac placerat risus semper at. Nulla ac odio metus. Fusce ut erat vel ipsum condimentum commodo. Sed dignissim diam sed dictum venenatis. In id libero convallis, pulvinar dolor vitae, dictum lacus. Quisque vestibulum erat non tellus tempus, scelerisque aliquam elit mattis. In sagittis mollis iaculis. Cras ac pharetra lectus, et tempor est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent feugiat erat id metus dictum, eget tincidunt justo aliquet. Etiam a ligula varius, tristique mi non, euismod dui. Sed cursus vehicula posuere. Morbi vel nisi auctor, eleifend lacus at, lacinia sapien. Pellentesque felis dui, vestibulum in dignissim quis, efficitur sit amet sem.',
    '3'
);

-- Cria a tabela de ligação 'artigos' <-> 'categorias'
CREATE TABLE art_cat (
    id_art_cat INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artigo_id INT NOT NULL,
    categoria_id INT NOT NULL,

    -- Chave estrangeira dos artigos
    FOREIGN KEY (artigo_id) REFERENCES artigos (id_artigo),

    -- Chave estrangeira das categorias
    FOREIGN KEY (categoria_id) REFERENCES categorias (id_categoria)    
);

-- Insere dados na tabela 'art_cat'
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (1, 1); -- Artigo 1 na categoria 1
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (2, 6); -- Artigo 1 na categoria 2
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (3, 6); -- Artigo 1 na categoria 1
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (5, 5); -- Artigo 1 na categoria 2
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (4, 5); -- Artigo 1 na categoria 1
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (5, 3); -- Artigo 1 na categoria 2
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (1, 7); -- Artigo 1 na categoria 2
INSERT INTO art_cat (artigo_id, categoria_id) VALUES (4, 7); -- Artigo 1 na categoria 2

