#!/bin/bash

BUCKET_NAME=gs://world-data-pro/
BASE_DIR=$HOME/wdl/Mpro_2.0/

for f in $(cat file_manifest)
do
  gsutil cp $f ${f/$BUCKET_NAME/$BASE_DIR}
done