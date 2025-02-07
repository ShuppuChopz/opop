#!/bin/bash
DB_NAME="USER_DB"
DB_USER="test"
DB_PASS="password"
SECRET_KEY="1a@b3"

mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -e "UPDATE USERS SET PASSWORD = AES_ENCRYPT(PASSWORD, '$SECRET_KEY');"

echo "Пароли успешно зашифрованы."
