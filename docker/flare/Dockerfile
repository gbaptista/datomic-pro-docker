FROM clojure:temurin-22-tools-deps-bookworm-slim

  RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

  RUN curl -L https://github.com/gbaptista/datomic-flare/archive/refs/tags/v1.0.0.tar.gz \
        -o datomic-flare.tar.gz \
        && echo "915bf90f5b74d8ba783158c8d04c3012  datomic-flare.tar.gz" | md5sum -c - \
        && tar -xzf datomic-flare.tar.gz -C /usr \
        && mv /usr/datomic-flare-1.0.0 /usr/datomic-flare \
        || exit 1

FROM clojure:temurin-22-tools-deps-bookworm-slim

  RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

  COPY --from=0 /usr/datomic-flare /usr/datomic-flare

  RUN cd /usr/datomic-flare && clj -P -M:run

  WORKDIR /usr/datomic-flare

  CMD clj -M:run
