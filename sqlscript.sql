REM   Script: Projeto integrado
REM   projeto integrado - app de compras de passagem e hospedagem 

CREATE TABLE aviao ( 
    id       INTEGER        NOT NULL, 
    placa    VARCHAR2 (6)   NOT NULL, 
    empresa  VARCHAR2 (24)  NOT NULL, 
    modelo   VARCHAR2 (24) NOT NULL, 
    n_voo    INTEGER        NOT NULL 
);

ALTER TABLE aviao ADD CONSTRAINT aviao_pk PRIMARY KEY ( id );

ALTER TABLE aviao ADD CONSTRAINT aviao__un UNIQUE ( placa );

ALTER TABLE aviao ADD CONSTRAINT aviao_pk PRIMARY KEY ( id );

ALTER TABLE aviao ADD CONSTRAINT aviao__un UNIQUE ( placa );

CREATE TABLE endereco ( 
    id                 INTEGER      NOT NULL, 
    cep                VARCHAR2(12) NOT NULL, 
    cidade             VARCHAR2(24) NOT NULL, 
    rua                VARCHAR2     NOT NULL, 
    country            VARCHAR2     NOT NULL, 
    n_estabelecimento  INTEGER      NOT NULL, 
    bairro             VARCHAR2(24) NOT NULL, 
    localizacao_id     INTEGER      NOT NULL 
);

CREATE TABLE endereco ( 
    id                 INTEGER      NOT NULL, 
    cep                VARCHAR2(12) NOT NULL, 
    cidade             VARCHAR2(24) NOT NULL, 
    rua                VARCHAR2     NOT NULL, 
    country            VARCHAR2     NOT NULL, 
    n_estabelecimento  INTEGER      NOT NULL, 
    bairro             VARCHAR2(24) NOT NULL, 
    localizacao_id     INTEGER      NOT NULL, 
);

CREATE TABLE endereco ( 
    id                 INTEGER      NOT NULL, 
    cep                VARCHAR2(12) NOT NULL, 
    cidade             VARCHAR2(24) NOT NULL, 
    rua                VARCHAR2     NOT NULL, 
    country            VARCHAR2     NOT NULL, 
    n_estabelecimento  INTEGER      NOT NULL, 
    bairro             VARCHAR2(24) NOT NULL, 
    localizacao_id     INTEGER      NOT NULL, 
);

CREATE TABLE endereco ( 
    id                 INTEGER      NOT NULL, 
    cep                VARCHAR2(12) NOT NULL, 
    cidade             VARCHAR2(24) NOT NULL, 
    rua                VARCHAR2     NOT NULL, 
    country            VARCHAR2     NOT NULL, 
    n_estabelecimento  INTEGER      NOT NULL, 
    bairro             VARCHAR2(24) NOT NULL, 
    localizacao_id     INTEGER      NOT NULL, 
);

CREATE TABLE endereco ( 
    id                 INTEGER      NOT NULL, 
    cep                VARCHAR2(12) NOT NULL, 
    cidade             VARCHAR2(24) NOT NULL, 
    rua                VARCHAR2     NOT NULL, 
    country            VARCHAR2     NOT NULL, 
    n_estabelecimento  INTEGER      NOT NULL, 
    bairro             VARCHAR2(24) NOT NULL, 
    localizacao_id     INTEGER      NOT NULL 
);

CREATE TABLE endereco( 
    id                 INTEGER      NOT NULL, 
    cep                VARCHAR2(12) NOT NULL, 
    cidade             VARCHAR2(24) NOT NULL, 
    rua                VARCHAR2     NOT NULL, 
    country            VARCHAR2     NOT NULL, 
    n_estabelecimento  INTEGER      NOT NULL, 
    bairro             VARCHAR2(24) NOT NULL, 
    localizacao_id     INTEGER      NOT NULL 
);

ALTER TABLE hospedagem ADD CONSTRAINT hospedagem_pk PRIMARY KEY ( id );

ALTER TABLE hospedagem ADD CONSTRAINT hospedagem__un UNIQUE ( n_quarto );

CREATE TABLE hospedagem ( 
    id              INTEGER NOT NULL, 
    n_quarto        INTEGER NOT NULL, 
    categoria       VARCHAR2  
--  ERROR: VARCHAR2 size not specified  
     NOT NULL, 
    checkin         VARCHAR2  
--  ERROR: VARCHAR2 size not specified  
     NOT NULL, 
    checkout        VARCHAR2  
--  ERROR: VARCHAR2 size not specified  
     NOT NULL, 
    usuario_id      INTEGER NOT NULL, 
    localizacao_id  INTEGER NOT NULL 
);

CREATE TABLE endereco ( 
    id                 INTEGER        NOT NULL, 
    cep                VARCHAR2 (24)  NOT NULL, 
    cidade             VARCHAR2 (24)  NOT NULL, 
    rua                VARCHAR2 (24)  NOT NULL, 
    country            VARCHAR2 (24)  NOT NULL, 
    n_estabelecimento  INTEGER        NOT NULL, 
    bairro             VARCHAR2 (24)  NOT NULL, 
     localizacao_id    INTEGER        NOT NULL  
     
);

