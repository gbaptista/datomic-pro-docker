FROM clojure:temurin-22-tools-deps-bookworm-slim

  RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

  RUN curl https://d21wuulm8q5nm1.cloudfront.net/1.0.7187/datomic-pro-1.0.7187.zip \
        -o datomic-pro.zip \
        && echo "1107dc89c3bc0896a02458d34a875143  datomic-pro.zip" | md5sum -c - \
        && unzip datomic-pro.zip \
        && mv datomic-pro-1.0.7187 /usr/datomic-pro \
        || exit 1

FROM clojure:temurin-22-tools-deps-bookworm-slim

  COPY --from=0 /usr/datomic-pro /usr/datomic-pro

  COPY run.sh /usr/local/bin/run.sh

  RUN chmod +x /usr/local/bin/run.sh

  WORKDIR /usr/datomic-pro

  CMD ["/usr/local/bin/run.sh"]
