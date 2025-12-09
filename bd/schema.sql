CREATE SCHEMA IF NOT EXISTS estudio;

CREATE TABLE estudio.pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE,
    pais_origem VARCHAR(30),
    data_nasc DATE
);

--ESPECIALIZAÇÕES DE PESSOA

CREATE TABLE estudio.empresario(
    id_pessoa INT PRIMARY KEY,
    comissao DECIMAL(10,2),
    CONSTRAINT fk_pessoa_empresario FOREIGN KEY (id_pessoa) REFERENCES estudio.pessoa(id_pessoa)
);

CREATE TABLE estudio.artista(
    id_pessoa INT PRIMARY KEY,
    nome_artistico VARCHAR(100),
    cache DECIMAL(10,2),
    debut DATE,
    id_empresario INT,
    CONSTRAINT fk_pessoa_artista FOREIGN KEY (id_pessoa) REFERENCES estudio.pessoa(id_pessoa),
    CONSTRAINT fk_empresario FOREIGN KEY (id_empresario) REFERENCES estudio.empresario(id_pessoa)
); 

CREATE TABLE estudio.produtor(
    id_pessoa INT PRIMARY KEY,
    area_de_atuacao VARCHAR(100),
    CONSTRAINT fk_pessoa_produtor FOREIGN KEY (id_pessoa) REFERENCES estudio.pessoa(id_pessoa)
);

CREATE TABLE estudio.compositor(
    id_pessoa INT PRIMARY KEY,
    tipo_compositor VARCHAR(100),
    CONSTRAINT fk_pessoa_compositor FOREIGN KEY (id_pessoa) REFERENCES estudio.pessoa(id_pessoa)
);

CREATE TABLE estudio.diretor(
    id_pessoa INT PRIMARY KEY,
    especialidade VARCHAR(100),
    CONSTRAINT fk_pessoa_diretor FOREIGN KEY (id_pessoa) REFERENCES estudio.pessoa(id_pessoa)
);

-- TABELAS INDEPENDENTES 
CREATE TABLE estudio.gravadora (
    id_gravadora SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sede VARCHAR(100),
    CNPJ VARCHAR(20) UNIQUE,
    ano_fundacao INT
);

CREATE TABLE estudio.contrato (
    id_contrato SERIAL PRIMARY KEY,
    id_pessoa INT NOT NULL,
    id_gravadora INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    dt_inicio DATE NOT NULL,
    dt_fim DATE,

    CONSTRAINT fk_gravadora FOREIGN KEY (id_gravadora) REFERENCES estudio.gravadora(id_gravadora),
    CONSTRAINT fk_pessoa FOREIGN KEY (id_pessoa) REFERENCES estudio.pessoa(id_pessoa)
);

CREATE TABLE estudio.turne(
    id_turne SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ano INT NOT NULL
);

CREATE TABLE estudio.premio(
    id_premio SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    organizador VARCHAR(100) NOT NULL
);

CREATE TABLE estudio.concerto(
    id_concerto SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    publico BIGINT,
    cidade VARCHAR(100),
    local VARCHAR(100),
    id_turne INT,
    CONSTRAINT fk_turne FOREIGN KEY (id_turne) REFERENCES estudio.turne(id_turne)
);

CREATE TABLE estudio.album(
    id_album SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    data_lancamento DATE,
    selo VARCHAR(100),
    num_faixas INT
);

CREATE TABLE estudio.genero(
    id_genero SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE estudio.musica(
    id_musica SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao TIME,
    qtd_stream INT DEFAULT 0,
    idioma VARCHAR(30),
    faixa INT NOT NULL,
    id_album INT,
    id_genero INT,  
    CONSTRAINT fk_album FOREIGN KEY (id_album) REFERENCES estudio.album(id_album),
    CONSTRAINT fk_genero FOREIGN KEY (id_genero) REFERENCES estudio.genero(id_genero)
);

CREATE TABLE estudio.plataforma(
    id_plataforma SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    pais_sede VARCHAR(50)
);

CREATE TABLE estudio.videoclipe(
    id_videoclipe SERIAL PRIMARY KEY,
    custo DECIMAL,
    classificacao VARCHAR(10),
    data_lancamento DATE,
    id_musica INT,
    id_diretor INT,
    CONSTRAINT fk_diretor FOREIGN KEY (id_diretor) REFERENCES estudio.diretor(id_pessoa),
    CONSTRAINT fk_musica FOREIGN KEY (id_musica) REFERENCES estudio.musica(id_musica)
);

--TABELAS RELACIONAMENTO

CREATE TABLE estudio.artista_turne(
    id_artista INT,
    id_turne INT,
    PRIMARY KEY (id_artista, id_turne),
    CONSTRAINT fk_artista FOREIGN KEY (id_artista) REFERENCES estudio.artista(id_pessoa),
    CONSTRAINT fk_turne_artista FOREIGN KEY (id_turne) REFERENCES estudio.turne(id_turne)
);

CREATE TABLE estudio.artista_premio(
    id_artista INT,
    id_premio INT,
    premios_total INT,
    PRIMARY KEY (id_artista, id_premio),
    CONSTRAINT fk_artista_premio FOREIGN KEY (id_artista) REFERENCES estudio.artista(id_pessoa),
    CONSTRAINT fk_premio_artista FOREIGN KEY (id_premio) REFERENCES estudio.premio(id_premio)
);

CREATE TABLE estudio.artista_musica(
    id_artista INT,
    id_musica INT,
    PRIMARY KEY (id_artista, id_musica),
    CONSTRAINT fk_artista_musica FOREIGN KEY (id_artista) REFERENCES estudio.artista(id_pessoa),
    CONSTRAINT fk_musica_artista FOREIGN KEY (id_musica) REFERENCES estudio.musica(id_musica)
);

CREATE TABLE estudio.musica_produtor(
    id_musica INT,
    id_produtor INT,
    PRIMARY KEY (id_musica, id_produtor),
    CONSTRAINT fk_musica_compositor FOREIGN KEY (id_musica) REFERENCES estudio.musica(id_musica),
    CONSTRAINT fk_produtor_musica FOREIGN KEY (id_produtor) REFERENCES estudio.produtor(id_pessoa)
);

CREATE TABLE estudio.musica_compositor(
    id_musica INT,
    id_compositor INT,
    percentual_autoria DECIMAL(5,2),
    PRIMARY KEY (id_musica, id_compositor),
    CONSTRAINT fk_musica_compositor FOREIGN KEY (id_musica) REFERENCES estudio.musica(id_musica),
    CONSTRAINT fk_compositor_musica FOREIGN KEY (id_compositor) REFERENCES estudio.compositor(id_pessoa)
);

CREATE TABLE estudio.album_plataforma(
    id_album INT,
    id_plataforma INT,
    PRIMARY KEY (id_album, id_plataforma),
    CONSTRAINT fk_album_plataforma FOREIGN KEY (id_album) REFERENCES estudio.album(id_album),
    CONSTRAINT fk_plataforma_album FOREIGN KEY (id_plataforma) REFERENCES estudio.plataforma(id_plataforma)
);

