-- ============================================================
--  IPEM_Control — Script de criação do banco de dados
--  CORRIGIDO: km_atual era INT UNSIGNED mas entidade Java usa BigDecimal → DECIMAL(10,2)
-- ============================================================

CREATE DATABASE IF NOT EXISTS IPEM_Control
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

SET NAMES utf8mb4;
SET time_zone = '-03:00';

USE IPEM_Control;

-- ------------------------------------------------------------
--  1. VEICULO
-- ------------------------------------------------------------
CREATE TABLE veiculo (
  id_veiculo            INT             NOT NULL AUTO_INCREMENT,
  disponivel            BOOLEAN         NOT NULL DEFAULT TRUE,
  prefixo               VARCHAR(20)     NOT NULL,
  nucleo_dar            VARCHAR(100)    NOT NULL,
  placa                 VARCHAR(10)     NOT NULL UNIQUE,
  numero_fl             VARCHAR(30)     NULL,
  modelo                VARCHAR(60)     NOT NULL,
  marca                 VARCHAR(60)     NOT NULL,
  ano                   YEAR            NOT NULL,
  tipo_combustivel      ENUM(
                          'gasolina',
                          'etanol',
                          'flex',
                          'diesel',
                          'gnv',
                          'eletrico',
                          'hibrido'
                        )               NOT NULL,
  habilitacao_categoria VARCHAR(10)     NOT NULL
                          COMMENT 'B, C, D, E',
  -- CORRIGIDO: era INT UNSIGNED, mas Veiculo.java usa BigDecimal → DECIMAL(10,2)
  km_atual              DECIMAL(10,2)   NOT NULL DEFAULT 0.00,
  created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
                                        ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT pk_veiculo PRIMARY KEY (id_veiculo)
) ENGINE=InnoDB;


-- ------------------------------------------------------------
--  2. USUARIO
-- ------------------------------------------------------------
CREATE TABLE usuario (
  matricula             INT             NOT NULL AUTO_INCREMENT,
  cpf                   VARCHAR(11)     NOT NULL UNIQUE
                          COMMENT 'Somente dígitos, sem formatação',
  numero_habilitacao    VARCHAR(20)     NULL UNIQUE,
  nome                  VARCHAR(120)    NOT NULL,
  data_nascimento       DATE            NOT NULL,
  email                 VARCHAR(150)    NOT NULL UNIQUE,
  senha                 VARCHAR(255)    NOT NULL
                          COMMENT 'Hash bcrypt — nunca texto plano',
  tipo_usuario          ENUM('adm','tecnico') NOT NULL DEFAULT 'tecnico',
  cargo                 VARCHAR(80)     NULL,
  colaborador_ativo     BOOLEAN         NOT NULL DEFAULT TRUE,
  tipo_habilitacao      ENUM('B','C','D','E','AB','AC','AD','AE') NULL,
  created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
                                        ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT pk_usuario PRIMARY KEY (matricula)
) ENGINE=InnoDB;


-- ------------------------------------------------------------
--  3. TIPO_SERVICO
-- ------------------------------------------------------------
CREATE TABLE tipo_servico (
  id_tipo_servico       INT             NOT NULL AUTO_INCREMENT,
  nome_servico          VARCHAR(100)    NOT NULL UNIQUE,
  descricao             TEXT            NULL,

  CONSTRAINT pk_tipo_servico PRIMARY KEY (id_tipo_servico)
) ENGINE=InnoDB COMMENT='Catálogo de tipos de serviço disponíveis';


