## Create Buckets
aws s3 mb s3://source-datasync-2468
aws s3 mb s3://dest-datasync-2468

## Upload File
touch hello.txt
aws s3 cp hello.txt s3://source-datasync-2468/data/hello.txt