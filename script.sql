CREATE TABLE PESSOA (
    Email VARCHAR(250),
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(250),
    Senha VARCHAR(50)
);

CREATE TABLE Contato (
    Contato_Usuario VARCHAR(250),
    ID INT NOT NULL,
    Codigo_contato INT NOT NULL,
    FOREIGN KEY(ID) REFERENCES PESSOA (ID)
);

CREATE TABLE USUARIO (
    Data_Nasc DATE,
    Data_de_inscricao DATE NOT NULL DEFAULT CURRENT_DATE,
    Genero CHAR(1)
)INHERITS (PESSOA);

CREATE TABLE ADMINISTRADOR (
    CPF INT NOT NULL,
    Matricula_funcional VARCHAR(25)
)INHERITS (PESSOA);

CREATE TABLE TIPO_DE_CONTATO (
    Tipo_Contato VARCHAR(150),
    Codigo_contato SERIAL PRIMARY KEY
);

CREATE TABLE ROTA (
    ID_Rota SERIAL PRIMARY KEY,
    Apelido VARCHAR(250),
    ID_Usuario INT NOT NULL
);

CREATE TABLE LOCAL (
    ID_Local SERIAL PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Apelido VARCHAR(250),
    ID_Endereco INT NOT NULL
);

CREATE TABLE ENDERECO (
    ID_Endereco SERIAL PRIMARY KEY,
    Rua VARCHAR(250),
    CEP INT,
    Codigo_bairro INT NOT NULL
);

CREATE TABLE CAMINHO (
    Ordem INT NOT NULL,
    ID_Endereco INT NOT NULL,
    ID_Rota INT NOT NULL,
    FOREIGN KEY(ID_Endereco) REFERENCES ENDERECO (ID_Endereco),
    FOREIGN KEY(ID_Rota) REFERENCES ROTA (ID_Rota)
);

CREATE TABLE ITEM_ROUBADO (
    Qtd INT,
    Item VARCHAR(250),
    ID_Boletim INT NOT NULL
);

CREATE TABLE TIPO_DE_LOCAL (
    Tipo_local VARCHAR(150),
    Codigo SERIAL PRIMARY KEY
);

CREATE TABLE BOLETIM (
    Data DATE,
    Hora TIME,
    Crime VARCHAR(10),
    ID_Boletim INT NOT NULL PRIMARY KEY,
    ID_Endereco INT NOT NULL,
    Codigo SERIAL,
    ID SERIAL,
    Origem BOOLEAN,
    FOREIGN KEY(ID_Endereco) REFERENCES ENDERECO (ID_Endereco),
    FOREIGN KEY(Codigo) REFERENCES TIPO_DE_LOCAL (Codigo),
    FOREIGN KEY(ID) REFERENCES PESSOA (ID)
);


CREATE TABLE MUNICIPIO (
    Codigo_municipio SERIAL PRIMARY KEY,
    Nome_municipio VARCHAR(250)
);

CREATE TABLE BAIRRO (
    Codigo_bairro SERIAL PRIMARY KEY,
    Nome_bairro VARCHAR(250),
    Codigo_municipio INT NOT NULL,
    FOREIGN KEY (CODIGO_MUNICIPIO) REFERENCES MUNICIPIO(CODIGO_MUNICIPIO)
);

ALTER TABLE Contato ADD FOREIGN KEY(Codigo_contato) REFERENCES TIPO_DE_CONTATO (Codigo_contato);
ALTER TABLE LOCAL ADD FOREIGN KEY(ID_Endereco) REFERENCES ENDERECO (ID_Endereco);
ALTER TABLE ENDERECO ADD FOREIGN KEY(Codigo_bairro) REFERENCES BAIRRO (Codigo_bairro);
ALTER TABLE ITEM_ROUBADO ADD FOREIGN KEY(ID_Boletim) REFERENCES BOLETIM (ID_Boletim);
ALTER TABLE BAIRRO ADD FOREIGN KEY(Codigo_municipio) REFERENCES MUNICIPIO (Codigo_municipio);



/* INSERÇÃO DE DADOS */

INSERT INTO USUARIO (NOME, SENHA, EMAIL, DATA_NASC, GENERO) VALUES
('JOÃO', '123456','joaostn@gmail.com','1990/07/19','M'),
('JOSÉ MARIA', 'KK1234','jsmaria@gmail.com','1961/05/29','M'),
('GERALDO', 'VNSA321','jsgeraldo@gmail.com','1972/12/29','M'),
('JULIANA','OI908','julianayks@gmail.com','1997/07/19','F');

INSERT INTO ADMINISTRADOR (NOME, SENHA, EMAIL, CPF, MATRICULA_FUNCIONAL) VALUES
('ANDRE','98765432','andre.barbosa@gmail.com',123456789,'34567123');

INSERT INTO TIPO_DE_CONTATO (TIPO_CONTATO) VALUES
('Telefone'),
('Celular'),
('Facebook');
