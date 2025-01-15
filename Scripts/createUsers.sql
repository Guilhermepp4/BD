-- Criação do utilizador Jogos olimpicos
-- DROP USER 'ceoolympicgames'@'localhost';
CREATE USER 'ceoolympicgames'@'localhost';
SET PASSWORD FOR 'ceoolympicgames'@'localhost' = 'DonoDistoTudo90';

-- Criação do utilizador Administrador de Backup
-- DROP USER 'backupadmin'@'localhost';
CREATE USER 'backupadmin'@'localhost';
SET PASSWORD FOR 'backupadmin'@'localhost' = 'BackupSecure90';

-- Criação do utilizador de Testes
-- DROP USER 'testuser'@'localhost';
CREATE USER 'testuser'@'localhost';
SET PASSWORD FOR 'testuser'@'localhost' = 'Test12345';

-- Criação do utilizador para a Equipa de Programação
-- DROP USER 'equipa_programacao'@'localhost';
CREATE USER 'equipa_programacao'@'localhost';
SET PASSWORD FOR 'equipa_programacao'@'localhost' = 'ProgTeam2023';

-- Criação do utilizador para a Equipa de Marketing
-- DROP USER 'equipa_marketing'@'localhost';
CREATE USER 'equipa_marketing'@'localhost';
SET PASSWORD FOR 'equipa_marketing'@'localhost' = 'MktTeam2023';

-- Criação do utilizador Utilizador Comum
-- DROP USER 'utilizadorcomum'@'localhost';
CREATE USER 'utilizadorcomum'@'localhost';
SET PASSWORD FOR 'utilizadorcomum'@'localhost' = 'User12345';

FLUSH PRIVILEGES;
-- -----------------------------------------------------
-- Permissões
-- -----------------------------------------------------

-- Adicionar todas as premissões a todos os utilizadores
GRANT ALL ON DBjogosOlimpicos.* TO 'ceoolympicgames'@'localhost';

GRANT SELECT, INSERT, UPDATE ON DBJogosOlimpicos.* TO 'backupadmin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON DBJogosOlimpicos.* TO 'testuser'@'localhost';
GRANT SELECT, INSERT, UPDATE ON DBJogosOlimpicos.* TO 'equipa_programacao'@'localhost';
GRANT SELECT, INSERT, UPDATE ON DBJogosOlimpicos.* TO 'equipa_marketing'@'localhost';
GRANT SELECT, INSERT, UPDATE ON DBJogosOlimpicos.* TO 'utilizadorcomum'@'localhost';

-- Adicionar Permissões PROCEDURES
GRANT EXECUTE ON PROCEDURE adeptosProva TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE adicionaMembro TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE adicionaInstalacao TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE removeMembro TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE mudarFuncionariosMembros TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE alterarProva TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE removeInstalacao TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE adicionaInstalacao TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE provasAtleta TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE removeProvaEquipa TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE adicionaProvaEquipa TO 'ceoolympicgames'@'localhost';




GRANT EXECUTE ON PROCEDURE rankingMedalhas TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingMedalhas TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingMedalhas TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingMedalhas TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingMedalhas TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingMedalhas TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE rankingProva TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingProva TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingProva TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingProva TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingProva TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE rankingProva TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE total_Medalhas_N TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE total_Medalhas_N TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE total_Medalhas_N TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE total_Medalhas_N TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE total_Medalhas_N TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE total_Medalhas_N TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE Provas_Realizadas_PorRealizar_N TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE Provas_Realizadas_PorRealizar_N TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE Provas_Realizadas_PorRealizar_N TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE Provas_Realizadas_PorRealizar_N TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE Provas_Realizadas_PorRealizar_N TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE Provas_Realizadas_PorRealizar_N TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE ProvasRealizadas_PorRealizar TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE ProvasRealizadas_PorRealizar TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE ProvasRealizadas_PorRealizar TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE ProvasRealizadas_PorRealizar TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE ProvasRealizadas_PorRealizar TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE ProvasRealizadas_PorRealizar TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE listaatletas TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE listaatletas TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE listaatletas TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE listaatletas TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE listaatletas TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE listaatletas TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE atletas TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE atletas TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE atletas TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE atletas TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE atletas TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE atletas TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE instalacoes TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE instalacoes TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE instalacoes TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE instalacoes TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE instalacoes TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE RecordeModalidade TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE RecordeModalidade TO 'equipa_programacao'@'localhost';
GRANT EXECUTE ON PROCEDURE RecordeModalidade TO 'equipa_marketing'@'localhost';
GRANT EXECUTE ON PROCEDURE RecordeModalidade TO 'testuser'@'localhost';
GRANT EXECUTE ON PROCEDURE RecordeModalidade TO 'backupadmin'@'localhost';
GRANT EXECUTE ON PROCEDURE RecordeModalidade TO 'utilizadorcomum'@'localhost';

GRANT EXECUTE ON PROCEDURE MembrosAlojamento TO 'ceoolympicgames'@'localhost';
GRANT EXECUTE ON PROCEDURE MembrosAlojamento TO 'utilizadorcomum'@'localhost';

REVOKE UPDATE, INSERT ON DBJogosOlimpicos FROM 'equipa_marketing'@'localhost';



