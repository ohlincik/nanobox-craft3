# Deploy Live

`nanobox deploy dry-run`

## Copy the DB data

### Console into the DRY-RUN database component

`nanobox console dry-run data.db`

### Export the data from the LOCAL database

Use the Backup Database

Unzip

### Import the data into the LIVE database

Tunnel into the **data.db** component

Use the info there

`mysql -h 127.0.0.1 -P 5444 -v -u nanobox --password={pass} gonano < path/to/db_backup.sql`