-- ------------------------------------------------------------
--  4. VEICULO_SERVICO
-- ------------------------------------------------------------
CREATE TABLE veiculo_servico (
  id_servico_veiculo    INT             NOT NULL AUTO_INCREMENT,
  habilitado            BOOLEAN         NOT NULL DEFAULT TRUE,
  descricao             TEXT            NULL,
  id_veiculo            INT             NOT NULL,
  id_tipo_servico       INT             NOT NULL,
  created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
                                        ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT pk_veiculo_servico  PRIMARY KEY (id_servico_veiculo),
  CONSTRAINT uq_veiculo_tipo     UNIQUE      (id_veiculo, id_tipo_servico),
  CONSTRAINT fk_vs_veiculo       FOREIGN KEY (id_veiculo)
    REFERENCES veiculo (id_veiculo) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_vs_tipo_servico  FOREIGN KEY (id_tipo_servico)
    REFERENCES tipo_servico (id_tipo_servico) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Serviços habilitados por veículo';


-- ------------------------------------------------------------
--  5. REGISTRO_SAIDA
-- ------------------------------------------------------------
CREATE TABLE registro_saida (
  id_saida              INT             NOT NULL AUTO_INCREMENT,
  local_destino         VARCHAR(200)    NOT NULL,
  id_tipo_servico       INT             NOT NULL,
  status                ENUM('em_andamento','concluido') NOT NULL DEFAULT 'em_andamento',
  observacoes           TEXT            NULL,
  data_hora_saida       DATETIME        NOT NULL,
  data_retorno          DATETIME        NULL,
  km_inicial            DECIMAL(10,2)   NOT NULL,
  km_final              DECIMAL(10,2)   NULL,
  km_rodados            DECIMAL(10,2)   NULL,
  id_veiculo            INT             NOT NULL,
  matricula_usuario     INT             NOT NULL,
  created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
                                        ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT pk_registro_saida   PRIMARY KEY (id_saida),
  CONSTRAINT chk_km_ordem        CHECK (km_final IS NULL OR km_final >= km_inicial),
  CONSTRAINT chk_data_retorno    CHECK (data_retorno IS NULL OR data_retorno >= data_hora_saida),
  CONSTRAINT fk_rs_veiculo       FOREIGN KEY (id_veiculo)
    REFERENCES veiculo (id_veiculo) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_rs_usuario       FOREIGN KEY (matricula_usuario)
    REFERENCES usuario (matricula) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_rs_tipo_servico  FOREIGN KEY (id_tipo_servico)
    REFERENCES tipo_servico (id_tipo_servico) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Registros de saída de veículos';


-- ------------------------------------------------------------
--  6. TROCA_OLEO
-- ------------------------------------------------------------
CREATE TABLE troca_oleo (
  id_troca_oleo         INT             NOT NULL AUTO_INCREMENT,
  km_troca              DECIMAL(10,2)   NOT NULL,
  km_proxima_troca      DECIMAL(10,2)   NOT NULL,
  id_saida              INT             NOT NULL,
  created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
                                        ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT pk_troca_oleo        PRIMARY KEY (id_troca_oleo),
  CONSTRAINT chk_proxima_troca    CHECK (km_proxima_troca > km_troca),
  CONSTRAINT fk_to_registro_saida FOREIGN KEY (id_saida)
    REFERENCES registro_saida (id_saida) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Registros de troca de óleo por saída';


-- ------------------------------------------------------------
--  7. ABASTECIMENTO
-- ------------------------------------------------------------
CREATE TABLE abastecimento (
  id_abastecimento      INT             NOT NULL AUTO_INCREMENT,
  nota_fiscal           VARCHAR(100)    NULL,
  foto                  VARCHAR(500)    NULL
                          COMMENT 'Caminho ou base64 da imagem da NF',
  -- CORRIGIDO: nome da coluna era abast_tipo_combustivel no SQL original;
  -- mas Abastecimento.java mapeia @Column(name = "tipo_combustivel")
  -- Padronizado para tipo_combustivel para bater com a entidade
  tipo_combustivel      ENUM(
                          'gasolina',
                          'etanol',
                          'flex',
                          'diesel',
                          'gnv',
                          'eletrico',
                          'hibrido'
                        )               NOT NULL,
  data_hora             DATETIME        NOT NULL,
  km_abastecimento      DECIMAL(10,2)   NOT NULL,
  quantidade_litros     DECIMAL(8,3)    NOT NULL,
  valor_total           DECIMAL(10,2)   NOT NULL,
  posto_nome            VARCHAR(150)    NULL,
  posto_cidade          VARCHAR(150)    NULL,
  id_saida              INT             NOT NULL,
  created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
                                        ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT pk_abastecimento     PRIMARY KEY (id_abastecimento),
  CONSTRAINT chk_litros_positivos CHECK (quantidade_litros > 0),
  CONSTRAINT chk_valor_positivo   CHECK (valor_total > 0),
  CONSTRAINT fk_ab_registro_saida FOREIGN KEY (id_saida)
    REFERENCES registro_saida (id_saida) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Abastecimentos realizados durante saídas';


-- ------------------------------------------------------------
--  8. DOCUMENTO
-- ------------------------------------------------------------
CREATE TABLE documento (
  id_documento          INT             NOT NULL AUTO_INCREMENT,
  nome_arquivo          VARCHAR(255)    NOT NULL,
  caminho               VARCHAR(500)    NULL,
  id_saida              INT             NOT NULL,
  created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
                                        ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT pk_documento          PRIMARY KEY (id_documento),
  CONSTRAINT fk_doc_registro_saida FOREIGN KEY (id_saida)
    REFERENCES registro_saida (id_saida) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Documentos anexados a registros de saída';


-- ------------------------------------------------------------
--  9. USUARIO_DOCUMENTO
-- ------------------------------------------------------------
CREATE TABLE usuario_documento (
  id_usuario_doc        INT             NOT NULL AUTO_INCREMENT,
  data_acesso           DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  baixado               BOOLEAN         NOT NULL DEFAULT FALSE,
  lido                  BOOLEAN         NOT NULL DEFAULT FALSE,
  matricula             INT             NOT NULL,
  id_documento          INT             NOT NULL,

  CONSTRAINT pk_usuario_documento PRIMARY KEY (id_usuario_doc),
  CONSTRAINT uq_usuario_doc       UNIQUE      (matricula, id_documento),
  CONSTRAINT fk_ud_usuario        FOREIGN KEY (matricula)
    REFERENCES usuario (matricula) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_ud_documento      FOREIGN KEY (id_documento)
    REFERENCES documento (id_documento) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Controle de acesso de usuários a documentos';


-- ============================================================
--  ÍNDICES DE PERFORMANCE
-- ============================================================
CREATE INDEX idx_rs_status          ON registro_saida (status);
CREATE INDEX idx_rs_datas           ON registro_saida (data_hora_saida, data_retorno);
CREATE INDEX idx_rs_veiculo         ON registro_saida (id_veiculo);
CREATE INDEX idx_rs_usuario         ON registro_saida (matricula_usuario);
CREATE INDEX idx_rs_veiculo_data    ON registro_saida (id_veiculo, data_hora_saida);
CREATE INDEX idx_saida_veiculo_status ON registro_saida (id_veiculo, status);

CREATE INDEX idx_vs_habilitado      ON veiculo_servico (habilitado);
CREATE INDEX idx_vs_veiculo         ON veiculo_servico (id_veiculo);

CREATE INDEX idx_usr_ativo          ON usuario (colaborador_ativo);
CREATE INDEX idx_usr_tipo           ON usuario (tipo_usuario);

CREATE INDEX idx_ab_data            ON abastecimento (data_hora);
CREATE INDEX idx_ab_saida           ON abastecimento (id_saida);
CREATE INDEX idx_ab_saida_data      ON abastecimento (id_saida, data_hora);


-- ============================================================
--  TRIGGERS — impede duas saídas ativas para o mesmo veículo
-- ============================================================
DELIMITER $$

CREATE TRIGGER trg_verifica_saida_ativa_insert
BEFORE INSERT ON registro_saida
FOR EACH ROW
BEGIN
  IF NEW.data_retorno IS NULL AND EXISTS (
    SELECT 1 FROM registro_saida
    WHERE id_veiculo = NEW.id_veiculo AND data_retorno IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Este veículo já possui uma saída em andamento (sem retorno)';
  END IF;
END$$

CREATE TRIGGER trg_verifica_saida_ativa_update
BEFORE UPDATE ON registro_saida
FOR EACH ROW
BEGIN
  IF NEW.data_retorno IS NULL AND EXISTS (
    SELECT 1 FROM registro_saida
    WHERE id_veiculo = NEW.id_veiculo
      AND data_retorno IS NULL
      AND id_saida <> NEW.id_saida
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Este veículo já possui uma saída em andamento (sem retorno)';
  END IF;
END$$

DELIMITER ;