FROM circleci/golang:1.12.6

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
