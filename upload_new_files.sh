#!/bin/bash

BUCKET_NAME=gs://world-data-pro/
BASE_DIR=$HOME/wdl/Mpro_2.0/

cd $BASE_DIR

gsutil -m cp -nr . $BUCKET_NAME