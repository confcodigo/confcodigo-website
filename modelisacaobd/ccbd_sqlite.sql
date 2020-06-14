-- MySQL Workbench Forward Engineering
-- modificado por Adilson Capaia, para corresponder ao SQLITE Engine

-- -----------------------------------------------------
-- Base de dados confcodigo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table membro
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS membro (
  id_membro INTEGER PRIMARY KEY AUTOINCREMENT,
  primeiro_nome TEXT(45) NULL,
  ultimo_nome TEXT(45) NULL,
  nome_membro TEXT(45) NOT NULL UNIQUE,
  email TEXT(50) NOT NULL UNIQUE,
  membrocol TEXT(80) NULL,
  palavra_passe TEXT(300) NULL,
  codigo_verificacao TEXT(300) NULL,
  data_expiracao_codigo DATETIME NULL,
  data_entrada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado INTEGER NULL,
  e_membro INTEGER NULL,
  telefone TEXT(9) NULL,
  link_imagem TEXT(300) NULL
  )
;
CREATE INDEX id_membro_UNIQUE on membro(id_membro);
  
CREATE INDEX nome_membro on membro (nome_membro);
CREATE  INDEX email on membro (email);
CREATE  INDEX palavra_passe on membro (palavra_passe);
CREATE  INDEX estado on membro (estado);




-- -----------------------------------------------------
-- Table funcao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS funcao (
  nome TEXT(50) NOT NULL,
  PRIMARY KEY (nome)
  )
;
create INDEX id_funcao_UNIQUE on funcao(nome );


-- -----------------------------------------------------
-- Table permissao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS permissao (
  nome TEXT(50) NOT NULL,
  PRIMARY KEY (nome) 
  );

