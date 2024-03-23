

ALL OF THIS DOES NOT WORK!!! JUST SOME EXPERIMENTS!!!
NEEDS TO BE CLEANED UP OR REMOVED OR WHAEVER ...

-----


 Cleanup (in case you played with it before)

```shell
docker compose stop
docker compose rm
rm -rf volumes/
```

Create the directories and start the containers:
```shell
mkdir -p volumes/html/images volumes/dbms
docker compose up
```

Run the setup:
```shell
open http://127.0.0.1:8080/mw-config/index.php
```

Select language (type tab, 'en', tab, 'en', tab, enter)

Database type: MariaDB
Database host: database
Database name: my_wiki
Database username: vfx
Database password: geh-doch-heim


Important: in the setup enter 'database' as the database host!


Username: vfx
Password: geh-doch-heim

"I'm bored already, just install the wiki."


```shell
cp ~/Downloads/LocalSettings.php volumes/html
```

uncomment the line for LocalSettings in the compose file
