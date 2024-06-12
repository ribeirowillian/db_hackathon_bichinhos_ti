-- Criação da tabela Cursos
CREATE TABLE Cursos (
    id_curso SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT,
    duracao INT
);

-- Criação da tabela Professores
CREATE TABLE Professores (
    id_professor SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    data_nascimento DATE,
    endereco TEXT,
    telefone TEXT,
    email TEXT
);

-- Criação da tabela Turmas
CREATE TABLE Turmas (
    id_turma SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    ano INT,
    curso_id INT,
    professor_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id_curso),
    FOREIGN KEY (professor_id) REFERENCES Professores(id_professor)
);

-- Criação da tabela Alunos
CREATE TABLE Alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    data_nascimento DATE,
    endereco TEXT,
    telefone TEXT,
    email TEXT,
    data_matricula DATE,
    turma_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(id_turma)
);

-- Criação da tabela Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id_curso)
);

-- Criação da tabela Horarios
CREATE TABLE Horarios (
    id_horario SERIAL PRIMARY KEY,
    dia_semana TEXT,
    hora_inicio TIME,
    hora_fim TIME,
    disciplina_id INT,
    turma_id INT,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (turma_id) REFERENCES Turmas(id_turma)
);

-- Criação da tabela Notas
CREATE TABLE Notas (
    id_nota SERIAL PRIMARY KEY,
    aluno_id INT,
    disciplina_id INT,
    nota NUMERIC,
    data_avaliacao DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina)
);

-- Criação da tabela Matriculas
CREATE TABLE Matriculas (
    id_matricula SERIAL PRIMARY KEY,
    aluno_id INT,
    disciplina_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina)
);


-- Criação da tabela Logins_Alunos
CREATE TABLE Logins_Alunos (
    id_login_aluno SERIAL PRIMARY KEY,
    aluno_id INT,
    username TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    data_criacao DATE,
    ultimo_login DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id_aluno)
);

-- Criação da tabela Logins_Professores
CREATE TABLE Logins_Professores (
    id_login_professor SERIAL PRIMARY KEY,
    professor_id INT,
    username TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    data_criacao DATE,
    ultimo_login DATE,
    FOREIGN KEY (professor_id) REFERENCES Professores(id_professor)
);
