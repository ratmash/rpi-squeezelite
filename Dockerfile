FROM balenalib/rpi-raspbian:latest

MAINTAINER ratmash

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    usbutils \
    libflac-dev \
    libfaad2  \
    libmad0 \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    && apt-get clean

RUN update-ca-certificates

ENV SQUEEZELITE_VERSION=1.9.9.1386
RUN curl -L --cacert /etc/ssl/certs/ca-certificates.crt -L https://sourceforge.net/projects/lmsclients/files/squeezelite/linux/squeezelite-${SQUEEZELITE_VERSION}-armhf.tar.gz | tar xz squeezelite

RUN chmod a+x squeezelite

RUN date >/build-date.txt

CMD echo Image built: $(cat /build-date.txt) && /squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
