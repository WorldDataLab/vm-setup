# Adding and removing files from Google Cloud Storage.

## Downloading
These scripts download files from a bucket to a local directory on a VM.

First, edit `file_manifest` to list all of the files you'd like to download from GCS to your VM.  Then, run `./download_manifest.sh` to download the files.  The script will match GCS paths to local paths, so that

```bash
gs://world-data-pro/01_Data/R_2023_12_31/2023_12_31_apple_irq_2020_2017ppp/02_intermediary_data/01_012_india_survey_means.rds
```

downloads to

```bash
$BASE_DIR/01_Data/R_2023_12_31/2023_12_31_apple_irq_2020_2017ppp/02_intermediary_data/01_012_india_survey_means.rds
```

You can edit `BASE_DIR` within `download_manifest.sh` to set the target directory.

## Uploading

New files can be uploaded to GCS using `./upload_new_files.sh`.  This is take any new files located at `$BASE_DIR` and upload them to `gs://world-data-pro/` at the correct spot.  Again, you can change `$BASE_DIR` within `download_manifest.sh` to change the location you are uploading from.