CREATE INDEX nome_UNIQUE ON  permissao(nome);
-- -----------------------------------------------------
-- Table permissao_funcao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS permissao_funcao (
  permissao_nome TEXT(50) NOT NULL,
  funcao_nome TEXT(50) NOT NULL,
  PRIMARY KEY (permissao_nome, funcao_nome),
  
    FOREIGN KEY (permissao_nome)
    REFERENCES permissao (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
    FOREIGN KEY (funcao_nome)
    REFERENCES funcao (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
create INDEX fk_permissao_has_funcao_funcao1_idx on  permissao_funcao (funcao_nome );
create INDEX fk_permissao_has_funcao_permissao1_idx on  permissao_funcao(permissao_nome);
  

-- -----------------------------------------------------
-- Table membro_funcao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS membro_funcao (
  membro_id_membro INTEGER NOT NULL,
  funcao_nome TEXT(50) NOT NULL,
  PRIMARY KEY (membro_id_membro, funcao_nome),
  FOREIGN KEY (membro_id_membro)
    REFERENCES membro (id_membro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

    FOREIGN KEY (funcao_nome)
    REFERENCES funcao (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

create INDEX fk_membro_has_funcao_funcao1_idx on membro_funcao (funcao_nome);
create INDEX fk_membro_has_funcao_membro1_idx on membro_funcao (membro_id_membro );
   
-- -----------------------------------------------------
-- Table conferencia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS conferencia (
  id_conferencia INTEGER PRIMARY KEY AUTOINCREMENT,
  titulo TEXT(100) NULL,
  descricao TEXT NULL,
  ano INTEGER NULL,
  semestre INTEGER(4) NULL,
  data_inicio DATETIME NULL,
  data_fim DATETIME NULL,
  localizacao TEXT NULL,
  preco REAL NULL
)
;

create  INDEX id_conferencia_UNIQUE on conferencia(id_conferencia);
create  INDEX datainiconf on conferencia(data_inicio );
create  INDEX datafimconf on conferencia(data_fim );
create  INDEX titconf on conferencia (titulo );

-- -----------------------------------------------------
-- Table proposicao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS proposicao (
  id_proposicao INTEGER PRIMARY KEY AUTOINCREMENT,
  tema TEXT(100) NULL,
  descricao TEXT NULL,
  tags TEXT(100) NULL,
  link_doc TEXT(300) NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  data_aprovacao DATETIME NULL,
  estado TEXT CHECK(estado in ('aprovado , reprovado, em analise,submetido')) NULL,
  duracao_prevista INTEGER NULL,
  id_membro INTEGER NOT NULL,
  id_conferencia INTEGER NULL,
  decidido_por INTEGER NULL,
    FOREIGN KEY (id_membro)
    REFERENCES membro (id_membro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
    FOREIGN KEY (id_conferencia)
    REFERENCES conferencia (id_conferencia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
    FOREIGN KEY (decidido_por)
    REFERENCES membro (id_membro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


create  INDEX tema on proposicao (tema) ;
create  INDEX tags on proposicao(tags );
create INDEX descricao on proposicao (descricao );
create  INDEX estado_prop on proposicao(estado );
create INDEX fk_proposicao_membro1_idx on proposicao (id_membro );
create INDEX fk_proposicao_conferencia1_idx on proposicao(id_conferencia );
create INDEX fk_proposicao_membro2_idx on proposicao(decidido_por );


-- -----------------------------------------------------
-- Table apresentacao_participante
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS apresentacao_participante (
  id_apresentacao INTEGER NOT NULL,
  id_membro INTEGER NOT NULL,
  semestre INTEGER(4) NULL,
  ano INTEGER(11) NULL,
  ordem INTEGER NULL,
  data_inicio DATETIME NULL,
  data_fim DATETIME NULL,
  quem TEXT CHECK(quem in('espetador,apresentador,animador')),
  PRIMARY KEY (id_apresentacao, id_membro),
  
    FOREIGN KEY (id_apresentacao)
    REFERENCES proposicao (id_proposicao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
    FOREIGN KEY (id_membro)
    REFERENCES membro (id_membro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

create INDEX fk_proposicao_has_membro_membro1_idx on apresentacao_participante(id_membro );
create INDEX fk_proposicao_has_membro_proposicao1_idx on apresentacao_participante (id_apresentacao);
create INDEX ordem on apresentacao_participante(ordem );
create INDEX data_inicio on apresentacao_participante(data_inicio );
create INDEX data_fim on apresentacao_participante(data_fim );

-- -----------------------------------------------------
-- Table voto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS voto (
  id_voto INTEGER PRIMARY KEY AUTOINCREMENT,
  nota INTEGER(4) NULL,
  comentatio TEXT(300) NULL,
  data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_proposicao INTEGER NOT NULL,
  
    FOREIGN KEY (id_proposicao)
    REFERENCES proposicao (id_proposicao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

create INDEX fk_voto_proposicao1_idx on voto (id_proposicao );
 
-- -----------------------------------------------------
-- Table avaliacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS avaliacao (
  id_avaliacao INTEGER PRIMARY KEY AUTOINCREMENT,
  nota INTEGER(4) NULL,
  comentatio TEXT(300) NULL,
  data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_apresentacao INTEGER NOT NULL,
  id_membro INTEGER NOT NULL,
   FOREIGN KEY (id_apresentacao)
    REFERENCES apresentacao_participante (id_apresentacao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (id_membro)
    REFERENCES apresentacao_participante (id_membro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  
);

create  INDEX id_avaliacao_UNIQUE on avaliacao (id_avaliacao );
create  INDEX nota on avaliacao (nota );
create  INDEX comentario on avaliacao (comentatio );
create  INDEX data on avaliacao (data );
create  INDEX fk_avaliacao_apresentacao_idx on avaliacao (id_apresentacao );
create  INDEX fk_avaliacao_participante1_idx on avaliacao(id_membro );

   

-- -----------------------------------------------------
-- Table proposta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS proposta (
  id_proposta INTEGER NOT NULL,
  tema TEXT(100) NULL,
  descricao TEXT NULL,
  tags TEXT(100) NULL,
  id_membro INTEGER NOT NULL,
  id_conferencia INTEGER NOT NULL,
  data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_proposta, id_membro),
    FOREIGN KEY (id_membro)
    REFERENCES membro (id_membro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
    FOREIGN KEY (id_conferencia)
    REFERENCES conferencia (id_conferencia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

create INDEX fk_proposta_membro1_idx on proposta (id_membro );
create  INDEX fk_proposta_conferencia1_idx on proposta(id_conferencia );

  
-- -----------------------------------------------------
-- Table pagina
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pagina (
  id_pagina INTEGER PRIMARY KEY AUTOINCREMENT,
  titulo TEXT(100) NULL,
  link_icon TEXT(300) NULL,
  e_index INTEGER(1) NULL DEFAULT 0,
  activo TEXT  NOT NULL  DEFAULT 'sim' CHECK(activo in('sim','nao')),
  meu_link TEXT(100) NULL,
  meu_template_html TEXT(100) NULL
  )
;

create  INDEX id_pagina_UNIQUE on pagina(id_pagina );
-- -----------------------------------------------------
-- Table menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS menu (
  id_menu INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT(100) NULL,
  link TEXT(100) NULL,
  template_html TEXT(100) NULL,
  activo TEXT CHECK(activo in ('sim', 'nao')) NULL DEFAULT 'sim'
)
;

create INDEX id_menu_UNIQUE on menu(id_menu );

-- -----------------------------------------------------
-- Table submenu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS submenu (
  id_submenu INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT(100) NULL,
  link TEXT(100) NULL,
  activo TEXT CHECK(activo in ('sim', 'nao')) NULL DEFAULT 'sim',
  template_html TEXT(100) NULL
  )
;

create INDEX id_submenu_UNIQUE on submenu (id_submenu );
-- -----------------------------------------------------
-- Table conteudo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS conteudo (
  id_conteudo INTEGER PRIMARY KEY AUTOINCREMENT,
  titulo TEXT(300) NULL,
  subtiulo TEXT(300) NULL,
  trecho TEXT NULL,
  conteudo TEXT NULL)
;

create INDEX id_conteudo_UNIQUE on conteudo (id_conteudo );

-- -----------------------------------------------------
-- Table pagina_conteudo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pagina_conteudo (
  id_pagina INTEGER NOT NULL,
  id_conteudo INTEGER NOT NULL,
  ordem INTEGER NOT NULL,
  posicao TEXT CHECK(posicao in('esquerda', 'centro', 'diraita')) NOT NULL DEFAULT 'centro',
  PRIMARY KEY (id_pagina, id_conteudo, ordem, posicao),
  
    FOREIGN KEY (id_pagina)
    REFERENCES pagina (id_pagina)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
 
    FOREIGN KEY (id_conteudo)
    REFERENCES conteudo (id_conteudo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

create INDEX fk_pagina_has_conteudo_conteudo1_idx on pagina_conteudo(id_conteudo );
create  INDEX fk_pagina_has_conteudo_pagina1_idx on pagina_conteudo(id_pagina );


-- -----------------------------------------------------
-- Table pagina_menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pagina_menu (
  id_pagina INTEGER NOT NULL,
  id_menu INTEGER NOT NULL,
  posicao TEXT CHECK(posicao in('esquerda', 'centro', 'direito')) NOT NULL DEFAULT 'centro',
  ordem INTEGER NOT NULL,
  PRIMARY KEY (id_pagina, id_menu, posicao, ordem),
  
    FOREIGN KEY (id_pagina)
    REFERENCES pagina (id_pagina)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
    FOREIGN KEY (id_menu)
    REFERENCES menu (id_menu)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
create INDEX fk_pagina_has_menu_menu1_idx on pagina_menu (id_menu );
create INDEX fk_pagina_has_menu_pagina1_idx on pagina_menu (id_pagina );


-- -----------------------------------------------------
-- Table menu_submenu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS menu_submenu (
  id_menu INTEGER NOT NULL,
  id_submenu INTEGER NOT NULL,
  ordem INTEGER NOT NULL,
  posicao TEXT CHECK(posicao  in('esquerda', 'centro', 'direita')) NOT NULL DEFAULT 'centro',
  PRIMARY KEY (id_menu, id_submenu, ordem, posicao),
  
    FOREIGN KEY (id_menu)
    REFERENCES menu (id_menu)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
    FOREIGN KEY (id_submenu)
    REFERENCES submenu (id_submenu)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

create INDEX fk_menu_has_submenu_submenu1_idx on menu_submenu(id_submenu );
create INDEX fk_menu_has_submenu_menu1_idx on menu_submenu(id_menu );
