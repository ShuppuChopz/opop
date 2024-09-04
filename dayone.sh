nano script.sh - создаст файл
chmod +x script.sh - сделает файл исполняемым
/script.sh - запустит файл 

#!/bin/bash - Начало любого скрипта
mysql -u root -p'root' -e

"CREATE DATABASE USER_DB;"
mysql -u root -p'root' -e "USE USER_DB; CREATE TABLE USERS(id INT AUTO_INCREMENT, PRIMARY KEY, name VARCHAR(255), password VARCHAR(255));"

for i in {1..10};
do 
username="user$i";
bdname="base$i";
password=$(openssl rand -base64 10);

mysql -u root -p'root' -e "CREATE USER $username@localhost IDENTIFIED BY $password";
mysql -u root -p'root' -e "USE USER_DB; INSERT INTO USERS(name, password) VALUES('$username', '$password');"
mysql -u root -p'root' -e "CREATE DATABASE $bdname; GRANT ALL PRIVELEG on $bdname*TO$username@'localhost'"
done


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Скрипт первого дня выполняет создание пользователей, паролей баз данных и баз данных для каждого пользователя
