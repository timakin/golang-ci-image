FROM golang:1.11

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && \
    apt-get install -y netcat \
                       python \
                       python-pip \
                       build-essential \
                       libpng-dev \
                       zip \
                       wget \
                       nodejs
RUN npm rebuild node-sass --force
RUN pip install awscli
RUN go get -u github.com/golang/dep/cmd/dep
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
RUN chmod +x /usr/local/bin/dockerize
