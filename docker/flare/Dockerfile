FROM clojure:temurin-22-tools-deps-bookworm-slim

RUN apt-get update && apt-get install -y curl git unzip iputils-ping postgresql-client && rm -rf /var/lib/apt/lists/*

RUN curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash

RUN git clone --branch v1.0.0 --single-branch https://github.com/gbaptista/datomic-flare.git /usr/datomic-flare

RUN cd /usr/datomic-flare && clj -P -M:run

WORKDIR /usr/datomic-flare

CMD clj -M:run
