-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema confcodigo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema confcodigo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `confcodigo` DEFAULT CHARACTER SET utf8 ;
USE `confcodigo` ;

-- -----------------------------------------------------
-- Table `confcodigo`.`membro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`membro` (
  `id_membro` INT NOT NULL AUTO_INCREMENT,
  `primeiro_nome` VARCHAR(45) NULL,
  `ultimo_nome` VARCHAR(45) NULL,
  `nome_membro` VARCHAR(45) NULL,
  `email` VARCHAR(50) NULL,
  `membrocol` VARCHAR(80) NULL,
  `palavra_passe` VARCHAR(300) NULL,
  `codigo_verificacao` VARCHAR(300) NULL,
  `data_expiracao_codigo` DATETIME NULL,
  `data_entrada` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` TINYINT(0) NULL,
  `e_membro` TINYINT(0) NULL,
  `telefone` VARCHAR(9) NULL,
  `link_imagem` VARCHAR(300) NULL,
  PRIMARY KEY (`id_membro`),
  UNIQUE INDEX `id_membro_UNIQUE` (`id_membro` ASC),
  INDEX `nome_membro` (`nome_membro` ASC),
  INDEX `email` (`email` ASC),
  INDEX `palavra_passe` (`palavra_passe` ASC),
  INDEX `estado` (`estado` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`funcao` (
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE INDEX `id_funcao_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`permissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`permissao` (
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`permissao_funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`permissao_funcao` (
  `permissao_nome` VARCHAR(50) NOT NULL,
  `funcao_nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`permissao_nome`, `funcao_nome`),
  INDEX `fk_permissao_has_funcao_funcao1_idx` (`funcao_nome` ASC),
  INDEX `fk_permissao_has_funcao_permissao1_idx` (`permissao_nome` ASC),
  CONSTRAINT `fk_permissao_has_funcao_permissao1`
    FOREIGN KEY (`permissao_nome`)
    REFERENCES `confcodigo`.`permissao` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissao_has_funcao_funcao1`
    FOREIGN KEY (`funcao_nome`)
    REFERENCES `confcodigo`.`funcao` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`membro_funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`membro_funcao` (
  `membro_id_membro` INT NOT NULL,
  `funcao_nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`membro_id_membro`, `funcao_nome`),
  INDEX `fk_membro_has_funcao_funcao1_idx` (`funcao_nome` ASC),
  INDEX `fk_membro_has_funcao_membro1_idx` (`membro_id_membro` ASC),
  CONSTRAINT `fk_membro_has_funcao_membro1`
    FOREIGN KEY (`membro_id_membro`)
    REFERENCES `confcodigo`.`membro` (`id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_membro_has_funcao_funcao1`
    FOREIGN KEY (`funcao_nome`)
    REFERENCES `confcodigo`.`funcao` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`conferencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`conferencia` (
  `id_conferencia` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL,
  `descricao` LONGTEXT NULL,
  `ano` INT NULL,
  `semestre` TINYINT(4) NULL,
  `data_inicio` DATETIME NULL,
  `data_fim` DATETIME NULL,
  `localizacao` LONGTEXT NULL,
  `preco` DECIMAL NULL,
  PRIMARY KEY (`id_conferencia`),
  UNIQUE INDEX `id_conferencia_UNIQUE` (`id_conferencia` ASC),
  INDEX `datainiconf` (`data_inicio` ASC),
  INDEX `datafimconf` (`data_fim` ASC),
  INDEX `titconf` (`titulo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`proposicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`proposicao` (
  `id_proposicao` INT NOT NULL AUTO_INCREMENT,
  `tema` VARCHAR(100) NULL,
  `descricao` LONGTEXT NULL,
  `tags` VARCHAR(100) NULL,
  `link_doc` VARCHAR(300) NULL,
  `data_criacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_aprovacao` DATETIME NULL,
  `estado` ENUM('aprovado , reprovado, em analise,submetido') NULL,
  `duracao_prevista` INT NULL,
  `id_membro` INT NOT NULL,
  `id_conferencia` INT NULL,
  `decidido_por` INT NULL,
  PRIMARY KEY (`id_proposicao`),
  UNIQUE INDEX `id_proposicao_UNIQUE` (`id_proposicao` ASC),
  INDEX `tema` (`tema` ASC),
  INDEX `tags` (`tags` ASC),
  FULLTEXT INDEX `descricao` (`descricao` ASC),
  INDEX `estado` (`estado` ASC),
  INDEX `fk_proposicao_membro1_idx` (`id_membro` ASC),
  INDEX `fk_proposicao_conferencia1_idx` (`id_conferencia` ASC),
  INDEX `fk_proposicao_membro2_idx` (`decidido_por` ASC),
  CONSTRAINT `fk_proposicao_membro1`
    FOREIGN KEY (`id_membro`)
    REFERENCES `confcodigo`.`membro` (`id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposicao_conferencia1`
    FOREIGN KEY (`id_conferencia`)
    REFERENCES `confcodigo`.`conferencia` (`id_conferencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposicao_membro2`
    FOREIGN KEY (`decidido_por`)
    REFERENCES `confcodigo`.`membro` (`id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`apresentacao_participante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`apresentacao_participante` (
  `proposicao_id_proposicao` INT NOT NULL,
  `membro_id_membro` INT NOT NULL,
  `semestre` TINYINT(4) NULL,
  `ano` INT(11) NULL,
  `ordem` INT NULL,
  `data_inicio` DATETIME NULL,
  `data_fim` DATETIME NULL,
  `quem` ENUM('espetador,apresentador,animador2') NULL,
  PRIMARY KEY (`proposicao_id_proposicao`, `membro_id_membro`),
  INDEX `fk_proposicao_has_membro_membro1_idx` (`membro_id_membro` ASC),
  INDEX `fk_proposicao_has_membro_proposicao1_idx` (`proposicao_id_proposicao` ASC),
  INDEX `ordem` (`ordem` ASC),
  INDEX `data_inicio` (`data_inicio` ASC),
  INDEX `data_fim` (`data_fim` ASC),
  CONSTRAINT `fk_proposicao_has_membro_proposicao1`
    FOREIGN KEY (`proposicao_id_proposicao`)
    REFERENCES `confcodigo`.`proposicao` (`id_proposicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposicao_has_membro_membro1`
    FOREIGN KEY (`membro_id_membro`)
    REFERENCES `confcodigo`.`membro` (`id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`voto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`voto` (
  `i_dvoto` INT NOT NULL AUTO_INCREMENT,
  `nota` TINYINT(4) NULL,
  `comentatio` VARCHAR(300) NULL,
  `data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_proposicao` INT NOT NULL,
  PRIMARY KEY (`i_dvoto`),
  UNIQUE INDEX `i_dvoto_UNIQUE` (`i_dvoto` ASC),
  INDEX `fk_voto_proposicao1_idx` (`id_proposicao` ASC),
  CONSTRAINT `fk_voto_proposicao1`
    FOREIGN KEY (`id_proposicao`)
    REFERENCES `confcodigo`.`proposicao` (`id_proposicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`avaliacao` (
  `id_avaliacao` INT NOT NULL AUTO_INCREMENT,
  `nota` TINYINT(4) NULL,
  `comentatio` VARCHAR(300) NULL,
  `data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_proposicao` INT NOT NULL,
  `id_membro` INT NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  UNIQUE INDEX `id_avaliacao_UNIQUE` (`id_avaliacao` ASC),
  INDEX `nota` (`nota` ASC),
  INDEX `comentario` (`comentatio` ASC),
  INDEX `data` (`data` ASC),
  INDEX `fk_avaliacao_apresentacao_participante1_idx` (`id_proposicao` ASC, `id_membro` ASC),
  CONSTRAINT `fk_avaliacao_apresentacao_participante1`
    FOREIGN KEY (`id_proposicao` , `id_membro`)
    REFERENCES `confcodigo`.`apresentacao_participante` (`proposicao_id_proposicao` , `membro_id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`proposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`proposta` (
  `id_proposta` INT NOT NULL,
  `tema` VARCHAR(100) NULL,
  `descricao` LONGTEXT NULL,
  `tags` VARCHAR(100) NULL,
  `id_membro` INT NOT NULL,
  `id_conferencia` INT NOT NULL,
  `data_criacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proposta`, `id_membro`),
  INDEX `fk_proposta_membro1_idx` (`id_membro` ASC),
  INDEX `fk_proposta_conferencia1_idx` (`id_conferencia` ASC),
  CONSTRAINT `fk_proposta_membro1`
    FOREIGN KEY (`id_membro`)
    REFERENCES `confcodigo`.`membro` (`id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposta_conferencia1`
    FOREIGN KEY (`id_conferencia`)
    REFERENCES `confcodigo`.`conferencia` (`id_conferencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`pagina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`pagina` (
  `id_pagina` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL,
  `link_icon` VARCHAR(300) NULL,
  `e_index` TINYINT(1) NULL DEFAULT 0,
  `activo` ENUM('sim', 'nao') NULL DEFAULT 'sim',
  `meu_link` VARCHAR(100) NULL,
  `meu_template_html` VARCHAR(100) NULL,
  PRIMARY KEY (`id_pagina`),
  UNIQUE INDEX `id_pagina_UNIQUE` (`id_pagina` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`menu` (
  `id_menu` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `link` VARCHAR(100) NULL,
  `template_html` VARCHAR(100) NULL,
  `activo` ENUM('sim', 'nao') NULL DEFAULT 'sim',
  PRIMARY KEY (`id_menu`),
  UNIQUE INDEX `id_menu_UNIQUE` (`id_menu` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`submenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`submenu` (
  `id_submenu` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `link` VARCHAR(100) NULL,
  `activo` ENUM('sim', 'nao') NULL DEFAULT 'sim',
  `template_html` VARCHAR(100) NULL,
  PRIMARY KEY (`id_submenu`),
  UNIQUE INDEX `id_submenu_UNIQUE` (`id_submenu` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`conteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`conteudo` (
  `id_conteudo` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(300) NULL,
  `subtiulo` VARCHAR(300) NULL,
  `trecho` LONGTEXT NULL,
  `conteudo` LONGTEXT NULL,
  PRIMARY KEY (`id_conteudo`),
  UNIQUE INDEX `id_conteudo_UNIQUE` (`id_conteudo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`pagina_conteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`pagina_conteudo` (
  `id_pagina` INT NOT NULL,
  `id_conteudo` INT NOT NULL,
  `ordem` INT NOT NULL,
  `posicao` ENUM('esquerda', 'centro', 'diraita') NOT NULL,
  PRIMARY KEY (`id_pagina`, `id_conteudo`, `ordem`, `posicao`),
  INDEX `fk_pagina_has_conteudo_conteudo1_idx` (`id_conteudo` ASC),
  INDEX `fk_pagina_has_conteudo_pagina1_idx` (`id_pagina` ASC),
  CONSTRAINT `fk_pagina_has_conteudo_pagina1`
    FOREIGN KEY (`id_pagina`)
    REFERENCES `confcodigo`.`pagina` (`id_pagina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagina_has_conteudo_conteudo1`
    FOREIGN KEY (`id_conteudo`)
    REFERENCES `confcodigo`.`conteudo` (`id_conteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`pagina_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`pagina_menu` (
  `id_pagina` INT NOT NULL,
  `id_menu` INT NOT NULL,
  `posicao` ENUM('esquerda', 'centro', 'direito') NOT NULL,
  `ordem` INT NOT NULL,
  PRIMARY KEY (`id_pagina`, `id_menu`, `posicao`, `ordem`),
  INDEX `fk_pagina_has_menu_menu1_idx` (`id_menu` ASC),
  INDEX `fk_pagina_has_menu_pagina1_idx` (`id_pagina` ASC),
  CONSTRAINT `fk_pagina_has_menu_pagina1`
    FOREIGN KEY (`id_pagina`)
    REFERENCES `confcodigo`.`pagina` (`id_pagina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagina_has_menu_menu1`
    FOREIGN KEY (`id_menu`)
    REFERENCES `confcodigo`.`menu` (`id_menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `confcodigo`.`menu_submenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `confcodigo`.`menu_submenu` (
  `id_menu` INT NOT NULL,
  `id_submenu` INT NOT NULL,
  `ordem` INT NOT NULL,
  `posicao` ENUM('esquerda', 'centro', 'direita') NOT NULL,
  PRIMARY KEY (`id_menu`, `id_submenu`, `ordem`, `posicao`),
  INDEX `fk_menu_has_submenu_submenu1_idx` (`id_submenu` ASC),
  INDEX `fk_menu_has_submenu_menu1_idx` (`id_menu` ASC),
  CONSTRAINT `fk_menu_has_submenu_menu1`
    FOREIGN KEY (`id_menu`)
    REFERENCES `confcodigo`.`menu` (`id_menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_has_submenu_submenu1`
    FOREIGN KEY (`id_submenu`)
    REFERENCES `confcodigo`.`submenu` (`id_submenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
