# Dockerfile for Postorius

## How to run

This docker file expects a volume to be mounted at /postorius/local  
This volume should contain an `__init__.py` file, since django expects it to be
a valid python module.

This volume can hold any custom configuration and the database, to persist
changes between starts.

You can pass environment variables to alter the settings:
- `MAILMAN_REST_API_URL=http://mailman-core:8001`
- `MAILMAN_REST_API_USER=restadmin`
- `MAILMAN_REST_API_PASS=restpass`

You can also override the settings using a file in /postorius/local/settings.py

Note that this file overrides the environment variables!

On first start you have to initialize the databse by running two commands:
1. Populate the database:  
`docker exec -it <container_name> python /postorius/manage.py migrate`
2. Create a superuser:
`docker exec -it <container_name> python /postorius/manage.py createsuperuser`

The server is exposed under port `8000`

The provided docker-compose file should simply the process of getting it running

Please note that a Mailman core instance is needed to actually use this image. Refer to the compose files included in https://github.com/simonsmiley/mailman-compose for compose files that also setup Mailman core.

Access to the django commandline can be obtained using:  
`docker exec -it <container_name> python /postorius/manage.py mmclient`  
a mailmanclient Client object is provided for convenience which can be accessed using `client`


## How to build

`docker build -t <name> .`
