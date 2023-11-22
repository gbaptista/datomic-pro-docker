FROM clojure:temurin-21-tools-deps-bookworm-slim

RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

RUN curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash

RUN curl \
      https://datomic-pro-downloads.s3.amazonaws.com/1.0.7021/datomic-pro-1.0.7021.zip \
      -o datomic-pro.zip \
      && unzip datomic-pro.zip \
      && mv datomic-pro-1.0.7021 /usr/datomic-pro

WORKDIR /usr/datomic-pro

CMD bin/console -p 8080 dev $DB_URI
