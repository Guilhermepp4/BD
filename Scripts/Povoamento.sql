-- Universidade do Minho
-- UC: Base de Dados
-- Projeto: Sistema de Bases de Dados Relacional
-- Tema: Jogos Olímpicos
-- Script de Povoamento Inicial

-- DROP DATABASE DBJogosOlimpicos;
-- USE DBjogosOlimpicos;

INSERT INTO JogosOlimpicos (idJogosOlimpicos, sede, dataInicio, dataFim) 
	VALUES
	(1, 'Paris', '2032-07-23', '2032-08-08');
    
INSERT INTO Morada (idMorada, rua, nPorta, localidade, codPos) 
	VALUES
	(1, 'Rua das Flores', 10, 'Lisboa', '1200-123'), 
	(2, 'Avenida Central', 200, 'Porto', '4000-456'), 
	(3, 'Travessa da Esperança', 15, 'Coimbra', '3000-789'), 
	(4, 'Rua do Sol', 45, 'Faro', '8000-111'),  
	(5, 'Estrada Nova', 8, 'Braga', '4700-222'), 
	(6, 'Praça da Liberdade', 2, 'Aveiro', '3800-333'), 
	(7, 'Rua do Comércio', 32, 'Viseu', '3500-444'), 
	(8, 'Avenida dos Pioneiros', 120, 'Guarda', '6300-555'), 
	(9, 'Rua do Horizonte', 76, 'Évora', '7000-666'), 
	(10, 'Largo dos Navegantes', 5, 'Viana do Castelo', '2900-777'), 
	(11, 'Rua da Harmonia', 90, 'Leiria', '2400-888'), 
	(12, 'Avenida da Paz', 50, 'Beja', '7800-999'), 
	(13, 'Rua do Mar', 3, 'Funchal', '9000-000'),
    (14, 'Rua das Amoreiras', 25, 'Sintra', '2710-233'),
	(15, 'Largo da República', 12, 'Cascais', '2750-345'),
	(16, 'Estrada das Oliveiras', 89, 'Guimarães', '4800-456'),
	(17, 'Rua do Campo', 7, 'Tomar', '2300-789'),
	(18, 'Avenida da Liberdade', 100, 'Almada', '2800-123'),
	(19, 'Rua do Farol', 45, 'Peniche', '2520-456'),
	(20, 'Travessa das Laranjeiras', 33, 'Lagos', '8600-789');
    
INSERT INTO Medalha (idMedalha, tipo)
	VALUES
    (1, 'Gold'),
    (2, 'Silver'),
    (3, 'Bronze');

INSERT INTO TipoInstalacao (idTipoInstalacao, descricao) 
	VALUES
	(1, 'Residencial'),
	(2, 'Complexo desportivo');
    
INSERT INTO TipoFuncionario (idTipoFuncionario, descricao) 
	VALUES
	(1, 'Cozinheiro'),
	(2, 'Auxiliar'),
	(3, 'Segurança'),
	(4, 'Júris'),
	(5, 'Árbitro'),
	(6, 'Supervisor');
    
INSERT INTO TipoMembro (idTipoMembro, descricao)
	VALUES
    (1, 'Atleta'),
    (2, 'Treinador');

INSERT INTO Instalacao (idInstalacao, nome, capacidade, idJogosOlimpicos, idTipoInstalacao, idMorada) 
	VALUES
	(1, 'Estádio Olímpico de Brisbane', 68000, 1, 2, 1),
	(2, 'Centro Aquático de Brisbane', 15000, 1, 2, 2), 
	(3, 'National Indoor Stadium', 18000, 1, 2, 3),
	(4, 'Estádio de Roland Garros', 20000, 1, 2, 4),
	(5, 'Centro Aquático de Brisbane', 12000, 1, 2, 7),
    (6, 'Residência Olimpica do Alentejo', 1200, 1, 1, 9),
    (7, 'Residência Olímpica do Alentejo2', 1200, 1, 1, 10),
    (8, 'Residência Olímpica de Viana do Castelo', 2500, 1, 1, 11);
    
INSERT INTO Funcionario (idFuncionario, nome, genero, idMorada, idTipoFuncionario) 
	VALUES
	(1, 'João Silva', 'Masculino', 6, 1),
	(2, 'Maria Oliveira', 'Feminino', 12, 2),
	(3, 'Carlos Santos', 'Masculino', 13, 5),
	(4, 'Ana Costa', 'Feminino', 14, 2),
	(5, 'Pedro Almeida', 'Masculino', 15, 6),
	(6, 'Sofia Martins', 'Feminino', 16, 1), 
	(7, 'Luís Ferreira', 'Masculino', 17, 3),
	(8, 'Clara Ribeiro', 'Feminino', 18, 5),
	(9, 'Miguel Lopes', 'Masculino', 19, 4), 
	(10, 'Raquel Nogueira', 'Feminino', 20, 1),
    (11, 'Zéca', NULL , 5, 5);

INSERT INTO InstalacaoFuncionario (idInstalacao, idFuncionario)
	VALUES
	(5, 1), 
	(1, 2), 
	(2, 3), 
	(3, 4), 
	(4, 5), 
	(4, 6), 
	(7, 7), 
	(6, 8), 
	(8, 9),
	(6, 10),
	(6, 1),
	(8, 2), 
	(7, 3),
	(7, 11);
    
    
