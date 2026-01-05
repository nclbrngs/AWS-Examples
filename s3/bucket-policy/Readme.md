## Create a bucket
aws s3 mb s3://bucket-policy-example-nb-2468

## Create bucket policy
aws s3api put-bucket-policy --bucket bucket-policy-example-nb-2468 --policy file://policy.json

## In the other account access the bucket
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-nb-2468
aws s3 ls s33://bucket-policy-example-nb-2468