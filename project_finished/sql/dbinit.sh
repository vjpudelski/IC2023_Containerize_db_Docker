echo "db initialize"
IS_STARTED="IS_STARTED_PLACEHOLDER"
if [ ! -e $IS_STARTED ]; then
  touch $IS_STARTED
  #!/bin/bash
  wait_time=30s
  password=Password1

  # wait for SQL Server to come up
  echo "database initialization will start in $wait_time..."
  sleep $wait_time

  # run the init script to create the DB and the tables
  echo "creating database..."
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $password -i ./createdb.sql

  echo database initialization complete...
else
  echo "No Initialization Required!"
fi
