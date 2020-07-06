CREATE USER 'dbagent'@'%' IDENTIFIED BY 'ChangeIndentifiedPassword';
CREATE DATABASE dbagent_db DEFAULT CHARACTER SET utf8mb4;
GRANT ALL ON dbagent_db.* TO 'dbagent'@'%';