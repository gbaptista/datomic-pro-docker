FROM clojure:temurin-22-tools-deps-bookworm-slim

  RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

  RUN curl https://d21wuulm8q5nm1.cloudfront.net/1.0.7187/datomic-pro-1.0.7187.zip \
        -o datomic-pro.zip \
        && echo "1107dc89c3bc0896a02458d34a875143  datomic-pro.zip" | md5sum -c - \
        && unzip datomic-pro.zip \
        && mv datomic-pro-1.0.7187 /usr/datomic-pro \
        || exit 1

RUN curl -L https://github.com/xerial/sqlite-jdbc/releases/download/3.47.0.0/sqlite-jdbc-3.47.0.0.jar \
        -o sqlite-jdbc-3.47.0.0.jar \
        && echo "93d47c006377c476f8f7b45d00d20606b77d5951423f346ef56b5b081361c2d3  sqlite-jdbc-3.47.0.0.jar" | sha256sum -c - \
        && mv sqlite-jdbc-3.47.0.0.jar /usr/datomic-pro/lib \
        || exit 1

FROM clojure:temurin-22-tools-deps-bookworm-slim

  RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

  RUN curl -L https://github.com/babashka/babashka/releases/download/v1.4.192/babashka-1.4.192-linux-amd64-static.tar.gz \
        -o babashka-static.tar.gz \
        && echo "fe0689305aa5fa7f17414b8204164d98  babashka-static.tar.gz" | md5sum -c - \
        && tar -xzf babashka-static.tar.gz -C /usr \
        || exit 1

FROM clojure:temurin-22-tools-deps-bookworm-slim

  RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

  COPY --from=0 /usr/datomic-pro /usr/datomic-pro
  COPY --from=1 /usr/bb /usr/local/bin/bb

  WORKDIR /usr/datomic-pro

  CMD hostname -i | bb /usr/config/generate-properties.clj && \
      bin/transactor config/transactor.properties
