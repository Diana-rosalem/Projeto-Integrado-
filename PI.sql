REM   Script: Projeto Integrado- banco de dados
REM   Grupo: Aline Amy Kato, Diana Poltronieri Roslém, Lucas Souza Pegoretti, Pedro Henrique Alcântara Ramos.
DESCRIÇÃO:O projeto em questão, trata-se de uma aplicação Mobile/Web de reservas de pacotes de viagem. O usuário poderá, através da aplicação, comprar passagens de avião e reservar hotéis, pousadas ou Resorts para qualquer lugar do mundo. 

CREATE TABLE avioes (   
    id       INTEGER        NOT NULL,   
    placa    VARCHAR2 (6)   NOT NULL,   
    empresa  VARCHAR2 (32)  NOT NULL,   
    modelo   VARCHAR2 (32) NOT NULL,   
    n_voo    INTEGER        NOT NULL   
) ;

ALTER TABLE avioes ADD CONSTRAINT avioes_pk PRIMARY KEY ( id );

ALTER TABLE avioes ADD CONSTRAINT avioes__un UNIQUE ( placa );

CREATE TABLE enderecos (   
    id                 INTEGER        NOT NULL,   
    cep                VARCHAR2 (32)  NOT NULL,   
    cidade             VARCHAR2 (32)  NOT NULL,   
    rua                VARCHAR2 (32)  NOT NULL,   
    country            VARCHAR2 (32)  NOT NULL,   
    n_estabelecimento  INTEGER        NOT NULL,   
    bairro             VARCHAR2 (32)  NOT NULL,   
    localizacoes_id    INTEGER        NOT NULL    
       
);

ALTER TABLE enderecos ADD CONSTRAINT enderecos_pk PRIMARY KEY ( id );

ALTER TABLE enderecos ADD CONSTRAINT enderecos__un UNIQUE ( cep );

CREATE TABLE localizacoes (  
    id                    INTEGER           NOT NULL,  
    cnpj                  VARCHAR2 (24)     NOT NULL,  
    nome_estabelecimento  VARCHAR2 (24)     NOT NULL,  
    tipo                  VARCHAR2 (24)     NOT NULL,  
    telefone              VARCHAR2 (24)     NOT NULL,  
    n_quarto              INTEGER           NOT NULL,  
    avaliacoes             VARCHAR2 (12)              ,  
    enderecos_id           INTEGER           NOT NULL  
);

ALTER TABLE localizacoes ADD CONSTRAINT localizacoes_pk PRIMARY KEY ( id );

ALTER TABLE localizacoes ADD CONSTRAINT localizacao__un UNIQUE ( cnpj );

CREATE TABLE passagens (   
    id                  INTEGER         NOT NULL,   
    n_voo               INTEGER         NOT NULL,   
    preco               VARCHAR2(24)    NOT NULL,   
    poltrona            VARCHAR2(12)     NOT NULL,   
    categoria_poltrona  VARCHAR2(24)    NOT NULL,   
    empresa             VARCHAR2 (36)   NOT NULL,   
    origem              VARCHAR2(36)    NOT NULL,   
    destino             VARCHAR2 (36)   NOT NULL,   
    aeropoorto          VARCHAR2(36)    NOT NULL,   
    horario             DATE            NOT NULL,   
    data                DATE            NOT NULL,   
    avioes_id           INTEGER         NOT NULL,   
    usuarios_id         INTEGER         NOT NULL   
) ;

ALTER TABLE passagens ADD CONSTRAINT passagens_pk PRIMARY KEY ( id );

ALTER TABLE passagens ADD CONSTRAINT passagens__un UNIQUE ( n_voo );

CREATE TABLE usuarios (   
    id               INTEGER        NOT NULL,   
    email            VARCHAR2 (36)  NOT NULL,   
    cpf              VARCHAR2 (26)  NOT NULL,   
    nome             VARCHAR2 (36)  NOT NULL,   
    sobrenome        VARCHAR2 (36)  NOT NULL,   
    data_nascimento  VARCHAR2 (24)   NOT NULL,   
    senha            VARCHAR2 (36)  NOT NULL   
) ;

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id );

