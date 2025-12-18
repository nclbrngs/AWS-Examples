## Create a bucket
aws s3 mb s3://class-fun-nb-2468

## Create a file
echo "Hello World!" > hello.txt
aws s3 cp hello.txt s3://class-fun-nb-2468 --storage-class STANDARD_IA