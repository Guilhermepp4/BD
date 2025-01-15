-- RM17
-- Listar o ranking dos atletas nas provas
-- DROP PROCEDURE rankingProva
DELIMITER //
CREATE PROCEDURE rankingProva(IN id_Prova INT)
BEGIN
    SELECT 
        e.idEquipa AS Equipa,
        p.nome AS Prova,
        pe.resultado,
        CASE 
            -- Exemplo: Para modalidades baseadas em "Tempo", menor resultado vence
            WHEN p.idModalidade IN (1, 2, 7, 8) THEN 
                CASE 
                    WHEN pe.resultado = (SELECT MAX(pe2.resultado)
                                         FROM provaEquipa AS pe2
                                         WHERE pe2.idProva = id_Prova) 
                    THEN 'Vencedor'
                    ELSE 'Vencido'
                END
            ELSE 
                CASE
                    WHEN RANK() OVER (PARTITION BY p.idProva ORDER BY pe.resultado ASC) = 1 THEN 'Primeiro Lugar'
                    WHEN RANK() OVER (PARTITION BY p.idProva ORDER BY pe.resultado ASC) = 2 THEN 'Segundo Lugar'
                    WHEN RANK() OVER (PARTITION BY p.idProva ORDER BY pe.resultado ASC) = 3 THEN 'Terceiro Lugar'
                    ELSE 'Não Medalhista'
                END
        END AS StatusVencedor
	
    FROM Equipa AS e INNER JOIN provaEquipa AS pe 
	ON e.idEquipa = pe.idEquipa
    INNER JOIN Prova AS p 
    ON pe.idProva = p.idProva
    WHERE 
        p.idProva = id_Prova;
END; //
DELIMITER ;
CALL rankingProva(3);

-- RM23
-- Lista melhor resultado Modalidade
-- DROP PROCEDURE RecordeModalidade;
DELIMITER //
CREATE PROCEDURE RecordeModalidade()
BEGIN
    SELECT 
        m.nome AS Modalidade, m.genero,
        CASE
            WHEN m.idModalidade IN (3, 4) THEN
                (SELECT MIN(pe1.resultado) 
                 FROM provaEquipa AS pe1
                 INNER JOIN Prova AS p1 ON p1.idProva = pe1.idProva
                 WHERE p1.idModalidade = m.idModalidade)

            WHEN m.idModalidade IN (1, 2) THEN
                (SELECT MAX(pe1.resultado)
                 FROM provaEquipa AS pe1
                 INNER JOIN Prova AS p1 ON p1.idProva = pe1.idProva
                 WHERE p1.idModalidade = m.idModalidade)

            WHEN m.idModalidade IN (5, 6) THEN
                (SELECT MAX(pe2.resultado)
                 FROM provaEquipa AS pe2
                 INNER JOIN Prova AS p2 ON p2.idProva = pe2.idProva
                 WHERE p2.idModalidade = m.idModalidade)

            ELSE NULL
        END AS Recorde
    FROM Modalidade AS m;
END//
DELIMITER ;
CALL RecordeModalidade();

-- RM25
-- Lista dos atletas com mais medalhas
-- DROP PROCEDURE rankingMedalhas
DELIMITER //
CREATE PROCEDURE rankingMedalhas()
BEGIN
SELECT m.nome, m.nacionalidade, m.genero, COUNT(e.idMedalha) as Total_Medalhas
	FROM membro AS m INNER JOIN membroEquipa AS me 
    ON m.idMembro = me.idMembro
	INNER JOIN equipa AS e 
    ON e.idEquipa = me.idEquipa
	WHERE m.idTipoMembro = 1
	GROUP BY m.idMembro
	ORDER BY COUNT(e.idMedalha) DESC;
END;
//
DELIMITER ;
CALL rankingMedalhas();

-- RM28
-- Listar as Provas de um atleta Realizadas e por realizar
-- DROP PROCEDURE provasAtleta;
DELIMITER //
CREATE PROCEDURE provasAtleta(IN id_atleta INT)
BEGIN
    SELECT m.nome, p.nome AS Prova,
        CASE
            WHEN p.dataProva < NOW() THEN 'Realizada'
            ELSE 'Por Realizar'
        END AS statusProva
    FROM membro AS m 
    INNER JOIN membroEquipa AS me ON m.idMembro = me.idMembro
    INNER JOIN Equipa AS e ON e.idEquipa = me.idEquipa
    INNER JOIN provaEquipa AS pe ON pe.idEquipa = e.idEquipa
    INNER JOIN prova AS p ON pe.idProva = p.idProva
    WHERE m.idMembro = id_atleta AND m.idtipoMembro = 1
    ORDER BY m.nome;
END;
//
DELIMITER ;
CALL provasAtleta(3);

