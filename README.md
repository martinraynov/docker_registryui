# Introduction
Local Registry UI connected to a docker registry server

We use the joxit/docker-registry-ui container as UI.

# Installation and configuration

## Swarm mode 

Use the `make` command to start/stop the container. For additionnal docker-compose configurations you can specify them in the `docker-compose-override.yml` file.

We have some variables that are necessary so that the container can start normally :
- REGISTRY_DOMAIN : this is the url where your registry apis are available.
- LOCAL_DOMAIN : this is the local url that you will use to display the UI.

## Docker mode

For now this is not implemented 

# Available commands

You can see all the available commands and their description with :
```
make help
```