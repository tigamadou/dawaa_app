#!/bin/bash

# Define the container and database information
CONTAINER_NAME="dawaa_db"
DB_USER="root"
DB_PASSWORD="root"
DB_NAME="dawaa"

# Path to the SQL file to import
SQL_FILE="/path/to/dawadb.sql"

# Run the MySQL client within the container to import the SQL file
docker exec -i "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$SQL_FILE"

# Check the exit code to determine if the import was successful
if [ $? -eq 0 ]; then
  echo "Database import completed successfully."
else
  echo "Error: Database import failed."
fi
