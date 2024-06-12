-- Criação da tabela Alunos
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_matricula DATE,
    turma_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(id_turma)
);

-- Criação da tabela Turmas
CREATE TABLE Turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    ano INT,
    curso_id INT,
    professor_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id_curso),
    FOREIGN KEY (professor_id) REFERENCES Professores(id_professor)
);

-- Criação da tabela Cursos
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    duracao INT
);

-- Criação da tabela Professores
CREATE TABLE Professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Criação da tabela Disciplinas
CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id_curso)
);

-- Criação da tabela Horarios
CREATE TABLE Horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    dia_semana VARCHAR(20),
    hora_inicio TIME,
    hora_fim TIME,
    disciplina_id INT,
    turma_id INT,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (turma_id) REFERENCES Turmas(id_turma)
);

-- Criação da tabela Notas
CREATE TABLE Notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    disciplina_id INT,
    nota DECIMAL(5, 2),
    data_avaliacao DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina)
);

-- Criação da tabela Matriculas
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    disciplina_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina)
);

-- Criação da tabela Logins_Alunos
CREATE TABLE Logins_Alunos (
    id_login_aluno INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    data_criacao DATE,
    ultimo_login DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id_aluno)
);

-- Criação da tabela Logins_Professores
CREATE TABLE Logins_Professores (
    id_login_professor INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    data_criacao DATE,
    ultimo_login DATE,
    FOREIGN KEY (professor_id) REFERENCES Professores(id_professor)
);