INSERT INTO Membro (idMembro, nome, idade, genero, nacionalidade, idTipoMembro, idMorada)
	VALUES
    (1, "Diana Taurasi", 42, "Feminino", "Estados Unidos", 1, 11), -- Fem Basket USA
    (2, "Breanna Stewart", 29, "Feminino", "Estados Unidos", 1, 11),
    (3, "A'ja Wilson", 28, "Feminino", "Estados Unidos", 1, 11),
    (4, "Brittney Griner", 33, "Feminino", "Estados Unidos", 1, 11),
    (5, "Chelsea Gray", 32, "Feminino", "Estados Unidos", 1, 11),
    (6, "Cheryl Reeve", 58, "Feminino", "Estados Unidos", 2, 11),
    (7, "Stephen Curry", 36, "Masculino", "Estados Unidos", 1, 11),	-- Masc Basket USA
    (8, "Jrue Holiday", 34, "Masculino", "Estados Unidos", 1, 11),
    (9, "Jayson Tatum", 26, "Masculino", "Estados Unidos", 1, 11),
    (10, "Kevin Durant", 35, "Masculino", "Estados Unidos", 1, 11),
    (11, "Anthony Davis", 31, "Masculino", "Estados Unidos", 1, 11),
    (12, "Steve Kerr", 58, "Masculino", "Estados Unidos", 2, 11), 	
    (13, "Alyssa Naeher", 36, "Feminino", "Estados Unidos", 1, 11), -- Fem Football USA
    (14, "Emily Fox", 26, "Feminino", "Estados Unidos", 1, 11),
    (15, "Naomi Girma", 24, "Feminino", "Estados Unidos", 1, 11),
    (16, "Kelley O'Hara", 35, "Feminino", "Estados Unidos", 1, 11),
    (17, "Emily Sonnett", 31, "Feminino", "Estados Unidos", 1, 11),
    (18, "Crystal Dunn", 32, "Feminino", "Estados Unidos", 1, 11),
    (19, "Rose Lavelle", 29, "Feminino", "Estados Unidos", 1, 11),
    (20, "Lindsey Horan", 30, "Feminino", "Estados Unidos", 1, 11),
    (21, "Julie Ertz", 32, "Feminino", "Estados Unidos", 1, 11),
    (22, "Sophia Smith", 24, "Feminino", "Estados Unidos", 1, 11),
    (23, "Alex Morgan", 34, "Feminino", "Estados Unidos", 1, 11),
    (24, "Emma Hayes", 48, "Feminino", "Estados Unidos", 2, 11),
    (25, "Matt Turner", 30, "Masculino", "Estados Unidos", 1, 11), -- Masc Football USA
    (26, "Sergiño Dest", 24, "Masculino", "Estados Unidos", 1, 11),
    (27, "Tim Ream", 37, "Masculino", "Estados Unidos", 1, 11),
    (28, "Walker Zimmerman", 31, "Masculino", "Estados Unidos", 1, 11),
    (29, "Antonee Robinson", 26, "Masculino", "Estados Unidos", 1, 11),
    (30, "Tyler Adams", 25, "Masculino", "Estados Unidos", 1, 11),
    (31, "Weston McKennie", 25, "Masculino", "Estados Unidos", 1, 11),
    (32, "Yunus Musah", 21, "Masculino", "Estados Unidos", 1, 11),
    (33, "Christian Pulisic", 26, "Masculino", "Estados Unidos", 1, 11),
    (34, "Giovanni Reyna", 22, "Masculino", "Estados Unidos", 1, 11),
    (35, "Ricardo Pepi", 22, "Masculino", "Estados Unidos", 1, 11),
    (36, "Gregg Berhalter", 51, "Masculino", "Estados Unidos", 2, 11),
    (37, "Katie Ledecky", 27, "Feminino", "Estados Unidos", 1, 11), -- Fem Swimming USA
    (38, "Greg Meehan", 50, "Masculino", "Estados Unidos", 2, 11),
    (39, "Caeleb Dressel", 27, "Masculino", "Estados Unidos", 1, 11), -- Masc Swimming USA
    (40, "Gregg Troy", 71, "Masculino", "Estados Unidos", 2, 11),
    (41, "Peyton Silva", 26, "Feminino", "Brasil", 1, 10),  -- Fem Basket Br
    (42, "Marta", 38, "Feminino", "Brasil", 1, 10),
    (43, "Bia Cortelazzi", 32, "Feminino", "Brasil", 1, 10),
    (44, "Andressa Coelho", 30, "Feminino", "Brasil", 1, 10),
    (45, "Tainá Paixão", 24, "Feminino", "Brasil", 1, 10),
    (46, "Iziane Castro", 41, "Feminino", "Brasil", 2, 10),
    (47, "Leandro Barbosa", 41, "Masculino", "Brasil", 1, 10),  -- Masc Basket Br
    (48, "Bruno Caboclo", 28, "Masculino", "Brasil", 1, 10),
    (49, "Marquinhos", 35, "Masculino", "Brasil", 1, 10),
    (50, "Vitor Benite", 32, "Masculino", "Brasil", 1, 10),
    (51, "Lucio", 29, "Masculino", "Brasil", 1, 10),
    (52, "José Neto", 52, "Masculino", "Brasil", 2, 10),
    (53, "Formiga", 43, "Feminino", "Brasil", 1, 10),  -- Fem Football Br
    (54, "Cristiane", 38, "Feminino", "Brasil", 1, 10),
    (55, "Debinha", 31, "Feminino", "Brasil", 1, 10),
    (56, "Tamires", 34, "Feminino", "Brasil", 1, 10),
    (57, "Thaisa", 33, "Feminino", "Brasil", 1, 10),
    (58, "Raquel", 30, "Feminino", "Brasil", 1, 10),
    (59, "Erika", 32, "Feminino", "Brasil", 1, 10),
    (60, "Mônica", 34, "Feminino", "Brasil", 1, 10),
    (61, "Andressa Alves", 30, "Feminino", "Brasil", 1, 10),
    (62, "Beatriz Zaneratto", 28, "Feminino", "Brasil", 1, 10),
    (63, "Aline", 33, "Feminino", "Brasil", 1, 10),
    (64, "Pia Sundhage", 64, "Feminino", "Brasil", 2, 10),
    (65, "Alisson Becker", 31, "Masculino", "Brasil", 1, 10),  -- Masc Football Br
    (66, "Thiago Silva", 40, "Masculino", "Brasil", 1, 10),
    (67, "Neymar", 31, "Masculino", "Brasil", 1, 10),
    (68, "Gabriel Jesus", 26, "Masculino", "Brasil", 1, 10),
    (69, "Casemiro", 31, "Masculino", "Brasil", 1, 10),
    (70, "Vinícius Júnior", 23, "Masculino", "Brasil", 1, 10),
    (71, "Marquinhos", 29, "Masculino", "Brasil", 1, 10),
    (72, "Lucas Paquetá", 26, "Masculino", "Brasil", 1, 10),
    (73, "Richarlison", 26, "Masculino", "Brasil", 1, 10),
    (74, "Rodrygo", 22, "Masculino", "Brasil", 1, 10),
    (75, "Fred", 30, "Masculino", "Brasil", 1, 10),
    (76, "Tite", 63, "Masculino", "Brasil", 2, 10),
    (77, "Mirella Rangel", 28, "Feminino", "Brasil", 1, 10),  -- Fem Swimming Br
    (78, "Fernando Scheffer", 28, "Masculino", "Brasil", 2, 10),
    (79, "Etiene Medeiros", 32, "Feminino", "Brasil", 1, 10),  -- Masc Swimming Br
    (80, "César Cielo", 37, "Masculino", "Brasil", 2, 10),
    (81, "Cláudia Duarte", 26, "Feminino", "Portugal", 1, 11),  -- Fem Basket Pt
    (82, "Marta Pereira", 38, "Feminino", "Portugal", 1, 11),
    (83, "Bárbara Lourenço", 32, "Feminino", "Portugal", 1, 11),
    (84, "Andréia Rodrigues", 30, "Feminino", "Portugal", 1, 11),
    (85, "Tânia Cardoso", 24, "Feminino", "Portugal", 1, 11),
    (86, "Isabel Vítor", 41, "Feminino", "Portugal", 2, 11),
    (87, "Ricardo Reis", 41, "Masculino", "Portugal", 1, 11),  -- Masc Basket Pt
    (88, "João Fernandes", 28, "Masculino", "Portugal", 1, 11),
    (89, "Marcos Santos", 35, "Masculino", "Portugal", 1, 11),
    (90, "Vítor Monteiro", 32, "Masculino", "Portugal", 1, 11),
    (91, "Luis Pinto", 29, "Masculino", "Portugal", 1, 11),
    (92, "José Silva", 52, "Masculino", "Portugal", 2, 11),
    (93, "Carolina Mendes", 43, "Feminino", "Portugal", 1, 11),  -- Fem Football Pt
    (94, "Cristina Ferreira", 38, "Feminino", "Portugal", 1, 11),
    (95, "Cláudia Neto", 31, "Feminino", "Portugal", 1, 11),
    (96, "Tamires Neves", 34, "Feminino", "Portugal", 1, 11),
    (97, "Thais Pinto", 33, "Feminino", "Portugal", 1, 11),
    (98, "Raquel Pires", 30, "Feminino", "Portugal", 1, 11),
    (99, "Erika Almeida", 32, "Feminino", "Portugal", 1, 11),
    (100, "Mónica Duarte", 34, "Feminino", "Portugal", 1, 11),
    (101, "Andressa Pinto", 30, "Feminino", "Portugal", 1, 11),
    (102, "Beatriz Ribeiro", 28, "Feminino", "Portugal", 1, 11),
    (103, "Ana Martins", 33, "Feminino", "Portugal", 1, 11),
    (104, "José João", 64, "Feminino", "Portugal", 2, 11),
    (105, "Rui Patrício", 31, "Masculino", "Portugal", 1, 11),  -- Masc Football Pt
    (106, "Pepe", 40, "Masculino", "Portugal", 1, 11),
    (107, "Cristiano Ronaldo", 31, "Masculino", "Portugal", 1, 11),
    (108, "João Félix", 26, "Masculino", "Portugal", 1, 11),
    (109, "William Carvalho", 31, "Masculino", "Portugal", 1, 11),
    (110, "Diogo Jota", 23, "Masculino", "Portugal", 1, 11),
    (111, "Marcos André", 29, "Masculino", "Portugal", 1, 11),
    (112, "João Mário", 26, "Masculino", "Portugal", 1, 11),
    (113, "Ricardo Horta", 26, "Masculino", "Portugal", 1, 11),
    (114, "Rafael Leão", 22, "Masculino", "Portugal", 1, 11),
    (115, "Bruno Fernandes", 30, "Masculino", "Portugal", 1, 11),
    (116, "Fernando Santos", 63, "Masculino", "Portugal", 2, 11),
    (117, "Mirella Rodrigues", 28, "Feminino", "Portugal", 1, 11),  -- Fem Swimming Pt
    (118, "Fernando Costa", 28, "Masculino", "Portugal", 2, 11),
    (119, "Etiene Monteiro", 32, "Feminino", "Portugal", 1, 11),  -- Masc Swimming Pt
    (120, "César Santos", 37, "Masculino", "Portugal", 2, 11),
    (121, "Maki Takada", 26, "Feminino", "Japão", 1, 9),  # Fem Basket Japão
    (122, "Sakiya Kitagawa", 38, "Feminino", "Japão", 1, 9),
    (123, "Ramu Tokashiki", 32, "Feminino", "Japão", 1, 9),
    (124, "Satomi Watanabe", 30, "Feminino", "Japão", 1, 9),
    (125, "Mai Yamamoto", 24, "Feminino", "Japão", 1, 9),
    (126, "Tomohide Utsumi", 41, "Feminino", "Japão", 2, 9),
    (127, "Yuta Watanabe", 28, "Masculino", "Japão", 1, 9),  # Masc Basket Japão
    (128, "Yudai Baba", 28, "Masculino", "Japão", 1, 9),
    (129, "Gao Aoki", 35, "Masculino", "Japão", 1, 9),
    (130, "Tatsuya Ito", 32, "Masculino", "Japão", 1, 9),
    (131, "Jayson Lickter", 29, "Masculino", "Japão", 1, 9),
    (132, "Tomoya Okamoto", 52, "Masculino", "Japão", 2, 9),
    (133, "Nadeshiko Miyama", 43, "Feminino", "Japão", 1, 9),  # Fem Football Japão
    (134, "Aya Sameshima", 38, "Feminino", "Japão", 1, 9),
    (135, "Saki Kumagai", 31, "Feminino", "Japão", 1, 9),
    (136, "Rumi Utsugi", 34, "Feminino", "Japão", 1, 9),
    (137, "Mami Yamaguchi", 33, "Feminino", "Japão", 1, 9),
    (138, "Haruka Osawa", 30, "Feminino", "Japão", 1, 9),
    (139, "Yuki Nagasato", 32, "Feminino", "Japão", 1, 9),
    (140, "Miho Fukumoto", 34, "Feminino", "Japão", 1, 9),
    (141, "Mina Tanaka", 30, "Feminino", "Japão", 1, 9),
    (142, "Sayuri Kamijo", 28, "Feminino", "Japão", 1, 9),
    (143, "Akemi Noda", 33, "Feminino", "Japão", 1, 9),
    (144, "Asako Takakura", 64, "Feminino", "Japão", 2, 9),
    (145, "Eiji Kawashima", 31, "Masculino", "Japão", 1, 9),  # Masc Football Japão
    (146, "Yuto Nagatomo", 40, "Masculino", "Japão", 1, 9),
    (147, "Takumi Minamino", 31, "Masculino", "Japão", 1, 9),
    (148, "Yuya Osako", 26, "Masculino", "Japão", 1, 9),
    (149, "Wataru Endo", 31, "Masculino", "Japão", 1, 9),
    (150, "Takehiro Tomiyasu", 23, "Masculino", "Japão", 1, 9),
    (151, "Daichi Kamada", 29, "Masculino", "Japão", 1, 9),
    (152, "Shoya Nakajima", 26, "Masculino", "Japão", 1, 9),
    (153, "Hiroki Sakai", 34, "Masculino", "Japão", 1, 9),
    (154, "Gaku Shibasaki", 30, "Masculino", "Japão", 1, 9),
    (155, "Genki Haraguchi", 30, "Masculino", "Japão", 1, 9),
    (156, "Hajime Moriyasu", 53, "Masculino", "Japão", 2, 9),
    (157, "Rika Kihira", 28, "Feminino", "Japão", 1, 9),  # Fem Swimming Japão
    (158, "Kosuke Hagino", 28, "Masculino", "Japão", 2, 9),
    (159, "Natsumi Hoshi", 32, "Feminino", "Japão", 1, 9),  # Masc Swimming Japão
    (160, "Naoya Tomita", 37, "Masculino", "Japão", 2, 9),
    (161, "Alcino Barros", 26, "Feminino", "Angola", 1, 9),  # Fem Basket Angola
    (162, "Luciana Piedade", 38, "Feminino", "Angola", 1, 9),
    (163, "Iolanda João", 32, "Feminino", "Angola", 1, 9),
    (164, "Nadia Gonçalves", 30, "Feminino", "Angola", 1, 9),
    (165, "Sofia Oliveira", 24, "Feminino", "Angola", 1, 9),
    (166, "Marta Chaves", 41, "Feminino", "Angola", 2, 9),
    (167, "Carlos Morais", 34, "Masculino", "Angola", 1, 9),  # Masc Basket Angola
    (168, "Edson Ndoniema", 28, "Masculino", "Angola", 1, 9),
    (169, "Bruno de Carvalho", 35, "Masculino", "Angola", 1, 9),
    (170, "Gerson Gonçalves", 32, "Masculino", "Angola", 1, 9),
    (171, "Joel Almeida", 29, "Masculino", "Angola", 1, 9),
    (172, "José Carlos Guimarães", 52, "Masculino", "Angola", 2, 9),
    (173, "Ana Gonçalves", 43, "Feminino", "Angola", 1, 9),  # Fem Football Angola
    (174, "Lúcia Afonso", 38, "Feminino", "Angola", 1, 9),
    (175, "Cristina Nascimento", 31, "Feminino", "Angola", 1, 9),
    (176, "Tânia Costa", 34, "Feminino", "Angola", 1, 9),
    (177, "Marta Tavares", 33, "Feminino", "Angola", 1, 9),
    (178, "Alzira Mugele", 30, "Feminino", "Angola", 1, 9),
    (179, "Deolinda Ngola", 32, "Feminino", "Angola", 1, 9),
    (180, "Edite Fernandes", 34, "Feminino", "Angola", 1, 9),
    (181, "Elisa Lobo", 30, "Feminino", "Angola", 1, 9),
    (182, "Isaura Afonso", 28, "Feminino", "Angola", 1, 9),
    (183, "Rita Chaves", 33, "Feminino", "Angola", 1, 9),
    (184, "Sílvia Tavares", 35, "Feminino", "Angola", 2, 9),
    (185, "Gilberto Sita", 31, "Masculino", "Angola", 1, 9),  # Masc Football Angola
    (186, "Manuel Shikalo", 40, "Masculino", "Angola", 1, 9),
    (187, "Gelson Dala", 31, "Masculino", "Angola", 1, 9),
    (188, "Mário Balbino", 26, "Masculino", "Angola", 1, 9),
    (189, "Toni Silva", 31, "Masculino", "Angola", 1, 9),
    (190, "André Tavares", 23, "Masculino", "Angola", 1, 9),
    (191, "Ivan Luwongo", 29, "Masculino", "Angola", 1, 9),
    (192, "Jonathan Mário", 26, "Masculino", "Angola", 1, 9),
    (193, "David Lemba", 29, "Masculino", "Angola", 1, 9),
    (194, "Ricardo Job", 30, "Masculino", "Angola", 1, 9),
    (195, "Beto Bissala", 32, "Masculino", "Angola", 1, 9),
    (196, "Pedro Gonçalves", 56, "Masculino", "Angola", 2, 9),
    (197, "Catarina Monteiro", 28, "Feminino", "Angola", 1, 9),  # Fem Swimming Angola
    (198, "Miguel Silva", 28, "Masculino", "Angola", 2, 9),
    (199, "Simone Mendes", 32, "Feminino", "Angola", 1, 9), # Masc Swimming Angola
    (200, "Carlos Martins", 37, "Masculino", "Angola", 2, 9),
    (201, "Lauren Jackson", 42, "Feminino", "Austrália", 1, 11),  # Fem Basket Austrália
    (202, "Liz Cambage", 33, "Feminino", "Austrália", 1, 11),
    (203, "Sami Whitcomb", 34, "Feminino", "Austrália", 1, 11),
    (204, "Becky Hammon", 47, "Feminino", "Austrália", 1, 11),
    (205, "Jenna O'Hea", 35, "Feminino", "Austrália", 1, 11),
    (206, "Sandy Brondello", 54, "Feminino", "Austrália", 2, 11),
    (207, "Patty Mills", 35, "Masculino", "Austrália", 1, 11),  # Masc Basket Austrália
    (208, "Joe Ingles", 36, "Masculino", "Austrália", 1, 11),
    (209, "Ben Simmons", 27, "Masculino", "Austrália", 1, 11),
    (210, "Dante Exum", 29, "Masculino", "Austrália", 1, 11),
    (211, "Matisse Thybulle", 26, "Masculino", "Austrália", 1, 11),
    (212, "Brian Goorjian", 70, "Masculino", "Austrália", 2, 11),
    (213, "Sam Kerr", 30, "Feminino", "Austrália", 1, 11),  # Fem Football Austrália
    (214, "Caitlin Foord", 29, "Feminino", "Austrália", 1, 11),
    (215, "Alanna Kennedy", 29, "Feminino", "Austrália", 1, 11),
    (216, "Hayley Raso", 30, "Feminino", "Austrália", 1, 11),
    (217, "Tameka Yallop", 33, "Feminino", "Austrália", 1, 11),
    (218, "Emily van Egmond", 31, "Feminino", "Austrália", 1, 11),
    (219, "Katrina Gorry", 32, "Feminino", "Austrália", 1, 11),
    (220, "Steph Catley", 30, "Feminino", "Austrália", 1, 11),
    (221, "Courtney Nevin", 22, "Feminino", "Austrália", 1, 11),
    (222, "Clare Polkinghorne", 35, "Feminino", "Austrália", 1, 11),
    (223, "Karly Roestbakken", 26, "Feminino", "Austrália", 1, 11),
    (224, "Tony Gustavsson", 51, "Masculino", "Austrália", 2, 11),
    (225, "Mat Ryan", 32, "Masculino", "Austrália", 1, 11),  # Masc Football Austrália
    (226, "Mitch Langerak", 36, "Masculino", "Austrália", 1, 11),
    (227, "Trent Sainsbury", 32, "Masculino", "Austrália", 1, 11),
    (228, "Jackson Irvine", 31, "Masculino", "Austrália", 1, 11),
    (229, "Awer Mabil", 28, "Masculino", "Austrália", 1, 11),
    (230, "Martin Boyle", 31, "Masculino", "Austrália", 1, 11),
    (231, "Tom Rogic", 31, "Masculino", "Austrália", 1, 11),
    (232, "Matthew Leckie", 32, "Masculino", "Austrália", 1, 11),
    (233, "Craig Goodwin", 32, "Masculino", "Austrália", 1, 11),
    (234, "Jamie Maclaren", 30, "Masculino", "Austrália", 1, 11),
    (235, "Cameron Devlin", 26, "Masculino", "Austrália", 1, 11),
    (236, "Graham Arnold", 60, "Masculino", "Austrália", 2, 11),
    (237, "Emily Seebohm", 32, "Feminino", "Austrália", 1, 11),  # Fem Swimming Austrália
    (238, "Cate Campbell", 31, "Feminino", "Austrália", 1, 11),
    (239, "Kyle Chalmers", 25, "Masculino", "Austrália", 1, 11),  # Masc Swimming Austrália
    (240, "Mack Horton", 28, "Masculino", "Austrália", 1, 11);
    
