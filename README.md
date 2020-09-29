# Boomi Docker Images
This repository contains source for the publicly available docker images on Docker Hub.

Refer to CHANGELOG.md for release information.
## Atom
https://hub.docker.com/repository/docker/boomi/atom
## Molecule
https://hub.docker.com/repository/docker/boomi/molecule
## Cloud
https://hub.docker.com/repository/docker/boomi/cloud


# Building the Docker Images
From the root of dockerinst project.

#### Build install base 
    docker build -t boomi/install:<version> ./src/install
#### Build atom    
    docker build -t boomi/atom:<version> ./src/atom
#### Build molecule    
    docker build -t boomi/molecule:<version> ./src/molecule
#### Build cloud
    docker build -t boomi/cloud:<version> ./src/cloud
    
# Reference Architectures
https://bitbucket.org/officialboomi/runtime-containers/src/master/

