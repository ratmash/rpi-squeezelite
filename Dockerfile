FROM balenalib/rpi-raspbian:buster

MAINTAINER ratmash

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    usbutils \
    libflac-dev \
    libfaad2  \
    libmad0 \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    && apt-get clean

ENV SQUEEZELITE_VERSION=1.9.9.1372
RUN curl -L https://sourceforge.net/projects/lmsclients/files/squeezelite/linux/squeezelite-${SQUEEZELITE_VERSION}-armhf.tar.gz | tar xz squeezelite

RUN chmod a+x squeezelite

CMD /squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
