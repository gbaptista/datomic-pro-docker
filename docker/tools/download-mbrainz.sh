#!/bin/sh

if [ ! -f "/usr/mbrainz.ready" ]; then
  echo "Backup has not been downloaded yet, cleaning up potential incomplete downloads..."

  rm -f datomic-mbrainz-backup.tar
  rm -rf /usr/mbrainz-1968-1973

  echo "Downloading datomic-mbrainz-1968-1973-backup-2017-07-20.tar..."
  curl \
    https://s3.amazonaws.com/mbrainz/datomic-mbrainz-1968-1973-backup-2017-07-20.tar \
    -o datomic-mbrainz-backup.tar

  echo "Checking integrity of downloaded file... [063a8b80e53023f0c7694792230b72a6]"
  echo "063a8b80e53023f0c7694792230b72a6  datomic-mbrainz-backup.tar" \
    | md5sum -c - \
    || exit 1

  echo "Extracting downloaded file..."
  tar -xvf datomic-mbrainz-backup.tar -C /usr/

  touch /usr/mbrainz.ready
  echo "Extraction completed; backup available to be restored."

else
  echo "Backup already downloaded and available to be restored."
fi
