-- Tabela onde ficarão os logs de usuários

CREATE TABLE Logs(
    id_log SERIAL PRIMARY KEY,
    id_user INT,
    tipo_op TEXT,
    horario_op TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    username TEXT
);
-- função com os logs
CREATE OR REPLACE FUNCTION Logs_users()
RETURNS TRIGGER AS $$

BEGIN
        IF TG_OP = INSERT THEN
            INSERT INTO Logs(id_log, id_user, tipo_op, username)
            VALUES (NEW.id_user, 'I', SESSION_USER);
        IF TG_OP = UPDATE THEN
            INSERT INTO Logs(id_log, id_user, tipo_op, username)
            VALUES (NEW.id_user, 'U', SESSION_USER);
        IF TG_OP = DELETE THEN
            INSERT INTO Logs(id_log, id_user, tipo_op, username)
            VALUES (NEW.id_user, 'D', SESSION_USER);

        END IF;
        RETURN NEW;
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER tg_cursos_logs
AFTER INSERT OR UPDATE OR DELETE ON Cursos
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_professores_logs
AFTER INSERT OR UPDATE OR DELETE ON Professores
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_turmas_logs
AFTER INSERT OR UPDATE OR DELETE ON Turmas
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_alunos_logs
AFTER INSERT OR UPDATE OR DELETE ON Alunos
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_disciplinas_logs
AFTER INSERT OR UPDATE OR DELETE ON Disciplinas
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_horarios_logs
AFTER INSERT OR UPDATE OR DELETE ON Horarios
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_notas_logs
AFTER INSERT OR UPDATE OR DELETE ON Notas
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_matriculas_logs
AFTER INSERT OR UPDATE OR DELETE ON Matriculas
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_loginProfessor_logs
AFTER INSERT OR UPDATE OR DELETE ON Logins_Professores
FOR EACH ROW EXECUTE FUNCION Logs_users();

CREATE TRIGGER tg_loginAluno_logs
AFTER INSERT OR UPDATE OR DELETE ON Logins_Alunos
FOR EACH ROW EXECUTE FUNCION Logs_users();
        