FROM golang:1.11

RUN apt-get update
RUN apt-get install -y netcat \
                       python \
                       python-pip \
                       build-essential \
                       libpng-dev \
                       zip
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN npm rebuild node-sass --force
RUN pip install awscli
RUN go get -u github.com/golang/dep/cmd/dep

