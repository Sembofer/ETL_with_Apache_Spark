## Docker
docker run -e POSTGRES_HOST_AUTH_METHOD=md5 -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 --name prueba -d postgres
docker cp script.sql mypostgres:.
docker exec -i -u postgres mypostgres bash -c "echo 'password_encryption=md5' >> /var/lib/postgresql/data/postgresql.conf"
docker restart mypostgres
docker exec -i -u postgres mypostgres bash -c "psql -c '\i script.sql'"
