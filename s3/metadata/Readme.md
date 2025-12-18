## Create a bucket

aws s3 mb s3://metadata/fun-nb-2468

## Create a new file
echo "Hello Mars!" > hello.txt

## Upload file with metadata
aws s3api put-object --bucket metadata-fun-nb-2468 --key hello.txt --body hello.txt --metadata Planet=Mars

## Get metadata through head object
aws s3api head-object --bucket metadata-fun-nb-2468 --key hello.txt 