ALTER TABLE endereco ADD CONSTRAINT endereco_pk PRIMARY KEY ( id );

ALTER TABLE endereco ADD CONSTRAINT endereco__un UNIQUE ( cep );

CREATE TABLE hospedagem ( 
    id              INTEGER         NOT NULL, 
    n_quarto        INTEGER         NOT NULL, 
    categoria       VARCHAR2 (12)   NOT NULL, 
    checkin         VARCHAR2 (12)   NOT NULL, 
    checkout        VARCHAR2 (12)   NOT NULL, 
    usuario_id      INTEGER         NOT NULL, 
    localizacao_id  INTEGER         NOT NULL 
     
);

ALTER TABLE localizacao ADD CONSTRAINT localizacao_pk PRIMARY KEY ( id );

ALTER TABLE localizacao ADD CONSTRAINT localizacao__un UNIQUE ( cnpj );

CREATE TABLE passagem ( 
    id                  INTEGER         NOT NULL, 
    n_voo               INTEGER         NOT NULL, 
    preco               VARCHAR2(12)    NOT NULL, 
    poltrona            VARCHAR2(6)     NOT NULL, 
    categoria_poltrona  VARCHAR2(12)    NOT NULL, 
    empresa             VARCHAR2 (24)   NOT NULL, 
    origem              VARCHAR2(24)    NOT NULL, 
    destino             VARCHAR2 (24)   NOT NULL, 
    aeropoorto          VARCHAR2(24)    NOT NULL, 
    horario             DATE            NOT NULL, 
    data                DATE            NOT NULL, 
    aviao_id            INTEGER         NOT NULL, 
    usuario_id          INTEGER         NOT NULL 
);

ALTER TABLE passagem ADD CONSTRAINT passagem_pk PRIMARY KEY ( id );

ALTER TABLE passagem ADD CONSTRAINT passagem__un UNIQUE ( n_voo );

CREATE TABLE usuario ( 
    id               INTEGER        NOT NULL, 
    email            VARCHAR2 (26)  NOT NULL, 
    cpf              VARCHAR2 (16)  NOT NULL, 
    nome             VARCHAR2 (24)  NOT NULL, 
    sobrenome        VARCHAR2 (36)  NOT NULL, 
    data_nascimento  VARCHAR2 (6)   NOT NULL, 
    senha            VARCHAR2 (12)  NOT NULL 
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id );

ALTER TABLE usuario ADD CONSTRAINT usuario__un UNIQUE ( cpf, 
                                                       email );

ALTER TABLE hospedagem 
    ADD CONSTRAINT hospedagem_localizacao_fk FOREIGN KEY ( localizacao_id ) 
        REFERENCES localizacao ( id );

ALTER TABLE hospedagem 
    ADD CONSTRAINT hospedagem_usuario_fk FOREIGN KEY ( usuario_id ) 
        REFERENCES usuario ( id );

ALTER TABLE localizacao 
    ADD CONSTRAINT localizacao_endereco_fk FOREIGN KEY ( endereco_id ) 
        REFERENCES endereco ( id );

ALTER TABLE passagem 
    ADD CONSTRAINT passagem_aviao_fk FOREIGN KEY ( aviao_id ) 
        REFERENCES aviao ( id );

ALTER TABLE passagem 
    ADD CONSTRAINT passagem_usuario_fk FOREIGN KEY ( usuario_id ) 
        REFERENCES usuario ( id );

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2, 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2              , 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2              , 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2              , 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2              , 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2              , 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2              , 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER       NOT NULL, 
    cnpj                  VARCHAR2 (24) NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24) NOT NULL, 
    tipo                  VARCHAR2 (12) NOT NULL, 
    telefone              VARCHAR2 (24) NOT NULL, 
    n_quarto              INTEGER       NOT NULL, 
    avaliacao             VARCHAR2              , 
    endereco_id           INTEGER       NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2          NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2, 
    endereco_id           INTEGER           NOT NULL 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2          NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2                  , 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2          NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2                  , 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2          NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2                  , 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)          NULL, 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)          , 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)          NULL, 
   
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)         , 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)         NULL, 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)         NULL, 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)         NULL, 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacao             VARCHAR2 (6)         NULL, 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (12)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    
    avaliacao             VARCHAR2 (6)         NULL, 
    endereco_id           INTEGER           NOT NULL, 
);

CREATE TABLE localizacao (
    id                    INTEGER           NOT NULL,
    cnpj                  VARCHAR2 (24)     NOT NULL,
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL,
    tipo                  VARCHAR2 (12)     NOT NULL,
    telefone              VARCHAR2 (12)     NOT NULL,
    n_quarto              INTEGER           NOT NULL,
    avaliacao             VARCHAR2 (6)              ,
    endereco_id           INTEGER           NOT NULL
);;

