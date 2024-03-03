# Данные необходимые для подключения бд
DB_NAME="sql_bootcamp"
DB_USER="postgres"
DB_PASSWORD="root"

# Директория для PK
BACKUP_DIR="/home/adpak/DS/S21_SQL/SQL_Dumps/dumps"

# Дата
DATE=$(date +"%Y%m%d%H%M")

# Имя файла РК
BACKUP_FILENAME="db_backup_$DB_NAME_$DATE.sql"

# Путь к файлу РК
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILENAME"

# Установка пароля
export PGPASSWORD="$DB_PASSWORD"

# Выполнение РК
pg_dump -U $DB_USER -d $DB_NAME -F p > "$BACKUP_PATH"

# Сброс переменной с паролем(для безопасности)
unset PGPASSWORD

echo "Резервная копия базы данных $DB_NAME сохранена как $BACKUP_PATH"