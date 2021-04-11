# rpi-squeezelite
A squeezelite docker image for your raspberry pi, forked from jakobengdahl/rpi-squeezelite, also incorporating tweaks from  baztian/rpi-squeezelite 

Updated to use latest raspbian build (balenalib/rpi-raspbian:buster) and squeezelite 1.9.9.1372

It looks for the following environment variables for the parameters of squeezelite: CLIENTNAME, SERVER, CLIENTMAC, SOUNDDEVICE and all variables must be set at launch.

It should be possible to run the docker image without using privileged mode but this hasn't been tested.

Example: docker run --privileged --name=squeezelite --restart=always -d -e SERVER=192.168.1.5 -e CLIENTNAME=dockersqueezelite -e SOUNDDEVICE=front:CARD=Device,DEV=0 -e CLIENTMAC=00:00:00:00:00:01 -t ratmash/rpi-squeezelite
 
To list audio devices run: docker run --privileged -it -i --entrypoint=/bin/bash -t ratmash/rpi-squeezelite Then inside docker container run: /squeezelite -l

The docker-compose.yml equivalent of the above run command is as follows...

```
version: '3.3'
services:
    rpi-squeezelite:
        privileged: true
        container_name: squeezelite
        restart: always
        environment:
            - SERVER=192.168.1.5
            - CLIENTNAME=dockersqueezelite
            - 'SOUNDDEVICE=front:CARD=Device,DEV=0'
            - 'CLIENTMAC=00:00:00:00:00:01'
        image: ratmash/rpi-squeezelite
```