-- RM29
-- Listar as Provas Realizadas e por Realizar
-- DROP PROCEDURE ProvasRealizadas_PorRealizar;
DELIMITER //
CREATE PROCEDURE ProvasRealizadas_PorRealizar()
BEGIN
SELECT 
    m.nome AS nomeModalidade, p.nome as Prova, m.genero,
    CASE 
        WHEN p.dataProva < NOW() THEN 'Realizada'
        ELSE 'Por Realizar'
    END AS statusProva
FROM modalidade AS m INNER JOIN prova AS p
    ON m.idModalidade = p.idModalidade
ORDER BY nomeModalidade;
END ;
//
DELIMITER ;
CALL ProvasRealizadas_PorRealizar();

-- RM30
-- Listar as Provas de uma nacionalidade Realizadas e por 
-- DROP PROCEDURE Provas_Realizadas_PorRealizar_N;
DELIMITER //
CREATE PROCEDURE Provas_Realizadas_PorRealizar_N(IN nacionalidade_ VARCHAR(45))
BEGIN
    SELECT e.nacionalidade, p.nome,
        CASE
            WHEN p.dataProva < NOW() THEN 'Realizada'
            ELSE 'Por Realizar'
        END AS statusProva
    FROM Equipa AS e 
    INNER JOIN provaEquipa AS pe ON e.idEquipa = pe.idEquipa
    INNER JOIN prova AS p ON p.idProva = pe.idProva
    WHERE e.nacionalidade = nacionalidade_;
END //
DELIMITER ;
CALL Provas_Realizadas_PorRealizar_N('Portugal');

-- RM35
-- Lista de altetlas por nacionalidade
-- DROP PROCEDURE listaAtletas;
DELIMITER //
CREATE PROCEDURE listaAtletas()
BEGIN
SELECT m.nacionalidade, count(m.idMembro) AS TOTAL
	FROM Membro as m
    GROUP BY m.nacionalidade
    ORDER BY count(m.idMembro) DESC;
END //
DELIMITER ;
CALL listaAtletas();

-- RM40
-- Lista da quantidade de medalhas de uma nacionalidade
-- DROP PROCEDURE total_Medalhas_N;
DELIMITER //
CREATE PROCEDURE total_Medalhas_N(IN nacionalidade_ varchar(45))
BEGIN
SELECT e.nacionalidade, count(e.idMedalha) as Medalhas
	FROM Equipa as e
	WHERE nacionalidade_ = e.nacionalidade
    GROUP BY e.nacionalidade
    ORDER BY Medalhas DESC;
END//
DELIMITER ;
CALL total_Medalhas_N('Brasil');

-- Informações Básicas

-- A capacidade de toda as Instalações
-- DROP PROCEDURE instalacoes
DELIMITER //
CREATE PROCEDURE instalacoes()
BEGIN
SELECT nome, capacidade
FROM Instalacao;
END //
DELIMITER ;
CALL instalacoes();

-- Nome e nacionalidade de todos os atletas
-- DROP PROCEDURE atletas
DELIMITER //
CREATE PROCEDURE atletas()
BEGIN
SELECT m.nome, m.nacionalidade, tm.descricao
FROM Membro AS m INNER JOIN TipoMembro AS tm
ON m.idTipoMembro = tm.idTipoMembro
WHERE tm.idTipoMembro = 1
ORDER BY nacionalidade ASC;
END //
DELIMITER ;
CALL atletas();

-- Listar quantos adeptos tinha cada prova
-- DROP PROCEDURE adeptosProva;
DELIMITER //
CREATE PROCEDURE adeptosProva()
BEGIN
SELECT p.nome, count(a.bilhete) AS Total_Adeptos
	FROM Prova AS p INNER JOIN Adepto AS a
    ON p.idProva = a.idProva
    GROUP BY p.nome
    ORDER BY count(a.bilhete) DESC;
END //
DELIMITER ;
CALL adeptosProva();
    
-- Remover Membro
-- DROP PROCEDURE removeMembro
DELIMITER //
CREATE PROCEDURE removeMembro(IN id_atleta INT)
BEGIN
    DECLARE atleta_nome VARCHAR(45);

    SELECT nome INTO atleta_nome 
    FROM Membro 
    WHERE idMembro = id_atleta;

    IF atleta_nome IS NOT NULL THEN
		DELETE FROM membroEquipa WHERE idMembro = id_atleta;
        DELETE FROM Membro WHERE idMembro = id_atleta;
        SELECT CONCAT('O atleta ', atleta_nome, ' foi removido com sucesso.') AS mensagem;
    ELSE
        SELECT CONCAT('Atleta com o ID', id_atleta, ' não encontrado :(') AS mensagem;
    END IF;
END //
DELIMITER ;
CALL removeMembro(50);