INSERT INTO Equipa (idEquipa, nacionalidade, idMedalha)
VALUES
    (1, 'Estados Unidos', 2), -- Women Basketball
    (2, 'Estados Unidos', 1), -- Men Basketball
    (3, 'Estados Unidos', NULL), -- Women Football
    (4, 'Estados Unidos', NULL), -- Men Football
    (5, 'Estados Unidos', 3), -- Women Swimming
    (6, 'Estados Unidos', NULL), -- Men Swimming
    (7, 'Brasil', NULL), -- Women Basketball
    (8, 'Brasil', 2), -- Men Basketball
    (9, 'Brasil', 2), -- Women Football
    (10, 'Brasil', 1), -- Men Football
    (11, 'Brasil', 2), -- Women Swimming
    (12, 'Brasil', NULL), -- Men Swimming
    (13, 'Portugal', NULL), -- Women Basketball
    (14, 'Portugal', NULL), -- Men Basketball
    (15, 'Portugal', NULL), -- Women Football
    (16, 'Portugal', 2), -- Men Football
    (17, 'Portugal', NULL), -- Women Swimming
    (18, 'Portugal', 2), -- Men Swimming
    (19, 'Japão', 3), -- Women Basketball
    (20, 'Japão', NULL), -- Men Basketball
    (21, 'Japão', NULL), -- Women Football
    (22, 'Japão', NULL), -- Men Football
    (23, 'Japão', 1), -- Women Swimming
    (24, 'Japão', 3), -- Men Swimming
    (25, 'Angola', 1), -- Women Basketball
    (26, 'Angola', NULL), -- Men Basketball
    (27, 'Angola', 3), -- Women Football
    (28, 'Angola', 3), -- Men Football
    (29, 'Angola', NULL), -- Women Swimming
    (30, 'Angola', 1), -- Men Swimming
    (31, 'Austrália', NULL), -- Women Basketball
    (32, 'Austrália', 3), -- Men Basketball
    (33, 'Austrália', 1), -- Women Football
    (34, 'Austrália', NULL), -- Men Football
    (35, 'Austrália', NULL), -- Women Swimming
    (36, 'Austrália', NULL); -- Men Swimming
    
    
