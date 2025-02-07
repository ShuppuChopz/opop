#!/bin/bash
mysql -u test -p'password' -e "CREATE DATABASE USER_DB;"
mysql -u test -p'password' -e "USE USER_DB; CREATE TABLE USERS (ID INT AUTO_INCREMENT PRIMARY KEY, NAME VARCHAR(255), PASSWORD VARBINARY(255));"

for i in {1..10}; do 
  USERNAME="user_$i"
  BDNAME="base_$i"
  PASSWORD=$(openssl rand -base64 4 | tr -d '=' | cut -c1-5)

mysql -u test -p'password' -e "CREATE USER $USERNAME@'localhost' IDENTIFIED BY '$PASSWORD';"
mysql -u test -p'password' -e "USE USER_DB; INSERT INTO USERS(NAME, PASSWORD) VALUES ('$USERNAME', '$PASSWORD');"
mysql -u test -p'password' -e "CREATE DATABASE $BDNAME; GRANT ALL PRIVILEGES ON $BDNAME.* TO '$USERNAME'@'localhost';"
done
