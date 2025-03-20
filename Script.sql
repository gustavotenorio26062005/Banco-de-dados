
CREATE TABLE IF NOT EXISTS  `tb_duracao` (
  `dura_cod` CHAR(2) NOT NULL,
  `dura_descricao` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`dura_cod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS  `tb_escalador` (
  `esca_cod` INT NOT NULL AUTO_INCREMENT,
  `esca_nome` VARCHAR(50) NULL DEFAULT NULL,
  `esca_idade` INT NULL DEFAULT NULL,
  `esca_experiencia` INT NULL DEFAULT NULL,
  `esca_nr_federacao` INT NULL DEFAULT NULL,
  PRIMARY KEY (`esca_cod`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



CREATE TABLE IF NOT EXISTS  `tb_grau` (
  `grau_cod` VARCHAR(5) NOT NULL,
  `grau_descricao` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`grau_cod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



CREATE TABLE IF NOT EXISTS  `tb_exposicao` (
  `expo_cod` CHAR(2) NOT NULL,
  `expo_descricao` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`expo_cod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



CREATE TABLE IF NOT EXISTS  `tb_montanha` (
  `mont_cod` INT NOT NULL AUTO_INCREMENT,
  `mont_altura` FLOAT NOT NULL,
  `mont_localizacao` VARCHAR(200) NULL DEFAULT NULL,
  `mont_tipo` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`mont_cod`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



CREATE TABLE IF NOT EXISTS  `tb_via` (
  `via_cod` INT NOT NULL AUTO_INCREMENT,
  `via_nome` VARCHAR(100) NULL DEFAULT NULL,
  `via_apelido` VARCHAR(100) NULL DEFAULT NULL,
  `via_duracao_fk` CHAR(2) NULL DEFAULT NULL,
  `via_exposicao_fk` CHAR(2) NULL,
  `via_grau_fk` VARCHAR(5) NULL DEFAULT NULL,
  `via_crux_fk` VARCHAR(5) NULL DEFAULT NULL,
  `via_montanha_fk` INT NULL DEFAULT NULL,
  PRIMARY KEY (`via_cod`),
  INDEX `fk_duracao_idx` (`via_duracao_fk` ASC) VISIBLE,
  INDEX `fk_exposicao_idx` (`via_exposicao_fk` ASC) VISIBLE,
  INDEX `fk_grau_idx` (`via_grau_fk` ASC) VISIBLE,
  INDEX `fk_crux_idx` (`via_crux_fk` ASC) VISIBLE,
  INDEX `fk_montanha_idx` (`via_montanha_fk` ASC) VISIBLE,
  CONSTRAINT `fk_crux`
    FOREIGN KEY (`via_crux_fk`)
    REFERENCES  `tb_grau` (`grau_cod`),
  CONSTRAINT `fk_duracao`
    FOREIGN KEY (`via_duracao_fk`)
    REFERENCES  `tb_duracao` (`dura_cod`),
  CONSTRAINT `fk_exposicao`
    FOREIGN KEY (`via_exposicao_fk`)
    REFERENCES  `tb_exposicao` (`expo_cod`),
  CONSTRAINT `fk_grau`
    FOREIGN KEY (`via_grau_fk`)
    REFERENCES  `tb_grau` (`grau_cod`),
  CONSTRAINT `fk_montanha`
    FOREIGN KEY (`via_montanha_fk`)
    REFERENCES  `tb_montanha` (`mont_cod`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



CREATE TABLE IF NOT EXISTS  `tb_escalada` (
  `escalada_cod` INT NOT NULL AUTO_INCREMENT,
  `escalada_via_fk` INT NOT NULL,
  `escalada_escalador_fk` INT NOT NULL,
  `escalada_data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `escalada_escalador2_fk` INT NULL,
  INDEX `fk_escalador5_idx` (`escalada_escalador_fk` ASC) VISIBLE,
  PRIMARY KEY (`escalada_cod`),
  INDEX `fk_escalador2__idx` (`escalada_escalador2_fk` ASC) VISIBLE,
  CONSTRAINT `fk_escalador5`
    FOREIGN KEY (`escalada_escalador_fk`)
    REFERENCES  `tb_escalador` (`esca_cod`),
  CONSTRAINT `fk_via5`
    FOREIGN KEY (`escalada_via_fk`)
    REFERENCES  `tb_via` (`via_cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_escalador2_`
    FOREIGN KEY (`escalada_escalador2_fk`)
    REFERENCES  `tb_escalador` (`esca_cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS  `tb_ocorrencia` (
  `ocor_cod` INT NOT NULL AUTO_INCREMENT,
  `ocor_descricao` VARCHAR(200) NULL DEFAULT NULL,
  `ocor_escalada_fk` INT NULL DEFAULT NULL,
  `ocor_data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ocor_cod`),
  INDEX `fk_escalada1_idx` (`ocor_escalada_fk` ASC) VISIBLE,
  CONSTRAINT `fk_escalada1`
    FOREIGN KEY (`ocor_escalada_fk`)
    REFERENCES  `tb_escalada` (`escalada_cod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



CREATE TABLE IF NOT EXISTS  `tb_regrampeamento` (
  `regr_cod` INT NOT NULL AUTO_INCREMENT,
  `regr_data` DATETIME NULL DEFAULT NULL,
  `regr_escalada_fk` INT NULL DEFAULT NULL,
  PRIMARY KEY (`regr_cod`),
  INDEX `fk_escalada5_idx` (`regr_escalada_fk` ASC) VISIBLE,
  CONSTRAINT `fk_escalada5`
    FOREIGN KEY (`regr_escalada_fk`)
    REFERENCES  `tb_escalada` (`escalada_cod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;





-- Inserindo dados na tabela tb_grau
INSERT INTO tb_grau (grau_cod, grau_descricao) VALUES
('I', 'Fácil - Vias de caminhada, sem necessidade de técnicas de escalada.'),
('II', 'Moderado - Vias que podem exigir uso das mãos, mas não são técnicas; podem incluir trechos expostos.'),
('III', 'Pouco Difícil - Vias que começam a exigir técnicas básicas de escalada; geralmente curtas e com bons apoios.'),
('IV', 'Difícil - Vias que exigem técnicas de escalada mais avançadas, com passagens verticais ou ligeiramente negativas; exige esforço e experiência.'),
('V', 'Muito Difícil - Vias que requerem bom domínio técnico e força, podendo incluir passagens negativas ou crux.'),
('VI', 'Extremamente Difícil - Vias que exigem alto nível técnico, força, resistência e experiência; geralmente com passagens longas, negativas e poucos apoios.'),
('VII', 'Dificuldade excepcional, com subdivisões indicando dificuldade crescente (VIIa, VIIb, VIIc, etc.).'),
('VIII', 'Dificuldade altíssima, exigindo alta força, resistência e técnica apurada.'),
('IX', 'Dificuldade extrema, reservada a escaladores de elite.'),
('X', 'O limite máximo da escalada esportiva, com desafios quase impossíveis.');

-- Inserindo dados na tabela tb_duracao
INSERT INTO tb_duracao (dura_cod, dura_descricao) VALUES
('D1', 'Menos de 1 hora.'),
('D2', 'De 1 a 3 horas.'),
('D3', 'De 3 a 6 horas.'),
('D4', 'Mais de 6 horas, geralmente um dia inteiro.'),
('D5', 'Mais de um dia.'),
('D6', 'Vários dias a semanas.');

-- Inserindo dados na tabela tb_exposicao
INSERT INTO tb_exposicao (expo_cod, expo_descricao) VALUES
('E1', 'Exposição mínima. Riscos baixos de lesões graves.'),
('E2', 'Exposição moderada. Risco de lesões sérias permanece baixo.'),
('E3', 'Exposição alta. Chance de quedas longas é maior, e o risco de lesões aumenta.'),
('E4', 'Exposição muito alta. Potencialmente perigosa, com maior risco de lesões graves.'),
('E5', 'Exposição extrema. Queda nesta exposição pode ter consequências fatais.');



INSERT INTO `tb_escalador` (`esca_nome`, `esca_idade`, `esca_experiencia`, `esca_nr_federacao`) VALUES
('Carlos Siqueira', 32, 10, 1001),
('Fernanda Souza', 27, 7, 1002),
('João Almeida', 40, 15, 1003),
('Mariana Lima', 29, 9, null),
('Ricardo Oliveira', 35, 12, null),
('Beatriz Santos', 25, 5, null),
('Gustavo Ferreira', 30, 8, 1007),
('Larissa Mendes', 28, 6, 1008),
('Eduardo Pereira', 33, 11, 1009),
('Tatiane Barbosa', 26, 4, 1010),
('André Nogueira', 31, 10, 1011),
('Camila Ribeiro', 22, 3, 1012),
('Felipe Moreira', 37, 13, null),
('Juliana Costa', 29, 7, 1014),
('Renato Farias', 42, 16, null),
('Ana Beatriz Melo', 24, 5, 1016),
('Leonardo Martins', 36, 12, null),
('Patrícia Silva', 27, 6, 1018),
('Vinícius Rocha', 33, 9, 1019),
('Sabrina Andrade', 30, 8, 1020),
('Fábio Correia', 38, 14, 1021),
('Carolina Teixeira', 25, 5, 1022),
('Daniel Vasconcelos', 34, 10, 1023),
('Isabela Lima', 23, 4, 1024),
('Rodrigo Mendes', 29, 7, 1025),
('Gabriela Freitas', 31, 9, 1026),
('Thiago Batista', 35, 11, null),
('Natália Campos', 26, 6, null),
('César Barros', 39, 15, null),
('Elaine Cardoso', 28, 8, null),
('Hugo Santana', 32, 10, 1031),
('Simone Rezende', 24, 5, 1032),
('Lucas Moraes', 27, 7, 1033),
('Amanda Neves', 30, 8, 1034),
('Pedro Henrique Carvalho', 37, 13, 1035),
('Vanessa Duarte', 22, 3, 1036),
('Roberto Figueiredo', 41, 17, 1037),
('Tatiana Borges', 29, 9, 1038),
('Fernando Assis', 36, 12, 1039),
('Aline Gomes', 25, 6, 1040),
('Bruno Leite', 33, 10, 1041),
('Raquel Amaral', 28, 7, 1042),
('Douglas Macedo', 40, 15, 1043),
('Michelle Vasques', 26, 6, 1044),
('Diego Santana', 31, 9, 1045),
('Priscila Barreto', 27, 5, null),
('Cauã Oliveira', 34, 11, 1047),
('Marina Duarte', 23, 4, 1048),
('Otávio Sales', 35, 12, 1049),
('Lorena Castro', 29, 7, null);


INSERT INTO `tb_montanha` (`mont_altura`, `mont_localizacao`, `mont_tipo`) VALUES
(396, 'Pão de Açúcar', 'Granito'),
(844, 'Pico da Tijuca', 'Granito'),
(220, 'Pedra Bonita', 'Granito'),
(533, 'Morro da Urca', 'Granito'),
(842, 'Pedra da Gávea', 'Granito'),
(1025, 'Pico do Papagaio', 'Granito'),
(2255, 'Pico das Agulhas Negras', 'Gnaisse'),
(980, 'Dedo de Deus', 'Granito'),
(1612, 'Pedra do Sino', 'Gnaisse'),
(1070, 'Pico do Caledônia', 'Gnaisse'),
(620, 'Morro dos Cabritos', 'Granito'),
(1580, 'Pedra do Garrafão', 'Granito'),
(1812, 'Serra dos Órgãos', 'Gnaisse'),
(1880, 'Pico do Couto', 'Gnaisse'),
(2000, 'Morro do Carmo', 'Gnaisse'),
(890, 'Pedra do Elefante', 'Granito'),
(450, 'Pedra do Osso', 'Granito'),
(750, 'Morro do Andaraí', 'Granito'),
(1300, 'Pedra Riscada', 'Gnaisse'),
(1600, 'Morro do Marco', 'Gnaisse');

INSERT INTO tb_via (via_nome, via_apelido, via_duracao_fk, via_exposicao_fk, via_grau_fk, via_crux_fk, via_montanha_fk) VALUES
('Caminho dos Deuses', 'Deuses', 'D3', 'E2', 'IV', 'V', 1),
('Chaminé Stop', 'Stop', 'D2', 'E3', 'III', 'IV', 1),
('Italianos', 'Italianos', 'D4', 'E4', 'V', 'VI', 1),
('Lagartão', 'Lagarto', 'D3', 'E2', 'IV', 'V', 2),
('K2', 'K2', 'D4', 'E4', 'VI', 'VII', 2),
('Secundo', 'Secundo', 'D2', 'E3', 'III', 'IV', 2),
('Cavaleiro Negro', 'Cavaleiro', 'D3', 'E3', 'IV', 'V', 3),
('Belvedere', 'Belvedere', 'D3', 'E2', 'III', 'IV', 3),
('Parque dos Patins', 'Patins', 'D2', 'E2', 'II', 'III', 3),
('Mundo Perdido', 'Perdido', 'D5', 'E5', 'VII', 'VIII', 4),
('Galo das Torres', 'Galo', 'D3', 'E3', 'V', 'VI', 4),
('Quase Nada', 'Nada', 'D2', 'E1', 'II', 'III', 4),
('Trilhas Perdidas', 'Trilhas', 'D4', 'E3', 'VI', 'VII', 5),
('Carona do Vento', 'Carona', 'D3', 'E2', 'V', 'VI', 5),
('Meio Fio', 'Fio', 'D2', 'E1', 'I', 'II', 5),
('Dois Irmãos', 'Irmãos', 'D3', 'E2', 'IV', 'V', 6),
('Toca da Onça', 'Onça', 'D4', 'E3', 'VI', 'VII', 6),
('Torre dos Sonhos', 'Sonhos', 'D3', 'E2', 'IV', 'V', 6),
('Anjos Caídos', 'Anjos', 'D5', 'E5', 'VIII', 'IX', 7),
('Dragão Dourado', 'Dragão', 'D4', 'E4', 'VII', 'VIII', 7),
('Montanha Fantasma', 'Fantasma', 'D3', 'E3', 'V', 'VI', 7),
('Revoada', 'Revoada', 'D3', 'E2', 'III', 'IV', 8),
('Tarde Azul', 'Azul', 'D2', 'E1', 'II', 'III', 8),
('Escudo de Pedra', 'Escudo', 'D4', 'E4', 'VI', 'VII', 8),
('Chão de Estrelas', 'Estrelas', 'D3', 'E3', 'V', 'VI', 9),
('Bravura Suprema', 'Bravura', 'D5', 'E5', 'IX', 'X', 9),
('Pico das Sombras', 'Sombras', 'D3', 'E2', 'IV', 'V', 10),
('O Vento Levou', 'Vento', 'D4', 'E3', 'VI', 'VII', 10),
('Grito na Escuridão', 'Grito', 'D3', 'E2', 'IV', 'V', 10),
('Sobrevivente', 'Sobrevivente', 'D4', 'E3', 'VI', 'VII', 11),
('Lua Nova', 'Lua', 'D3', 'E2', 'IV', 'V', 11),
('Caminho do Horizonte', 'Horizonte', 'D2', 'E1', 'III', 'IV', 11),
('Mar de Nuvens', 'Nuvens', 'D4', 'E4', 'VI', 'VII', 12),
('Estrela Guia', 'Estrela', 'D3', 'E3', 'V', 'VI', 12),
('Pedra Angular', 'Angular', 'D3', 'E2', 'IV', 'V', 12),
('Força Bruta', 'Força', 'D4', 'E4', 'VII', 'VIII', 13),
('Aventuras Noturnas', 'Noturnas', 'D3', 'E2', 'IV', 'V', 13),
('Rastro de Luz', 'Rastro', 'D3', 'E2', 'III', 'IV', 13),
('Abismo de Fogo', 'Abismo', 'D5', 'E5', 'VIII', 'IX', 14),
('Último Horizonte', 'Último', 'D4', 'E4', 'VII', 'VIII', 14),
('Pedra Mística', 'Mística', 'D3', 'E3', 'V', 'VI', 14),
('Guerra nas Estrelas', 'Guerra', 'D4', 'E3', 'VI', 'VII', 15),
('Coração de Pedra', 'Coração', 'D3', 'E2', 'IV', 'V', 15),
('Portal do Tempo', 'Portal', 'D3', 'E2', 'III', 'IV', 15),
('Fênix', 'Fênix', 'D5', 'E5', 'IX', 'X', 16),
('Pegadas na Areia', 'Pegadas', 'D3', 'E2', 'IV', 'V', 16),
('Aurora Boreal', 'Aurora', 'D4', 'E4', 'VI', 'VII', 16);



-- Inserindo escaladas com 1 escalador
INSERT INTO `tb_escalada` (`escalada_via_fk`, `escalada_escalador_fk`, `escalada_data`) VALUES
(1, 1, '2025-03-19 08:00:00'),
(2, 2, '2025-03-19 09:30:00'),
(3, 3, '2025-03-19 10:00:00'),
(4, 4, '2025-03-19 11:15:00'),
(5, 5, '2025-03-19 12:45:00'),
(6, 6, '2025-03-19 14:00:00'),
(7, 7, '2025-03-19 15:30:00'),
(8, 8, '2025-03-19 16:00:00'),
(9, 9, '2025-03-19 17:00:00'),
(10, 10, '2025-03-19 18:30:00'),
(11, 11, '2025-03-19 19:00:00'),
(12, 12, '2025-03-19 20:15:00'),
(13, 13, '2025-03-19 21:00:00'),
(14, 14, '2025-03-19 22:00:00'),
(15, 15, '2025-03-19 23:15:00'),
(16, 16, '2025-03-20 08:30:00'),
(17, 17, '2025-03-20 09:45:00'),
(18, 18, '2025-03-20 10:30:00'),
(19, 19, '2025-03-20 11:00:00'),
(20, 20, '2025-03-20 12:00:00'),
(21, 21, '2025-03-20 13:15:00'),
(22, 22, '2025-03-20 14:45:00'),
(23, 23, '2025-03-20 16:00:00'),
(24, 24, '2025-03-20 17:30:00'),
(25, 25, '2025-03-20 18:15:00'),
(26, 26, '2025-03-20 19:00:00'),
(27, 27, '2025-03-20 20:30:00'),
(28, 28, '2025-03-20 21:30:00'),
(29, 29, '2025-03-20 22:45:00'),
(30, 30, '2025-03-20 23:00:00');

-- Inserindo escaladas com 2 escaladores
INSERT INTO `tb_escalada` (`escalada_via_fk`, `escalada_escalador_fk`, `escalada_escalador2_fk`, `escalada_data`) VALUES
(1, 1, 2, '2025-03-19 08:30:00'),
(2, 3, 4, '2025-03-19 09:00:00'),
(3, 5, 6, '2025-03-19 10:30:00'),
(4, 7, 8, '2025-03-19 11:45:00'),
(5, 9, 10, '2025-03-19 13:00:00'),
(6, 11, 12, '2025-03-19 14:30:00'),
(7, 13, 14, '2025-03-19 15:15:00'),
(8, 15, 16, '2025-03-19 16:45:00'),
(9, 17, 18, '2025-03-19 17:30:00'),
(10, 19, 20, '2025-03-19 18:45:00'),
(11, 21, 22, '2025-03-19 19:15:00'),
(12, 23, 24, '2025-03-19 20:30:00'),
(13, 25, 26, '2025-03-19 21:00:00'),
(14, 27, 28, '2025-03-19 22:30:00'),
(15, 29, 30, '2025-03-20 08:00:00'),
(16, 1, 3, '2025-03-20 09:30:00'),
(17, 5, 7, '2025-03-20 10:00:00'),
(18, 9, 11, '2025-03-20 11:00:00'),
(19, 13, 15, '2025-03-20 12:30:00'),
(20, 17, 19, '2025-03-20 13:15:00'),
(21, 21, 23, '2025-03-20 14:00:00'),
(22, 25, 27, '2025-03-20 15:30:00'),
(23, 29, 1, '2025-03-20 16:45:00'),
(24, 2, 4, '2025-03-20 17:00:00'),
(25, 6, 8, '2025-03-20 18:30:00'),
(26, 10, 12, '2025-03-20 19:30:00'),
(27, 14, 16, '2025-03-20 20:00:00'),
(28, 18, 20, '2025-03-20 21:00:00'),
(29, 22, 24, '2025-03-20 22:00:00'),
(30, 26, 28, '2025-03-20 23:15:00');



INSERT INTO `tb_ocorrencia` (`ocor_descricao`, `ocor_escalada_fk`, `ocor_data`) VALUES
('Grampo solto, risco de queda', 1, CURRENT_TIMESTAMP),
('Animais selvagens na área de escalada', 1, CURRENT_TIMESTAMP),
('Perigo de desabamento de rochas na via', 2, CURRENT_TIMESTAMP),
('Rochas soltas no percurso, perigo para escaladores', 2, CURRENT_TIMESTAMP),
('Sujeira acumulada nas pedras, dificultando a escalada', 3, CURRENT_TIMESTAMP),
('Parte da via coberta por musgo, escorregadio', 3, CURRENT_TIMESTAMP),
('Via interditada devido a queda de pedras', 4, CURRENT_TIMESTAMP),
('Cordas com defeito no percurso', 4, CURRENT_TIMESTAMP),
('Presença de líquenes nas rochas, dificultando a aderência', 5, CURRENT_TIMESTAMP),
('Falta de pontos de ancoragem seguros', 5, CURRENT_TIMESTAMP),
('Risco de deslizamento de terra próximo à via', 6, CURRENT_TIMESTAMP),
('Trilha de acesso bloqueada por árvores caídas', 6, CURRENT_TIMESTAMP),
('Falta de sinalização adequada na via de escalada', 7, CURRENT_TIMESTAMP),
('Dificuldade na visualização das agarras, via pouco iluminada', 7, CURRENT_TIMESTAMP),
('Ferro de escalada enferrujado e solto', 8, CURRENT_TIMESTAMP),
('Área de escalada exposta ao vento forte, risco de queda', 8, CURRENT_TIMESTAMP),
('Riscos de quedas devido ao solo instável', 9, CURRENT_TIMESTAMP),
('Acúmulo de areia nas agarras dificultando a escalada', 9, CURRENT_TIMESTAMP),
('Falta de segurança nos ancoradouros', 10, CURRENT_TIMESTAMP),
('Falta de espaço para movimentação de escaladores', 10, CURRENT_TIMESTAMP),
('Grampo de proteção solto, risco de queda', 1, CURRENT_TIMESTAMP),
('Pedras pequenas rolando durante a escalada', 2, CURRENT_TIMESTAMP),
('Sujeira no caminho, prejudicando a aderência das mãos', 3, CURRENT_TIMESTAMP),
('Risco de rochas caindo do topo da via', 4, CURRENT_TIMESTAMP),
('Árvore caída bloqueando a subida na via', 5, CURRENT_TIMESTAMP),
('Pontos de ancoragem fracos e com desgaste', 6, CURRENT_TIMESTAMP),
('Coragem de escaladores comprometida pela falta de segurança', 7, CURRENT_TIMESTAMP),
('Perigo de queda devido à forte chuva', 8, CURRENT_TIMESTAMP),
('Risco de escorregamento em pedras molhadas', 9, CURRENT_TIMESTAMP),
('Corpo estranho preso na via, dificultando o avanço', 10, CURRENT_TIMESTAMP),
('Rochas com fissuras profundas, risco de desmoronamento', 1, CURRENT_TIMESTAMP),
('Falta de proteção contra quedas em áreas de risco', 2, CURRENT_TIMESTAMP),
('Fumaça densa ao redor da via devido a incêndio próximo', 3, CURRENT_TIMESTAMP),
('Áreas de escalada com musgo escorregadio', 4, CURRENT_TIMESTAMP),
('Sujeira acumulada em agarras de pedras, comprometendo a segurança', 5, CURRENT_TIMESTAMP),
('Risco de acidentes devido a pedras soltas no trajeto', 6, CURRENT_TIMESTAMP),
('Falha nas cordas de segurança durante a escalada', 7, CURRENT_TIMESTAMP),
('Corpo de escalador em perigo devido a deslizamento', 8, CURRENT_TIMESTAMP),
('Presença de raízes de árvores dificultando a passagem', 9, CURRENT_TIMESTAMP),
('Cordas gastas, possibilidade de rompimento durante a escalada', 10, CURRENT_TIMESTAMP),
('Pontos de ancoragem com desgaste evidente, risco de falha', 1, CURRENT_TIMESTAMP),
('Rochas escorregadias devido a alta umidade', 2, CURRENT_TIMESTAMP),
('Perigo de desabamento em uma das faces da rocha', 3, CURRENT_TIMESTAMP),
('Falta de sinalização de segurança, aumentando risco de acidentes', 4, CURRENT_TIMESTAMP),
('Grampo de proteção fora de posição adequada', 5, CURRENT_TIMESTAMP),
('Parte da via coberta por neve, dificultando a escalada', 6, CURRENT_TIMESTAMP),
('Falta de apoio de escalada em áreas inclinadas', 7, CURRENT_TIMESTAMP),
('Pedras grandes bloqueando o caminho, dificultando o avanço', 8, CURRENT_TIMESTAMP),
('Dificuldade para enxergar pontos de ancoragem devido à neblina', 9, CURRENT_TIMESTAMP),
('Trilha de acesso à via de escalada cheia de lama', 10, CURRENT_TIMESTAMP),
('Risco de deslizamento em terreno arenoso', 1, CURRENT_TIMESTAMP),
('Sujeira nas rochas dificultando a visibilidade das agarras', 2, CURRENT_TIMESTAMP),
('Escorregamento nas pedras devido à formação de gelo', 3, CURRENT_TIMESTAMP),
('Risco de queda devido a vento forte no topo da via', 4, CURRENT_TIMESTAMP),
('Falta de equipamentos adequados para a escalada', 5, CURRENT_TIMESTAMP),
('Cordas danificadas devido à exposição ao sol', 6, CURRENT_TIMESTAMP),
('Falta de pontos de ancoragem na parte superior da via', 7, CURRENT_TIMESTAMP),
('Áreas com vegetação alta dificultando a escalada', 8, CURRENT_TIMESTAMP),
('Sujeira nas agarras dificultando a escalada, riscos de quedas', 9, CURRENT_TIMESTAMP),
('Desabamento de rochas grandes na via', 10, CURRENT_TIMESTAMP);



INSERT INTO `tb_regrampeamento` (`regr_data`, `regr_escalada_fk`) VALUES
('2025-03-19 08:45:00', 1),
('2025-03-19 09:30:00', 2),
('2025-03-19 10:00:00', 3),
('2025-03-19 11:00:00', 4),
('2025-03-19 13:15:00', 5),
('2025-03-19 14:45:00', 6),
('2025-03-19 15:30:00', 7),
('2025-03-19 17:00:00', 8),
('2025-03-19 18:15:00', 9),
('2025-03-19 19:45:00', 10),
('2025-03-19 20:30:00', 11),
('2025-03-19 21:15:00', 12),
('2025-03-20 08:30:00', 13),
('2025-03-20 09:45:00', 14),
('2025-03-20 10:30:00', 15),
('2025-03-20 12:00:00', 16),
('2025-03-20 13:00:00', 17),
('2025-03-20 14:30:00', 18),
('2025-03-20 15:15:00', 19),
('2025-03-20 16:00:00', 20),
('2025-03-20 17:30:00', 21),
('2025-03-20 19:00:00', 22),
('2025-03-20 20:15:00', 23);