ALTER TABLE usuarios ADD CONSTRAINT usuarios__un UNIQUE ( cpf,   
                                                       email ) ;

CREATE TABLE hospedagens (   
    id              INTEGER         NOT NULL,   
    n_quarto        INTEGER         NOT NULL,   
    categoria       VARCHAR2 (24)   NOT NULL,   
    checkin         VARCHAR2 (36)   NOT NULL,   
    checkout        VARCHAR2 (36)   NOT NULL,   
    usuarios_id      INTEGER         NOT NULL,   
    localizacoes_id  INTEGER         NOT NULL   
       
);

ALTER TABLE hospedagens ADD CONSTRAINT hospedagens_pk PRIMARY KEY ( id );

ALTER TABLE hospedagens ADD CONSTRAINT hospedagens__un UNIQUE ( n_quarto );

ALTER TABLE hospedagens  
    ADD CONSTRAINT hospedagens_localizacoes_fk FOREIGN KEY ( localizacoes_id )  
        REFERENCES localizacoes ( id );

ALTER TABLE hospedagens   
    ADD CONSTRAINT hospedagens_usuarios_fk FOREIGN KEY ( usuarios_id )   
        REFERENCES usuarios ( id );

ALTER TABLE localizacoes  
    ADD CONSTRAINT localizacoes_enderecos_fk FOREIGN KEY ( enderecos_id )  
        REFERENCES enderecos ( id );

ALTER TABLE passagens  
    ADD CONSTRAINT passagens_usuarios_fk FOREIGN KEY ( usuarios_id )  
        REFERENCES usuarios ( id );

ALTER TABLE passagens  
    ADD CONSTRAINT passagens_aviao_fk FOREIGN KEY ( avioes_id )  
        REFERENCES avioes ( id ) ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(01,'eduardaanamonteiro-86@destaco.com','316.059.487-48','Eduarda','Ana Monteiro','16/06/1943','OBrkLZktUE') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(02,'henrymarcosdasneves@mindesign.com','444.652.787-80','Henry','Marcos das Neves','09/03/1995','SeKx7mad0I') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(03,'nathanthomaspe_@nipnet.com.br','494.380.587-61','Nathan','Thomas Pedro Figueiredo','03/12/1951','rZtLXMiORF') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(04,'ddaianeflaviaisa@sercoti.com.br','631.020.607-90','Daiane','Flávia Isabella Oliveira','18/02/1978','3DGjYOkoSL') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(05,'giovannaeduardadacosta@robiel.com','052.649.977-05','Giovanna','Eduarda da Costa','11/06/1975','ZlAbISDmPA') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(06,'benicioofig@mixfmmanaus.com','931.599.017-00','Benício','Osvaldo Figueiredo','22/08/1975','9X16qCfq6l') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(07,'enricorodrigosantos_@live.ca','738.890.407-72','Enrico','Rodrigo Santos','16/01/1981','PKs7hmxgnN') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(08,'samuelinocas@zaniniengenharia.com.br','469.495.947-63','Pedro','Samuel Severino Castro','02/11/1966','I6EhnBBil5') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(09,'anaaparecidadacunha@fertau.com','090.248.567-95','Ana','Aparecida da Cunha','19/02/1975','LAAcf3BHbu') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(10,'stefanysophiadamata@cfaraujo.eng','124.596.597-25','Stefany','Sophia da Mata','20/03/2002','U7W15Cbz3C') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(11,'emilyteixeira_@valepur.com.br','114.203.577-86','Gabriela','Emily Teixeira','16/01/1961','jpEw0hD21j') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(12,'adrianalucianaassuncao@hotmail.com','338.056.457-59','Adriana','Luciana Assunção','27/12/1992','wg1H1sIcTm') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(13,'enzoclaudioduarte-86@argo.com.br','162.878.707-45','Enzo','Cláudio Duarte','07/05/1944','jxitd1mKrZ') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(14,'isabelcarolinesimo@lubeka.com.br','678.237.837-03','Isabel','Caroline Simone Nunes','15/01/2002','YjLo76dUq1') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(15,'guilhermefelipeyur@trbvm.com','543.870.707-30','Guilherme','Felipe Yuri da Rosa','02/07/1999','Zwu8PD29Fm') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(16,'claudia_@consultorialk.com','393.307.517-33','Patrícia','Helena Cláudia da Conceição','02/09/1994','a1dtzzI5ho') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(17,'giovannidasilva-83@sicredi.com.br','209.469.717-73','Gabriel','Giovanni da Silva','27/07/1964','jDJ0IHPzGA') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(18,'matheusluismonteiro@conexao.com','27.938.491-9','Matheus','Luís Monteiro','11/04/1941','1TFWcC3E2w') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(19,'sagabrielapires@vbrasildigital.net','479.484.337-24','Natália','Rayssa Gabriela Pires','09/03/1998','SW7xD6N5Xk') ;

