# Banco de Dados de Instituição Educacional

Este repositório contém as definições de tabelas para um banco de dados de uma instituição educacional. A estrutura abrange informações sobre cursos, professores, turmas, alunos, disciplinas, horários, notas, matrículas e logins.

![1718220687801](image/README/1718220687801.png)

## Tabelas

1. Cursos
   id_curso: Identificador único do curso (chave primária).
   nome: Nome do curso.
   descricao: Descrição do curso.
   duracao: Duração do curso em horas.
2. Professores
   id_professor: Identificador único do professor (chave primária).
   nome: Nome do professor.
   data_nascimento: Data de nascimento do professor.
   endereco: Endereço do professor.
   telefone: Telefone do professor.
   email: Email do professor.
3. Turmas
   id_turma: Identificador único da turma (chave primária).
   nome: Nome da turma.
   ano: Ano da turma.
   curso_id: Identificador do curso associado (chave estrangeira).
   professor_id: Identificador do professor associado (chave estrangeira).
4. Alunos
   id_aluno: Identificador único do aluno (chave primária).
   nome: Nome do aluno.
   data_nascimento: Data de nascimento do aluno.
   endereco: Endereço do aluno.
   telefone: Telefone do aluno.
   email: Email do aluno.
   data_matricula: Data de matrícula do aluno.
   turma_id: Identificador da turma associada (chave estrangeira).
5. Disciplinas
   id_disciplina: Identificador único da disciplina (chave primária).
   nome: Nome da disciplina.
   descricao: Descrição da disciplina.
   curso_id: Identificador do curso associado (chave estrangeira).
6. Horarios
   id_horario: Identificador único do horário (chave primária).
   dia_semana: Dia da semana do horário.
   hora_inicio: Hora de início da aula.
   hora_fim: Hora de término da aula.
   disciplina_id: Identificador da disciplina associada (chave estrangeira).
   turma_id: Identificador da turma associada (chave estrangeira).
7. Notas
   id_nota: Identificador único da nota (chave primária).
   aluno_id: Identificador do aluno associado (chave estrangeira).
   disciplina_id: Identificador da disciplina associada (chave estrangeira).
   nota: Nota obtida pelo aluno.
   data_avaliacao: Data da avaliação.
8. Matriculas
   id_matricula: Identificador único da matrícula (chave primária).
   aluno_id: Identificador do aluno associado (chave estrangeira).
   disciplina_id: Identificador da disciplina associada (chave estrangeira).
   data_matricula: Data da matrícula.
9. Logins_Alunos
   id_login_aluno: Identificador único do login do aluno (chave primária).
   aluno_id: Identificador do aluno associado (chave estrangeira).
   username: Nome de usuário do aluno (único).
   password_hash: Hash da senha do aluno.
   data_criacao: Data de criação do login.
   ultimo_login: Data do último login.
10. Logins_Professores
    id_login_professor: Identificador único do login do professor (chave primária).
    professor_id: Identificador do professor associado (chave estrangeira).
    username: Nome de usuário do professor (único).
    password_hash: Hash da senha do professor.
    data_criacao: Data de criação do login.
    ultimo_login: Data do último login.
