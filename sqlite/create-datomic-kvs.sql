CREATE TABLE datomic_kvs (
    id TEXT NOT NULL,
    rev INTEGER,
    map TEXT,
    val BYTEA,
    CONSTRAINT pk_id PRIMARY KEY (id)
);