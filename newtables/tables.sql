CREATE TYPE option_role AS ENUM ('Mentor', 'Lider', 'Membro');

CREATE TYPE option_ch AS ENUM ('S', 'N')

CREATE TYPE option_squad AS ENUM ('Backend', 'Cyber', 'Dados', 'Frontend', 'Games','Mobile','QA','UXUI','Produto','Marketing','Mentor_Academy')


CREATE TABLE Mentor_Academy(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Frontend(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Backend(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Marketing(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE UXUI(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE QA(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Produto(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Cyber(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Dados(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Games(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);

CREATE TABLE Mobile(
    IdUser SERIAL PRIMARY KEY
    ,Nome TEXT NOT NULL
    ,Email TEXT NOT NULL
    ,Linkedin TEXT
    ,DiscordUser TEXT
    ,PermissionDiscord TEXT
    ,Justificativa TEXT
    ,Motivacao TEXT
    ,Funcao option_role NOT NULL
    ,Carga_horaria option_ch NOT NULL
    ,Squad option_squad NOT NULL
);