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
    IF TG_OP = 'INSERT' THEN
        INSERT INTO Logs(id_log, id_user, tipo_op, username)
        VALUES (NEW.id_user, 'I', SESSION_USER);
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO Logs(id_log, id_user, tipo_op, username)
        VALUES (NEW.id_user, 'U', SESSION_USER);
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO Logs(id_log, id_user, tipo_op, username)
        VALUES (OLD.id_user, 'D', SESSION_USER);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Triggers criadas para puxar o gatilho e anotar a info a cada UPDATE, DELETE ou INSERT

CREATE TRIGGER tg_usuarios_logs
AFTER INSERT OR UPDATE OR DELETE ON Usuarios
FOR EACH ROW EXECUTE FUNCTION Logs_users();

CREATE TRIGGER tg_Login_logs
AFTER INSERT OR UPDATE OR DELETE ON Login
FOR EACH ROW EXECUTE FUNCTION Logs_users();

CREATE TRIGGER tg_Projetos_logs
AFTER INSERT OR UPDATE OR DELETE ON Projetos
FOR EACH ROW EXECUTE FUNCTION Logs_users();

CREATE TRIGGER tg_Certificados_logs
AFTER INSERT OR UPDATE OR DELETE ON Certificados
FOR EACH ROW EXECUTE FUNCTION Logs_users();