INSERT INTO USUARIOS (id, email, cpf, nome,sobrenome,data_nascimento,senha)  
VALUES(20,'enricosebastiaocosta_@trone.com.br','110.687.767-57','Benedito','Enrico Sebastião Costa','23/10/1991','NPz5Jipzrt') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99988,'PG-B3S','VOO','GOL','6687') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(9999,'Mt-SS1','ANURE','D-EDSS',02) 
;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99993,'HU-KAS','Passagem-boa','AZUL','03') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99994,'PW-ISB','AVIHOSP','AIRES','04') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99995,'LJ-OKS','BBS','PSJ','05') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99996,'MS-PHC','AZUL','FOLIAN','06') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99997,'WW-OSY','SHOP','AZUL','07') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99998,'UQ-USM','VOO','GOL','08') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99999,'MS-LAS','ANURE','PSH','09') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(99980,'NS-KHD','BBS','MMS','10') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(00001,'PR-MHC','TAM','Junkers F13','11') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(00002,'PR-MHD','TAM','Junkers F12','12') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(00003,'PR-MHE','AZUL','Junkers F14','13') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES (00004,'PR-MHF','AZUL','Junkers F15','14') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES (00005,'PR-MHG','GOL','Junkers F16','15') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES (00006,'PR-MHH','GOL','Junkers F17','16') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(00007,'PR-MHI','TAM','Junkers F18','17') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES(00008,'PR-MHJ','TAM','Junkers F19','18') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES (00009,'PR-MHK','AZUL','Junkers F10','19') ;

INSERT INTO AVIOES (id, placa,empresa,modelo,n_voo)  
VALUES (00010,'PR-MHL','AZUL','Junkers F11','20') ;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(001,'29115-585','Vila Velha','Rua Joel Antônio de Jesus','br','208','Ilha das Flores',00001);

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(002,'29070-483','Vitória','Rua Elizabeth Vassalo Botechia','br','183','Maria Ortiz',00002) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(003,'29043-052','Vitória','Rua Elydio Morgan','br','894','Maruípe',00003) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(004,'29194-102','Aracruz','Rua Manoel Rocha Coutinho','br','598','Vila Rica',00004) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(005,'29216-470','Guarapari','Rua Adelina Teixeira','br','730','Praia do Morro',00005) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(006,'29148-750','Cariacica','Rua dos Macânicos','br','327','Operário',00006) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(007,'29900-433','Linhares','Avenida Celeste Faé','br','980','Colina',00007) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(008,'29314-130','Cachoeiro de Itapemirim','Rua Júlio Facini','br','694','Aeroporto',00008) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(009,'29144-490','Cariacica','Avenida Brasil','br','412','Campina Grande',00009) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(010,'29163-015','Serra','Avenida Brigadeiro Gomes','br','590','São Diogo II',00010) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(011,'29160-230','Serra','Eurico Salles','br','783','Eurico Salles',00011) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(012,'29164-462','Serra','Rua Cataguases','br','251','Praia de Carapebus',00012) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(013,'29152-015','Cariacica','Rua Manoel de Andrade','br','170','Sotema',00013) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(014,'29150-491','Cariacica','Rua Henrique Rosetti','br','930','Itacibá',00014) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(015,'29943-110','São Mateus','Rua Minas Gerais','br','243','Ayrton Senna',00015) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(016,'29122-036','Vila Velha','Avenida Carlos Lindenberg','br','329','Glória',00016) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(017,'29702-610','Colatina','Beco Drasto Fabris','br','960','Santa Teresinha',00017) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(018,'29102-921','Vila Velha','Rua Sete de Junho','br','138','Coqueiral de Itaparica',00018) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(019,'28102-921','Vila Velha','Rua Sete de Junho','br','138','Coqueiral de Itaparica',00019) 
;

