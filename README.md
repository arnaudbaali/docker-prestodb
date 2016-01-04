# docker-prestodb
Docker for PrestoDB

## Add your Mysql catalog folder

add the folder **catalog** in **etc**

`mkdir catalog/`

## Build your Docker image

`docker build --build-arg PRESTO_DB_VERS=0.131 .`