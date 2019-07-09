FROM circleci/golang:1.12.6

ENV DOCKERIZE_VERSION v0.6.1
ENV REVIEWDOG_VERSION 0.9.11

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
RUN go get -u golang.org/x/lint/golint
RUN curl -fSL https://github.com/haya14busa/reviewdog/releases/download/$REVIEWDOG_VERSION/reviewdog_linux_amd64 -o /usr/local/bin/reviewdog && chmod +x /usr/local/bin/reviewdog