-- Adicionar Membro
-- DROP PROCEDURE adicionaMembro
DELIMITER //
CREATE PROCEDURE adicionaMembro(
    IN id_membro INT, IN nome_ VARCHAR(45), IN idade_ INT, 
    IN genero_ VARCHAR(45), IN nacionalidade_ VARCHAR(45), 
    IN id_Tipo_Membro INT, IN id_Morada INT
)
BEGIN
    -- Verifica se o membro já existe
    IF EXISTS (SELECT 1 FROM Membro WHERE idMembro = id_membro) THEN
        SELECT CONCAT('O atleta ', nome_, ' já está na base de dados') AS mensagem;
    ELSE
        INSERT INTO Membro (idMembro, nome, idade, genero, nacionalidade, idTipoMembro, idMorada)
        VALUES (id_membro, nome_, idade_, genero_, nacionalidade_, id_Tipo_Membro, id_Morada);
        SELECT CONCAT('O atleta ', nome_, ' foi adicionado com sucesso com o ID ', id_membro) AS mensagem;
    END IF;
END //
DELIMITER ;
CALL adicionaMembro(50, 'raul', 34, 'Feminino', 'marroquina', 1, 11);

-- Adicionar instalacao 
-- DROP PROCEDURE adicionaInstalacao
DELIMITER //
CREATE PROCEDURE adicionaInstalacao(IN id_Instalacao INT,IN nome_ VARCHAR(45),IN capacidade_ INT,
    IN id_Jogos_Olimpicos INT,IN id_Tipo_Instalacao INT,IN id_Morada INT)
BEGIN
    -- Verifica se a instalação já existe
    IF EXISTS (SELECT 1 FROM Instalacao WHERE idInstalacao = id_Instalacao) THEN
        SELECT CONCAT('A instalação com o ID ', id_Instalacao, ' já existe') AS mensagem;
    ELSE
        -- Insere a nova instalação na tabela Instalacao
        INSERT INTO Instalacao (idInstalacao, nome, capacidade, idJogosOlimpicos, idTipoInstalacao, idMorada)
        VALUES (id_Instalacao, nome_, capacidade_, id_Jogos_Olimpicos, id_Tipo_Instalacao, id_Morada);

        -- Mensagem de sucesso
        SELECT CONCAT('A instalação ', nome_, ' foi adicionada com sucesso com o ID ', id_Instalacao) AS mensagem;
    END IF;
END //
DELIMITER ;
CALL adicionaInstalacao(34, 'Complexo Desportivo de Barroselas', 30000, 1, 2, 1);


-- Remove instalacao 
-- DROP PROCEDURE removeInstalacao
DELIMITER //
CREATE PROCEDURE removeInstalacao(IN id_Instalacao INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Instalacao WHERE idInstalacao = id_Instalacao) THEN
        DELETE FROM Instalacao WHERE idInstalacao = id_Instalacao;
        SELECT CONCAT('A instalação com o ID ', id_Instalacao, ' foi removida com sucesso') AS mensagem;
    ELSE
        SELECT CONCAT('Não existe nenhuma instalação com o ID ', id_Instalacao) AS mensagem;
    END IF;
END //
DELIMITER ;
CALL removeInstalacao(34);

-- Aletar Prova
-- DROP PROCEDURE alterarProva
DELIMITER //
CREATE PROCEDURE alterarProva(IN idProva_ INT, IN dataProva_ DATETIME, IN idInstalacao_ INT)
BEGIN
	IF EXISTS(SELECT 1 FROM Prova WHERE idProva = idProva_) THEN
		UPDATE Prova
		SET dataProva = dataProva_
			WHERE idProva = idProva_;
		UPDATE Prova
		SET idInstalacao = idInstalacao_
			WHERE idProva = idProva_;
		SELECT CONCAT('A Prova com o ID ', idProva_,' foi alterada com sucesso') AS mensagem;
	ELSE
		SELECT CONCAT('A Prova com o ID ', idProva_,' não está presente na Base de Dados') AS mensagem;
	END IF;
END //
DELIMITER ;
CALL alterarProva(1, '2027-12-03 12:30:00', 2)

-- Mudar Funcionarios ou Membros de Alojamentos
-- DROP PROCEDURE mudarFuncionariosMembros
DELIMITER //
CREATE PROCEDURE mudarFuncionariosMembros(IN id_pessoa INT, IN id_Instalacao INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Funcionario WHERE idFuncionario = id_pessoa) THEN
        UPDATE Funcionario
        SET idMorada = id_Instalacao
        WHERE idFuncionario = id_pessoa;

        SELECT CONCAT('O funcionário com o ID ', id_pessoa, ' será alojado na Instalação ', id_Instalacao) AS mensagem;

    ELSEIF EXISTS (SELECT 1 FROM Membro WHERE idMembro = id_pessoa) THEN
        UPDATE Membro
        SET idMorada = id_Instalacao
        WHERE idMembro = id_pessoa;

        SELECT CONCAT('O membro com o ID ', id_pessoa, ' será alojado na Instalação ', id_Instalacao) AS mensagem;

    ELSE
        SELECT CONCAT('O ID ', id_pessoa, ' ou a instalação ', id_Instalacao, ' não pertencem à base de dados') AS mensagem;
    END IF;
