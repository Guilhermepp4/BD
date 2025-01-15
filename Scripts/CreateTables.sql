-- Universidade do Minho
-- UC: Base de Dados
-- Projeto: Sistema de Bases de Dados Relacional
-- Tema: Jogos Olímpicos
-- Script de Criação do Sistema Físico de Dados

-- Criação da Base de Dados Jogos Olimpicos
-- DROP DATABASE DBjogosOlimpicos;
CREATE DATABASE DBjogosOlimpicos;

-- Indicação da Base de Dados de trabalho
USE DBjogosOlimpicos;

-- Tabela JogosOlimpicos
-- DESC JogosOlimpicos;
-- DROP TABLE JogosOlimpicos;
CREATE TABLE JogosOlimpicos (
    idJogosOlimpicos INT NOT NULL,
    sede VARCHAR(45) NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    PRIMARY KEY(idJogosOlimpicos)
);

-- Tabela Morada
CREATE TABLE Morada (
    idMorada INT NOT NULL,
    rua VARCHAR(45) NOT NULL,
    nPorta INT NOT NULL,
    localidade VARCHAR(45) NOT NULL,
    codPos VARCHAR(45) NOT NULL,
    PRIMARY KEY(idMorada)
);

-- Tabela Medalha
CREATE TABLE Medalha (
    idMedalha INT NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    PRIMARY KEY(idMedalha)
);

-- Tabela TipoInstalacao
CREATE TABLE TipoInstalacao (
    idTipoInstalacao INT NOT NULL,
    descricao VARCHAR(45) NOT NULL,
    PRIMARY KEY(idTipoInstalacao)
);

-- Tabela TipoFuncionario
CREATE TABLE TipoFuncionario (
    idTipoFuncionario INT NOT NULL,
    descricao VARCHAR(45) NOT NULL,
    PRIMARY KEY(idTipoFuncionario)
);

-- Tabela TipoMembro
CREATE TABLE TipoMembro (
    idTipoMembro INT NOT NULL,
    descricao VARCHAR(45) NOT NULL,
    PRIMARY KEY(idTipoMembro)
);

-- Tabela Instalacao
CREATE TABLE Instalacao (
    idInstalacao INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    capacidade INT NOT NULL,
    idJogosOlimpicos INT NOT NULL,
    idTipoInstalacao INT NOT NULL,
    idMorada INT NOT NULL,
    PRIMARY KEY (idInstalacao),
    FOREIGN KEY (idJogosOlimpicos) REFERENCES JogosOlimpicos(idJogosOlimpicos),
    FOREIGN KEY (idTipoInstalacao) REFERENCES TipoInstalacao(idTipoInstalacao),
    FOREIGN KEY (idMorada) REFERENCES Morada(idMorada)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    idFuncionario INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    genero VARCHAR(45),
    idMorada INT NOT NULL,
    idTipoFuncionario INT NOT NULL,
	PRIMARY KEY(idFuncionario),
    FOREIGN KEY (idTipoFuncionario) REFERENCES TipoFuncionario(idTipoFuncionario),
    FOREIGN KEY (idMorada) REFERENCES Morada(idMorada)
);

-- Tabela InstalacaoFuncionario
CREATE TABLE InstalacaoFuncionario (
    idInstalacao INT NOT NULL,
    idFuncionario INT NOT NULL,
    PRIMARY KEY (idInstalacao, idFuncionario),
    FOREIGN KEY (idInstalacao) REFERENCES Instalacao(idInstalacao),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);

-- Tabela Membro
CREATE TABLE Membro (
    idMembro INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    genero VARCHAR(45) NOT NULL,
    nacionalidade VARCHAR(45) NOT NULL,
    idTipoMembro INT NOT NULL,
    idMorada INT NOT NULL,
    PRIMARY KEY(idMembro),
    FOREIGN KEY (idTipoMembro) REFERENCES TipoMembro(idTipoMembro),
    FOREIGN KEY (idMorada) REFERENCES Morada(idMorada)
);

-- Tabela Equipa
CREATE TABLE Equipa (
    idEquipa INT NOT NULL,
    nacionalidade VARCHAR(45) NOT NULL,
    idMedalha INT,
    PRIMARY KEY(idEquipa),
    FOREIGN KEY (idMedalha) REFERENCES Medalha(idMedalha)
);

-- Tabela MembroEquipa
CREATE TABLE MembroEquipa (
    idEquipa INT NOT NULL,
    idMembro INT NOT NULL,
    PRIMARY KEY (idEquipa, idMembro),
    FOREIGN KEY (idEquipa) REFERENCES Equipa(idEquipa),
    FOREIGN KEY (idMembro) REFERENCES Membro(idMembro)
);

-- Tabela Modalidade
CREATE TABLE Modalidade (
    idModalidade INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    genero VARCHAR(45) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    idJogosOlimpicos INT NOT NULL,
    PRIMARY KEY(idModalidade),
    FOREIGN KEY (idJogosOlimpicos) REFERENCES JogosOlimpicos(idJogosOlimpicos)
);

-- Tabela Prova
CREATE TABLE Prova (
    idProva INT NOT NULL,
    duracao FLOAT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    dataProva DATETIME NOT NULL,
    idInstalacao INT NOT NULL,
    idModalidade INT NOT NULL,
    PRIMARY KEY(idProva),
    FOREIGN KEY (idInstalacao) REFERENCES Instalacao(idInstalacao),
    FOREIGN KEY (idModalidade) REFERENCES Modalidade(idModalidade)
);

-- Tabela ProvaEquipa
CREATE TABLE ProvaEquipa (
    idProva INT,
    idEquipa INT,
    resultado FLOAT NOT NULL,
    PRIMARY KEY (idProva, idEquipa),
    FOREIGN KEY (idProva) REFERENCES Prova(idProva),
    FOREIGN KEY (idEquipa) REFERENCES Equipa(idEquipa)
);

-- Tabela Adepto
CREATE TABLE Adepto (
    bilhete INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    idProva INT NOT NULL,
    PRIMARY KEY(bilhete),
    FOREIGN KEY (idProva) REFERENCES Prova(idProva)
);

-- Tabela Contacto
CREATE TABLE Contacto (
    idContacto INT NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    valor VARCHAR(45) NOT NULL,
    idEquipa INT,
    idJogosOlimpicos INT,
    idFuncionario INT,
    idInstalacao INT,
    PRIMARY KEY(idContacto),
    FOREIGN KEY(idEquipa) REFERENCES equipa(idEquipa),
    FOREIGN KEY (idJogosOlimpicos) REFERENCES JogosOlimpicos(idJogosOlimpicos),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario),
    FOREIGN KEY (idInstalacao) REFERENCES Instalacao(idInstalacao)
);