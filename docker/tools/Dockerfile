FROM clojure:temurin-21-tools-deps-bookworm-slim

RUN apt-get update && apt-get install -y curl unzip postgresql-client && rm -rf /var/lib/apt/lists/*

RUN curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash

RUN curl \
      https://datomic-pro-downloads.s3.amazonaws.com/1.0.7021/datomic-pro-1.0.7021.zip \
      -o datomic-pro.zip \
      && unzip datomic-pro.zip \
      && mv datomic-pro-1.0.7021 /usr/datomic-pro

RUN curl \
      https://s3.amazonaws.com/mbrainz/datomic-mbrainz-1968-1973-backup-2017-07-20.tar \
      -o mbrainz.tar \
      && tar -xvf mbrainz.tar -C /usr/

ADD deps.edn /usr/datomic-pro

RUN cd /usr/datomic-pro && clojure -P -M:repl

WORKDIR /usr/datomic-pro
