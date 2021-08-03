FROM ${DOCKER_ARCH}alpine:latest
LABEL maintainer="Zac Schellhardt <zac@z12t.com>"

RUN \
  apk add \
    --no-cache \
    --repository 'http://dl-cdn.alpinelinux.org/alpine/edge/main' \
    build-base \
    cmake \
    autoconf \
    automake \
    librtlsdr-dev \
    libtool \
    libao-dev \
    fftw-dev \
    ezstream \
    lame \
    lame-dev \
    libshout-dev \
    git \
    rtl-sdr

COPY start_noaa.sh /start_noaa.sh
COPY ezstream.xml /etc/ezstream.xml
RUN chmod +x /start_noaa.sh
RUN chmod 700 /etc/ezstream.xml

ENTRYPOINT ["/start_noaa.sh"]