END //
DELIMITER ;
CALL mudarFuncionariosMembros(1000,10);

-- Consultar Alojamento
-- DROP PROCEDURE MembrosAlojamento;
DELIMITER //
CREATE PROCEDURE MembrosAlojamento(IN idMembro_ INT)
BEGIN
SELECT m.nome, tm.descricao, i.nome AS Nome_Instalacao
	FROM Membro AS m INNER JOIN tipoMembro AS tm
    ON m.idTipoMembro = tm.idTipoMembro
    INNER JOIN Instalacao AS i
    ON m.idMorada = i.idMorada
    WHERE m.idMembro = idMembro_;
END //
DELIMITER ;
CALL MembrosAlojamento(1);

-- Adicionar uma Equipa a um Prova
-- DROP PROCEDURE adicionaProvaEquipa;
DELIMITER //
CREATE PROCEDURE adicionaProvaEquipa(IN id_Prova INT, IN id_Equipa INT, IN resultado_ FLOAT)
BEGIN
    -- Verificar se a equipa já está na prova
    IF EXISTS (SELECT 1 FROM provaEquipa AS pe WHERE pe.idProva = id_Prova AND pe.idEquipa = id_Equipa) THEN
        SELECT CONCAT("A equipa com o ID ", id_Equipa, " já se encontra na prova ", id_Prova) AS mensagem;
    ELSE
        INSERT INTO provaEquipa (idProva, idEquipa, resultado)
        VALUES (id_Prova, id_Equipa, resultado_);
        SELECT CONCAT("A equipa com o ID ", id_Equipa, " foi adicionada com sucesso à prova ", id_Prova) AS mensagem;
    END IF;
END //
DELIMITER ;
CALL adicionaProvaEquipa(2,1,12);

-- Remover Equipa de uma Prova
-- DROP PROCEDURE removeProvaEquipa;
DELIMITER //
CREATE PROCEDURE removeProvaEquipa(IN id_Prova INT, IN id_Equipa INT)
BEGIN
    -- Verificar se a equipa já está na prova
    IF EXISTS (SELECT 1 FROM provaEquipa AS pe WHERE pe.idProva = id_Prova AND pe.idEquipa = id_Equipa) THEN
        DELETE FROM provaEquipa
        WHERE id_Equipa = idEquipa AND id_Prova = idProva;
        SELECT CONCAT("A equipa com o ID ", id_Equipa, " foi removida com sucesso da prova ", id_Prova) AS mensagem;
    ELSE
        SELECT CONCAT("A equipa com o ID ", id_Equipa, " não se encontra na prova ", id_Prova) AS mensagem;
    END IF;
END //
DELIMITER ;
CALL removeProvaEquipa(2,1);

-- Criação das Vistas

-- Vista Adepto
-- DROP VIEW vistaAdepto
CREATE VIEW vistaAdepto AS
SELECT a.nome AS Nome_Adepto, a.bilhete AS Bilhete, p.nome AS Prova
	FROM Adepto AS a INNER JOIN Prova AS p
	ON a.idProva = p.idProva
	ORDER BY Nome_Adepto;

-- Vista Funcionário
-- DROP VIEW vistaFuncionário
CREATE VIEW vistaFuncionario AS
SELECT f.nome, f.genero, tf.descricao AS cargo, i.nome AS Local_Trabalho, c.valor AS Contacto_Instalacao
	FROM tipoFuncionario AS tf INNER JOIN Funcionario AS f
    ON tf.idTipoFuncionario = f.idTipoFuncionario
    INNER JOIN instalacaoFuncionario AS ifu
    ON f.idFuncionario = ifu.idFuncionario
    INNER JOIN Instalacao AS i
    ON i.idInstalacao = ifu.idInstalacao
    INNER JOIN Contacto AS c
    ON i.idInstalacao = c.idInstalacao
	ORDER BY f.nome;

-- Vista Membro Alojamento
-- DROP VIEW Alojamneto
CREATE VIEW Alojamentos AS
SELECT m.nome, tm.descricao, i.nome AS Nome_Instalacao
	FROM Membro AS m INNER JOIN tipoMembro AS tm
    ON m.idTipoMembro = tm.idTipoMembro
    INNER JOIN Instalacao AS i
    ON m.idMorada = i.idMorada;