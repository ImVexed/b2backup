# b2backup
A simple backblaze backup container

This is intended to be used for backing up anything found in the containers `/backup` directory to a Backblaze Bucket.

Typical usage of this would involve setting a Backblaze Bucket's lifecycle retention for prior version to something like 30 days, then setting this container up to mount in data directories from your database, etc. and run on a cron job nightly.

## Example usage:
```bash
docker run -e FILE_NAME=backup.7z -e ZIP_PASSWORD=p@s$w0rD -e B2_KEY_ID=... -e B2_KEY=... -e B2_BUCKET: my_bucket -v /mydir/data1:/backup/data1 -v /mydir/data2:/backup/data2 imvexxed/b2backup
```
