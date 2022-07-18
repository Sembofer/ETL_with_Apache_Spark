# ETL_with_Apache_Spark
PySpark, Postgres with Docker, Big Data

## Database
To set everything up, execute
`./config.sh`

If you can't execute the config.sh run these steps
```
docker run -e POSTGRES_HOST_AUTH_METHOD=md5 -e POSTGRES_PASSWORD=doesntmatter -p 5432:5432 --name mypostgres -d postgres
```

```
docker exec -ti -u postgres mypostgres bash -c "echo 'password_encryption=md5' >> /var/lib/postgresql/data/postgresql.conf"
```

```
docker restart mypostgres
```

```
docker exec -ti -u postgres mypostgres psql
```

```
alter role postgres with password 'mysecretpassword';
```

## The file jar
Make sure you have the next connector, lib/postgresql-42.1.4.jar,in the established route.
If everything is ok, just run
```
spark-submit --driver-class-path /usr/lib/postgresql-42.1.4.jar etl.py
```

## docker exec -ti -u postgres mypostgres psql
You can access to database by running
```
docker exec -ti -u postgres mypostgres psql
```