INSERT INTO ENDERECOS (id,cep,cidade,rua,country,n_estabelecimento,bairro,localizacoes_id)   
VALUES(020,'27102-921','Vila Velha','Rua Sete de Junho','br','138','Coqueiral de Itaparica',00020) 
;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00001,'31.626.737/0001-48','Ester e Pietro','Resort','(27) 2582-4331','74','5', 001);

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00002,'67.367.566/0001-27','Rodrigo e Bianca ','Hotel','(34) 3511-2613','71','3',002) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00003,'67.367.566/0001-21','Descanse em Paz ','Hotel','(24) 3511-2612','72','2',003) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00004,'67.367.566/0001-22','Mar Verde Ltda','Hotel','(82) 3511-2611','73','4',004) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00005,'67.367.566/0001-23','Mar Azul Ltda','Resort','(81) 3511-2610','22','2',005) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00006,'67.367.566/0001-24','Ibes','Resort','(80) 3511-2699','20','3',006) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00007,'67.367.566/0001-25','Abacateiros','Resort','(80) 3511-2698','40','4',007) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00008,'67.367.566/0001-26','Costa do Sol','Hotel','(80) 3511-2691','22','2',008) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00009,'67.367.566/0000-27','Crista do Mar','Resort','(22) 2511-2691','92','5',009) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00011,'68.367.566/1000-27','Caminho das Indias','Resort','(22) 3512-2691','97','5',010) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00012,'01.367.566/1000-27','Avenida Brasil','Resort','(22) 3502-2691','32','5', 012) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00013,'02.367.566/1000-27','Chocolate com Pimenta','Hotel','(22) 9502-2691','21','3',013) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00014,'02.367.066/1000-27','Atlantica','Hotel','(22) 9512-2691','33','4',014) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00015,'12.367.066/1000-27','Narnia','Hotel','(21) 9000-2691','39','4',015) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00016,'12.367.066/1000-20','Los Santos','Hotel','(21) 9001-2691','31','4',016) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00017,'12.367.066/1100-20','San Andreas','Hotel','(21) 9101-2691','30','4',017) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00018,'12.367.066/1103-20','Corona','Resort','(21) 9102-2691','80','5',018) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00019,'12.367.166/1103-20','Olimpo','Resort','(28) 9102-3691','81','5',019) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00020,'12.367.166/9103-20','Vauhala','Hotel','(28) 9182-3691','51','3',020) ;

INSERT INTO LOCALIZACOES (id,cnpj,nome_estabelecimento,tipo,telefone,n_quarto,avaliacoes,enderecos_id)    
VALUES (00110,'68.397.566/0000-27','Grande Familia','Resort','(22) 3511-2691','93','5',011) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99969,501,'quarto solteiro','01/01','03/01',01,00001);

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99970,502,'quarto casal ','04/01','06/01',02,00002) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99971,503,'quarto solteiro','07/01','10/01',03,00003) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99972,504,'quarto casal ','11/01','13/01',04,00004) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99973,505,'quarto solteiro','14/01','16/01',05,00005) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99974,506,'quarto duplo solteiro','17/01','20/01',06,00006) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99975,507,'quarto casal ','21/01','23/01',07,00007) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99976,508,'quarto solteiro','24/01','27/01',08,00008) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99977,509,'dormitórios','30/01','01/02',09,00009) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99978,510,'dormitórios','04/02','06/02',10,00110) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99979,511,'quarto solteiro','07/02','09/02',11,00011) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99980,512,'quarto casal ','10/02','12/02',12,00012) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99981,513,'quarto solteiro','13/02','16/02',13,00013) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99982,514,'quarto solteiro','17/02','20/02',14,00014) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99983,515,'dormitórios','21/02','25/02',15,00015) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99984,516,'dormitórios','27/02','01/03',16,00016) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99985,517,'quarto duplo solteiro','02/03','05/03',17,00017) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99986,518,'quarto casal ','06/03','09/03',18,00018) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99987,519,'quarto solteiro','10/03','15/03',19,00019) ;