INSERT INTO MembroEquipa (idEquipa, idMembro)
	VALUES
    (1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(3, 9),
	(3, 10),
	(3, 11),
	(3, 12),
	(3, 13),
	(3, 14),
	(4, 15),
	(4, 16),
	(4, 17),
	(4, 18),
	(4, 19),
	(4, 20),
	(4, 21),
	(4, 22),
	(4, 23),
	(4, 24),
	(4, 25),
	(4, 26),
	(5, 27),
	(5, 28),
	(5, 29),
	(5, 30),
	(5, 31),
	(5, 32),
	(5, 33),
	(5, 34),
	(5, 35),
	(5, 36),
	(5, 37),
	(5, 38),
	(6, 39),
	(6, 40),
	(7, 41),
	(7, 42),
	(8, 43),
	(8, 44),
	(8, 45),
	(8, 46),
	(8, 47),
	(8, 48),
	(9, 49),
	(9, 50),
	(9, 51),
	(9, 52),
	(9, 53),
	(9, 54),
	(10, 55),
	(10, 56),
	(10, 57),
	(10, 58),
	(10, 59),
	(10, 60),
	(10, 61),
	(10, 62),
	(10, 63),
	(10, 64),
	(10, 65),
	(10, 66),
	(11, 67),
	(11, 68),
	(11, 69),
	(11, 70),
	(11, 71),
	(11, 72),
	(11, 73),
	(11, 74),
	(11, 75),
	(11, 76),
	(11, 77),
	(11, 78),
	(12, 79),
	(12, 80),
	(13, 81),
	(13, 82),
	(14, 83),
	(14, 84),
	(14, 85),
	(14, 86),
	(14, 87),
	(14, 88),
	(15, 89),
	(15, 90),
	(15, 91),
	(15, 92),
	(15, 93),
	(15, 94),
	(16, 95),
	(16, 96),
	(16, 97),
	(16, 98),
	(16, 99),
	(16, 100),
	(16, 101),
	(16, 102),
	(16, 103),
	(16, 104),
	(16, 105),
	(16, 106),
	(17, 107),
	(17, 108),
	(17, 109),
	(17, 110),
	(17, 111),
	(17, 112),
	(17, 113),
	(17, 114),
	(17, 115),
	(17, 116),
	(17, 117),
	(17, 118),
	(18, 119),
	(18, 120),
	(19, 121),
	(19, 122),
	(20, 123),
	(20, 124),
	(20, 125),
	(20, 126),
	(20, 127),
	(20, 128),
	(21, 129),
	(21, 130),
	(21, 131),
	(21, 132),
	(21, 133),
	(21, 134),
	(22, 135),
	(22, 136),
	(22, 137),
	(22, 138),
	(22, 139),
	(22, 140),
	(22, 141),
	(22, 142),
	(22, 143),
	(22, 144),
	(22, 145),
	(22, 146),
	(23, 147),
	(23, 148),
	(23, 149),
	(23, 150),
	(23, 151),
	(23, 152),
	(23, 153),
	(23, 154),
	(23, 155),
	(23, 156),
	(23, 157),
	(23, 158),
	(24, 159),
	(24, 160),
	(25, 161),
	(25, 162),
	(26, 163),
	(26, 164),
	(26, 165),
	(26, 166),
	(26, 167),
	(26, 168),
	(27, 169),
	(27, 170),
	(27, 171),
	(27, 172),
	(27, 173),
	(27, 174),
	(28, 175),
	(28, 176),
	(28, 177),
	(28, 178),
	(28, 179),
	(28, 180),
	(28, 181),
	(28, 182),
	(28, 183),
	(28, 184),
	(28, 185),
	(28, 186),
	(29, 187),
	(29, 188),
	(29, 189),
	(29, 190),
	(29, 191),
	(29, 192),
	(29, 193),
	(29, 194),
	(29, 195),
	(29, 196),
	(29, 197),
	(29, 198),
	(30, 199),
	(30, 200),
	(31, 201),
	(31, 202),
	(32, 203),
	(32, 204),
	(32, 205),
	(32, 206),
	(32, 207),
	(32, 208),
	(33, 209),
	(33, 210),
	(33, 211),
	(33, 212),
	(33, 213),
	(33, 214),
	(34, 215),
	(34, 216),
	(34, 217),
	(34, 218),
	(34, 219),
	(34, 220),
	(34, 221),
	(34, 222),
	(34, 223),
	(34, 224),
	(34, 225),
	(34, 226),
	(35, 227),
	(35, 228),
	(35, 229),
	(35, 230),
	(35, 231),
	(35, 232),
	(35, 233),
	(35, 234),
	(35, 235),
	(35, 236),
	(35, 237),
	(35, 238),
	(36, 239),
	(36, 240);
    
INSERT INTO Modalidade (idModalidade, nome, genero, tipo, idJogosOlimpicos)
	VALUES 
    (1, 'Basketball', 'Male', 'Team', 1),
    (2, 'Basketball', 'Female', 'Team', 1),
    (3, 'Swimming', 'Male', 'Individual', 1),
    (4, 'Swimming', 'Female', 'Individual', 1),
    (5, 'Football', 'Male', 'Team', 1),
    (6, 'Football', 'Female', 'Team', 1);

INSERT INTO Prova (idProva, duracao, nome, dataProva, idInstalacao, idModalidade)
	VALUES 
    (1, 90.0, 'Final Basketball Men', '2025-03-12 19:30:00', 1, 1),
    (2, 90.0, 'Final Basketball Women', '2024-03-13 22:30:00', 3, 2),
    (3, 50.0, '100m Freestyle Men', '2024-03-12 18:30:00', 2, 3),
    (4, 50.0, '100m Freestyle Women', '2024-03-12 17:30:00', 5, 4),
    (5, 90.0, 'Football Men Final', '2024-03-01 20:30:00', 4, 5),
    (6, 90.0, 'Football Women Final', '2024-03-02 12:30:00', 1, 6);


-- Insert data into ProvaEquipa
INSERT INTO ProvaEquipa (idProva, idEquipa, resultado)
	VALUES 
    -- Basketball Final Men
    (1,2,94),
    (1,8,90),
    -- Basketball Final Woman
    (2,1,68),
    (2,33,73),
	-- 4x100m Freestyle Relay Men
    (3, 30,"0.302"),
    (3, 18, "0.303"),
    (3, 24, "0.305"),
    (3, 36, "0.307"),
    -- 4x100m Freestyle Relay Woman
    (4,23,0.352),
    (4,11,0.362),
    (4,5,0.367),
    (4,29,0.38),
	-- Football Final Men
    (5,10,3),
    (5,16,2),
    -- Football Final Woman
    (6,9,0),
    (6,33,1);
    
INSERT INTO Adepto (bilhete, nome, idProva)
	VALUES
    (1, 'André Carvalho', 1),
    (2, 'Cláudia Santos', 1),
    (3, 'Joana Costa', 2),
    (4, 'Rui Oliveira', 2),
    (5, 'Pedro Nogueira', 3),
    (6, 'Mariana Lopes', 3),
    (7, 'Luís Pereira', 4),
    (8, 'Ana Martins', 4),
    (9, 'Carla Almeida', 1),
    (10, 'Tiago Monteiro', 2),
    (11, 'Sofia Ribeiro', 3),
    (12, 'Bruno Correia', 4),
    (13, 'Isabel Rodrigues', 1),
    (14, 'Miguel Teixeira', 2),
    (15, 'Helena Fonseca', 3),
    (16, 'Ricardo Silva', 4),
    (17, 'Fernanda Cardoso', 1),
    (18, 'Diogo Matos', 2),
    (19, 'Patrícia Torres', 3),
    (20, 'Fábio Castro', 6),
	(21, 'Marta Ferreira', 5),
    (22, 'José Almeida', 5),
    (23, 'Inês Costa', 5),
    (24, 'Bruno Neves', 5),
    (25, 'Carolina Lopes', 5),
    (26, 'Hugo Marques', 5),
    (27, 'Patrícia Oliveira', 5),
    (28, 'Rafael Gonçalves', 5),
    (29, 'Fernanda Silva', 5),
    (30, 'Leonardo Martins', 1),
    (31, 'Tatiana Vieira', 6),
    (32, 'Gabriel Pereira', 2),
    (33, 'Renato Sousa', 6),
    (34, 'Joana Faria', 3),
    (35, 'Marcos Simões', 4),
    (36, 'Cláudia Mendes', 6),
    (37, 'Diogo Barbosa', 6),
    (38, 'Adriana Antunes', 6),
    (39, 'Victor Coelho', 3),
    (40, 'Vanessa Teixeira', 6);

INSERT INTO Contacto (idContacto, tipo, valor, idEquipa, idJogosOlimpicos, idFuncionario, idInstalacao)
	VALUES
    (1, 'Email', 'equipa1@olympics.com', 1, NULL, NULL, NULL),
    (2, 'Telefone', '+123456789', NULL, 1, NULL, NULL),
    (3, 'Email', 'funcionario1@brasil2024.com', NULL, NULL, 1, NULL),
    (4, 'Telefone', '+987654321', NULL, NULL, 2, NULL),
    (5, 'Email', 'instalacao1@brisbane2024.com', NULL, NULL, NULL, 1),
    (6, 'Telefone', '+1122334455', NULL, NULL, NULL, 2),
    (7, 'Email', 'equipa2@olympics.com', 2, NULL, NULL, NULL),
    (8, 'Telefone', '+2233445566', NULL, 1, NULL, NULL),
    (9, 'Email', 'funcionario2@brasil2024.com', NULL, NULL, 3, NULL),
    (10, 'Telefone', '+3344556677', NULL, NULL, 4, NULL),
    (11, 'Email', 'instalacao2@brisbane2024.com', NULL, NULL, NULL, 3),
    (12, 'Telefone', '+4455667788', NULL, NULL, NULL, 4),
    (13, 'Email', 'equipa3@olympics.com', 3, NULL, NULL, NULL),
    (14, 'Telefone', '+5566778899', NULL, 1, NULL, NULL),
    (15, 'Email', 'funcionario3@brasil2024.com', NULL, NULL, 5, NULL),
    (16, 'Telefone', '+6677889900', NULL, NULL, 6, NULL),
    (17, 'Email', 'instalacao3@brisbane2024.com', NULL, NULL, NULL, 5),
    (18, 'Telefone', '+7788990011', NULL, NULL, NULL, 6),
    (19, 'Email', 'equipa4@olympics.com', 4, NULL, NULL, NULL),
    (20, 'Telefone', '+8899001122', NULL, 1, NULL, NULL),
	(21, 'Email', 'equipa5@olympics.com', 5, NULL, NULL, NULL),
    (22, 'Telefone', '+9001122334', 6, NULL, NULL, NULL),
    (23, 'Email', 'equipa7@olympics.com', 7, NULL, NULL, NULL),
    (24, 'Telefone', '+9012233445', 8, NULL, NULL, NULL),
    (25, 'Email', 'equipa9@olympics.com', 9, NULL, NULL, NULL),
    (26, 'Telefone', '+9023344556', 10, NULL, NULL, NULL),
    (27, 'Email', 'equipa11@olympics.com', 11, NULL, NULL, NULL),
    (28, 'Telefone', '+9034455667', 12, NULL, NULL, NULL),
    (29, 'Email', 'equipa13@olympics.com', 13, NULL, NULL, NULL),
    (30, 'Telefone', '+9045566778', 14, NULL, NULL, NULL),
    (31, 'Email', 'equipa15@olympics.com', 15, NULL, NULL, NULL),
    (32, 'Telefone', '+9056677889', 16, NULL, NULL, NULL),
	(33, 'Email', 'funcionario7@olympics.com', NULL, NULL, 7, NULL),
    (34, 'Telefone', '+9067788990', NULL, NULL, 8, NULL),
    (35, 'Email', 'funcionario9@olympics.com', NULL, NULL, 9, NULL),
    (36, 'Telefone', '+9078899001', NULL, NULL, 10, NULL),
    (37, 'Email', 'funcionario11@olympics.com', NULL, NULL, 11, NULL),
	(38, 'Email', 'instalacao7@olympics.com', NULL, NULL, NULL, 7),
    (39, 'Telefone', '+9089901122', NULL, NULL, NULL, 8);