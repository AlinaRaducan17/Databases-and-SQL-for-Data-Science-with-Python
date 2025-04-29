SHOW DATABASES;
CREATE DATABASE db_privilegii;
CREATE USER privilegii_admin@localhost IDENTIFIED BY 'xyz';
GRANT ALL PRIVILEGES ON db_privilegii.* TO privilegii_admin@localhost;
DROP USER IF EXISTS 'privilegii_user@127.0.0.1';
CREATE USER 'privilegii_user@127.0.0.1' IDENTIFIED BY '123';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_privilegii.* TO 'privilegii_user@127.0.0.1';
CREATE USER 'privilegii_viewer@%' IDENTIFIED BY 'abc';
GRANT SELECT ON db_privilegii.* TO 'privilegii_viewer@%';