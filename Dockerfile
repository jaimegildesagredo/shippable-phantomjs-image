FROM shippableimages/ubuntu1404_nodejs:latest
MAINTAINER "Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>"

RUN apt-get update -yqq && \
    apt-get install -yqq build-essential g++ flex bison gperf ruby perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev libpng-dev libjpeg-dev python wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/ariya/phantomjs/archive/2.0.0.tar.gz && \
    tar xf 2.0.0.tar.gz && \
    rm 2.0.0.tar.gz && \
    cd phantomjs-2.0.0 && \
    ./build.sh --confirm && \
    cp bin/phantomjs /usr/bin/phantomjs && \
    cd .. && \
    rm -r phantomjs-2.0.0
