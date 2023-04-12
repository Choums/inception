-- -- USE mysql;
-- -- FLUSH PRIVILEGES;
-- -- CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
-- -- CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
-- -- GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER';
-- -- ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
-- -- FLUSH PRIVILEGES;

-- --# Create table SQL_DATABASE
-- CREATE DATABASE IF NOT EXISTS $MYSQL_DB;

-- --# Create user
-- CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- --# Give right to User
-- GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$MYSQL_USER'@'%'
-- 	IDENTIFIED BY '$MYSQL_PASSWORD';

-- --# Change root password
-- ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

-- --# Refresh change
-- FLUSH PRIVILEGES;
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MYSQL_DB'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_DB'@'%';
FLUSH PRIVILEGES;