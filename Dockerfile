FROM microsoft/aspnetcore-build:2.0.3

RUN apt-get update \
    && apt-get -y install apt-transport-https ca-certificates curl gnupg2  software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update \
    && apt-get -y install gnupg \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get -y install nodejs \
    && apt-get -y install bzip2 \
    && apt-get -y install libfontconfig \
    && apt-get -y install docker-ce docker-compose
    
VOLUME /var/run/docker.sock
