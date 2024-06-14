-- Ativar a extensão pgcrypto
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Criar tipos ENUM
CREATE TYPE option_role AS ENUM ('Mentor', 'Lider', 'Membro');
CREATE TYPE option_ch AS ENUM ('S', 'N');
CREATE TYPE option_squad AS ENUM ('Backend', 'Cyber', 'Dados', 'Frontend', 'Games','Mobile','QA','UXUI','Produto','Marketing','Mentor_Academy');

-- Criar tabela Usuarios
CREATE TABLE Usuarios(
    IdUser SERIAL PRIMARY KEY,
    Nome TEXT NOT NULL,
    Email TEXT NOT NULL,
    Linkedin TEXT,
    DiscordUser TEXT,
    PermissionDiscord TEXT,
    Justificativa TEXT,
    Motivacao TEXT,
    Funcao option_role NOT NULL,
    Carga_horaria option_ch NOT NULL,
    Squad option_squad NOT NULL
);

-- Criar tabela Login
CREATE TABLE Login(
    IdLogin SERIAL PRIMARY KEY,
    IdUser INTEGER NOT NULL,
    Username TEXT NOT NULL,
    Password TEXT NOT NULL,
    CONSTRAINT fk_usuario_login FOREIGN KEY(IdUser) REFERENCES Usuarios(IdUser)
);

-- Criar função para criptografar a senha
CREATE OR REPLACE FUNCTION encrypt_password() RETURNS TRIGGER AS $$
BEGIN
    NEW.Password := crypt(NEW.Password, gen_salt('bf'));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criar trigger para chamar a função de criptografia antes de inserir ou atualizar
CREATE TRIGGER encrypt_password_before_insert
BEFORE INSERT OR UPDATE ON Login
FOR EACH ROW
EXECUTE FUNCTION encrypt_password();

-- Criar tabela Projetos
CREATE TABLE Projetos(
    IdProjeto SERIAL PRIMARY KEY,
    NomeProjeto TEXT NOT NULL,
    Descricao TEXT,
    DataInicio DATE,
    DataFim DATE,
    IdUser INTEGER NOT NULL,
    CONSTRAINT fk_usuario_projeto FOREIGN KEY(IdUser) REFERENCES Usuarios(IdUser)
);

-- Criar tabela Certificados
CREATE TABLE Certificados(
    IdCertificado SERIAL PRIMARY KEY,
    IdUser INTEGER NOT NULL,
    NomeCertificado TEXT NOT NULL,
    DataEmissao DATE,
    Instituicao TEXT,
    CONSTRAINT fk_usuario_certificado FOREIGN KEY(IdUser) REFERENCES Usuarios(IdUser)
);


docker run --name bichinhos -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=bichinhos -p 5432:5432 -d postgres
