#!/bin/bash

# Define your environment variables here
DB_CONTAINER_NAME="database"
DB_NAME="main"
DB_USER="main"
DB_PASSWORD="ctACGEEnNe5NHL76qXKYiAwyBht4hRKz743EDFcpzDXXtLU4QBRPZAvVdhDQgrQf"
DB_PORT=5432
DB_VOLUME="postgres_data"

git_pull_force() {
	git reset --hard HEAD
	git clean -f -d
	git pull origin main
}

cd ~/$DB_CONTAINER_NAME
git_pull_force;

# Danach machen wir ein Backup der Datenbank, falls bei der Migration etwas schiefgehen sollte.
BACKUP_FILENAME="${HOME}/backups/$(date +"%Y-%m-%d_%H-%M-%S").sql.gz"
docker exec -t $DB_CONTAINER_NAME pg_dump --data-only -U $DB_USER main | gzip > $BACKUP_FILENAME

# Wir stoppen die Datenbank und rebuilden das Backup
docker stop $DB_CONTAINER_NAME

# Wir entfernen das "database" Image um Komplikationen vorzusorgen
docker rm $DB_CONTAINER_NAME

# Wir erstellen ein docker volume, damit wir unsere PostgreSQL Daten sichern können.
docker volume rm $DB_VOLUME
docker volume create $DB_VOLUME

# Und starten einen neuen "database" container.
cd ~/$DB_CONTAINER_NAME
docker build -t $DB_CONTAINER_NAME .
docker run -d --name $DB_CONTAINER_NAME \
	-e POSTGRES_USER=$DB_USER \
	-e POSTGRES_PASSWORD=$DB_PASSWORD \
	-p $DB_PORT:5432 \
	-v $DB_VOLUME:/var/lib/postgresql/data \
	-v "${PERSISTENT_DIR}:/persistent" \
	$DB_CONTAINER_NAME

# Wir müssen warten bis die Datenbank wieder läuft.
while ! docker exec $DB_CONTAINER_NAME pg_isready -U $DB_USER -h localhost -p $DB_PORT > /dev/null 2>&1; do
    sleep 1
done

# Und wenden das Backup an.
gunzip -c $BACKUP_FILENAME | docker exec -i $DB_CONTAINER_NAME psql -U $DB_USER -d postgres

# Wir gehen durch alle "modifications" durch und führen die Skripte nacheinander aus
cd ~/$DB_CONTAINER_NAME/modifications
for f in *.sql
do
		echo "Processing $f file..."
		docker exec -i $DB_CONTAINER_NAME psql -U $DB_USER -d $DB_NAME < $f
done