INSERT INTO HOSPEDAGENS (id,n_quarto,categoria,checkin,checkout,usuarios_id,localizacoes_id) 
VALUES(99988,520,'dormitórios','17/03','20/03',20,00020) ;

alter table passagens  
modify (horario varchar2 (12)) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44441,2009,'290','a1','vip','PASSE','Vila Velha','Sao Paulo','Vila Velha','20:10:00','8-OCT-2019',99988,01) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44442,6492,'289','a1','vip','PASSE','Minas Gerais','Rio de Janeiro','Minas Gerais','21:50:00','9-OCT-2018',99989,02) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44442,6492,'289','a1','vip','PASSE','Minas Gerais','Rio de Janeiro','Minas Gerais','21:50:00','9-OCT-2018',9999,02) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44443,7402,'509','a3','business','Vamos viajar','Vitoria','BH','Vitoria','22:44:29','20-MAR-2018',99993,03) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44444,7452,'367','a4','classe economica','VOA','BH','Vila Velha','BS','22:35:25','13-NOV-2018',99994,04) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44445,1009,'100','a5','vip','HST','Rio de Janeiro','Sao Paulo','Rio','20:25:34','14-JAN-2019',99995,05) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44446,8263,'276','a6','primeira classe','Viajem','Vila Velha','Rio de Janeiro','Vila Velha','20:11:42','12-FEB-2017',99996,06) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44447,7390,'263','a7','business','Viajar Juntos','Vitoria','Sao Paulo ','Vitoria','19:26:50','15-MAY-2016',99997,07) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44448,6723,'153','a8','classe economica','PASSE','Vitoria','Minas Gerais','Vitoria','11:20:23','12-NOV-2008',99998,08) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(44449,2000,'290','a9','vip','Hst','Minas Gerais','Vitoria','Minas Gerais','14:26:37','16-DEC-2014',99999,09) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(45551,9876,'467','a10','business','Met','Minas Gerais','Vila Velha','Minas Gerais','16:26:23','28-APR-2011',99980,10) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(45552,6543,'163','b1','primeira classe','LOL','Alagoas','Vitoria','Alagoas','25:23:03','11-JUL-2010',00001,11) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(45553,8642,'267','b2','business','LOL','Alagoas','Minas Gerais','Alagoas','24:35:01','13-NOV-2010',00002,12) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(45554,2093,'290','b3','vip','MET','Alagoas','Rio de Janeiro','Alagoas','22:33:12','14-SEP-2012',00003,13) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(45555,2983,'478','b4','classe economica','HST','Hiroshima','Osaka','Hiroshima','10:20:30','20-AUG-2019',00004,14) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(45557,8700,'277','b5','business','PASSE','Brasil','Japao','Brasilia','45:52:34','10-JUN-2001',00005,15) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(46777,7322,'246','b6','primeira classe','Viajem','Hiroshima','Nagazaki','Hiroshima','17:26:27','8-SEP-2001',00006,16) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(47777,6455,'178','b7','vip','Viajar Juntos','VOA','Brasil','Canada','Brasilia','27:33:27','9-MAY-2010',00007,17) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(47777,6455,'178','b7','vip','Viajar Juntos','Brasil','Canada','Brasilia','27:33:27','9-MAY-2010',00007,17) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(48888,6777,'190','b8','primeira classe','Met','Canada','Franca','HSS','20:01:04','7-FEB-2017',00008,18) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(46674,8844,'267','b9','vip','PASSE','Italia','Japao','KLM','15:32:44','4-JUN-2015',00009,19) ;

INSERT INTO PASSAGENS (id,n_voo,preco,poltrona,categoria_poltrona,empresa,origem,destino,aeropoorto,horario,data,avioes_id,usuarios_id) 
VALUES(48599,6479,'189','b10','business','HST','Inglaterra','Canada','SMM','16:37:22','5-SEP-2010',00010,20) ;

