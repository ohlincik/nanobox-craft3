# Dry Run

`nanobox deploy dry-run`

## Copy the DB data from LOCAL to DRY-RUN

### Console into the DRY-RUN database component

`nanobox console dry-run data.db`

### Export the data from the LOCAL database

`mysqldump -h {LOCAL_DB_IP} -u nanobox --password={LOCAL_DB_PASSW} --force --no-create-db gonano | gzip > /tmp/db_dump.sql.gz`

### Import the data into the DRY-RUN database

`gunzip /tmp/db_dump.sql.gz && mysql -u nanobox --password={DRY-RUN_DB_PASSW} gonano < /tmp/db_dump.sql && rm /tmp/db_dump.sql`

## Copy the Assets from LOCAL to DRY-RUN

### Assets: Run from the local machine terminal

`rsync -rtvO --super web/assets gonano@{DRY-RUN_STORAGE_IP}:/data/var/db/unfs/web`

### Rebrand: Run from the local machine terminal

`rsync -rtvO --super storage/rebrand gonano@{DRY-RUN_STORAGE_IP:/data/var/db/unfs/storage`

