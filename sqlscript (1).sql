REM   Script: Projeto integrado
REM   Banco de dados do site de compras de passagens e  hospedagens  

CREATE TABLE avioes (  
    id       INTEGER        NOT NULL,  
    placa    VARCHAR2 (6)   NOT NULL,  
    empresa  VARCHAR2 (24)  NOT NULL,  
    modelo   VARCHAR2 (24) NOT NULL,  
    n_voo    INTEGER        NOT NULL  
) 
;

ALTER TABLE avioes ADD CONSTRAINT avioes_pk PRIMARY KEY ( id );

ALTER TABLE avioes ADD CONSTRAINT avioes__un UNIQUE ( placa );

CREATE TABLE enderecos (  
    id                 INTEGER        NOT NULL,  
    cep                VARCHAR2 (24)  NOT NULL,  
    cidade             VARCHAR2 (24)  NOT NULL,  
    rua                VARCHAR2 (24)  NOT NULL,  
    country            VARCHAR2 (24)  NOT NULL,  
    n_estabelecimento  INTEGER        NOT NULL,  
    bairro             VARCHAR2 (24)  NOT NULL,  
     localizacoes_id    INTEGER        NOT NULL   
      
);

ALTER TABLE enderecos ADD CONSTRAINT enderecos_pk PRIMARY KEY ( id );

ALTER TABLE enderecos ADD CONSTRAINT enderecos__un UNIQUE ( cep );

CREATE TABLE localizacoes ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (24)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacoes             VARCHAR2 (6)              , 
    enderecos_id           INTEGER           NOT NULL 
);

ALTER TABLE localizacoes ADD CONSTRAINT localizacoes_pk PRIMARY KEY ( id );

ALTER TABLE localizacoes ADD CONSTRAINT localizacao__un UNIQUE ( cnpj );

CREATE TABLE passagens (  
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
    avioes_id           INTEGER         NOT NULL,  
    usuarios_id         INTEGER         NOT NULL  
) 
 
;

ALTER TABLE passagens ADD CONSTRAINT passagens_pk PRIMARY KEY ( id ) 
;

ALTER TABLE passagens ADD CONSTRAINT passagens__un UNIQUE ( n_voo );

CREATE TABLE usuarios (  
    id               INTEGER        NOT NULL,  
    email            VARCHAR2 (26)  NOT NULL,  
    cpf              VARCHAR2 (16)  NOT NULL,  
    nome             VARCHAR2 (24)  NOT NULL,  
    sobrenome        VARCHAR2 (36)  NOT NULL,  
    data_nascimento  VARCHAR2 (6)   NOT NULL,  
    senha            VARCHAR2 (12)  NOT NULL  
) 
;

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id ) 
;

ALTER TABLE usuarios ADD CONSTRAINT usuarios__un UNIQUE ( cpf,  
                                                       email ) 
;

CREATE TABLE avioes (  
    id       INTEGER        NOT NULL,  
    placa    VARCHAR2 (6)   NOT NULL,  
    empresa  VARCHAR2 (24)  NOT NULL,  
    modelo   VARCHAR2 (24) NOT NULL,  
    n_voo    INTEGER        NOT NULL  
) 
;

ALTER TABLE avioes ADD CONSTRAINT avioes_pk PRIMARY KEY ( id ) 
;

ALTER TABLE avioes ADD CONSTRAINT avioes__un UNIQUE ( placa ) 
;

CREATE TABLE enderecos (  
    id                 INTEGER        NOT NULL,  
    cep                VARCHAR2 (24)  NOT NULL,  
    cidade             VARCHAR2 (24)  NOT NULL,  
    rua                VARCHAR2 (24)  NOT NULL,  
    country            VARCHAR2 (24)  NOT NULL,  
    n_estabelecimento  INTEGER        NOT NULL,  
    bairro             VARCHAR2 (24)  NOT NULL,  
     localizacoes_id    INTEGER        NOT NULL   
      
) 
;

ALTER TABLE enderecos ADD CONSTRAINT enderecos_pk PRIMARY KEY ( id );

ALTER TABLE enderecos ADD CONSTRAINT enderecos__un UNIQUE ( cep );

CREATE TABLE hospedagens (  
    id              INTEGER         NOT NULL,  
    n_quarto        INTEGER         NOT NULL,  
    categoria       VARCHAR2 (12)   NOT NULL,  
    checkin         VARCHAR2 (12)   NOT NULL,  
    checkout        VARCHAR2 (12)   NOT NULL,  
    usuarios_id      INTEGER         NOT NULL,  
    localizacoes_id  INTEGER         NOT NULL  
      
);

ALTER TABLE hospedagens ADD CONSTRAINT hospedagens_pk PRIMARY KEY ( id );

ALTER TABLE hospedagens ADD CONSTRAINT hospedagens__un UNIQUE ( n_quarto );

CREATE TABLE localizacoes ( 
    id                    INTEGER           NOT NULL, 
    cnpj                  VARCHAR2 (24)     NOT NULL, 
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL, 
    tipo                  VARCHAR2 (12)     NOT NULL, 
    telefone              VARCHAR2 (12)     NOT NULL, 
    n_quarto              INTEGER           NOT NULL, 
    avaliacoes             VARCHAR2 (6)              , 
    enderecos_id           INTEGER           NOT NULL 
);

ALTER TABLE localizacoes ADD CONSTRAINT localizacoes_pk PRIMARY KEY ( id );

ALTER TABLE localizacoes ADD CONSTRAINT localizacoes__un UNIQUE ( cnpj );

CREATE TABLE passagens (  
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
    avioes_id            INTEGER         NOT NULL,  
    usuarios_id          INTEGER         NOT NULL  
);

ALTER TABLE passagens ADD CONSTRAINT passagens_pk PRIMARY KEY ( id );

ALTER TABLE passagens ADD CONSTRAINT passagens__un UNIQUE ( n_voo );

CREATE TABLE usuarios (  
    id               INTEGER        NOT NULL,  
    email            VARCHAR2 (26)  NOT NULL,  
    cpf              VARCHAR2 (16)  NOT NULL,  
    nome             VARCHAR2 (24)  NOT NULL,  
    sobrenome        VARCHAR2 (36)  NOT NULL,  
    data_nascimento  VARCHAR2 (6)   NOT NULL,  
    senha            VARCHAR2 (12)  NOT NULL  
);

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id );

ALTER TABLE usuarios ADD CONSTRAINT usuarios__un UNIQUE ( cpf,  
                                                       email );

ALTER TABLE hospedagens 
    ADD CONSTRAINT hospedagens_localizacoes_fk FOREIGN KEY ( localizacoes_id ) 
        REFERENCES localizacoes ( id );

ALTER TABLE hospedagens  
    ADD CONSTRAINT hospedagens_usuarios_fk FOREIGN KEY ( usuarios_id )  
        REFERENCES usuarios ( id );

ALTER TABLE localizacoes 
    ADD CONSTRAINT localizacoes_enderecos_fk FOREIGN KEY ( enderecos_id ) 
        REFERENCES enderecoes ( id );

ALTER TABLE passagens 
    ADD CONSTRAINT passagens_aviao_fk FOREIGN KEY ( avioes_id ) 
        REFERENCES avioes ( id );

ALTER TABLE passagens 
    ADD CONSTRAINT passagens_usuarios_fk FOREIGN KEY ( usuarios_id ) 
        REFERENCES usuarios ( id );

ALTER TABLE passagens 
    ADD CONSTRAINT passagens_avioes_fk FOREIGN KEY ( avioes_id ) 
        REFERENCES avioes ( id );

