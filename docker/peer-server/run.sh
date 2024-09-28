#!/bin/sh

CMD="bin/run -m datomic.peer-server -h 0.0.0.0 -p $PORT -a $DATOMIC_ACCESS_KEY,$DATOMIC_SECRET"

if [ -n "$DATOMIC_DATABASE" ] && [ -n "$DATOMIC_STORAGE_URI" ]; then
  CMD="$CMD -d $DATOMIC_DATABASE,$DATOMIC_STORAGE_URI"
fi

for N in $(seq 1 100); do
  DB_VAR="DATOMIC_DATABASE_$N"
  URI_VAR="DATOMIC_STORAGE_URI_$N"

  DB_VALUE=$(eval echo \$$DB_VAR)
  URI_VALUE=$(eval echo \$$URI_VAR)

  if [ -n "$DB_VALUE" ] && [ -n "$URI_VALUE" ]; then
    CMD="$CMD -d $DB_VALUE,$URI_VALUE"
  fi
done

echo "$CMD"

exec $CMD
