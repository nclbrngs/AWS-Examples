## Create Website 1

## Create a bucket
aws s3 mb s3://cors-fun-nb-2468

## Change block public access
aws s3api put-public-access-block \
    --bucket cors-fun-nb-2468 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

## Create a bucket policy
aws s3api put-bucket-policy --bucket cors-fun-nb-2468 --policy file://bucket-policy.json

## Turn on static website hostin
aws s3api put-bucket-website --bucket cors-fun-nb-2468 --website-configuration file://website.json

## Upload our index.html file and include a resource that would be cross-origin
aws s3 cp index.html s3://cors-fun-nb-2468

## View the website and see if the index.html is there
http://cors-fun-nb-2468.s3-website-us-east-1.amazonaws.com

aws s3api get-bucket-website --bucket cors-fun-nb-2468

## Create Website 2
aws s3 mb s3://cors-fun2-nb-2468

## Change block public access
aws s3api put-public-access-block \
    --bucket cors-fun2-nb-2468 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

## Create a bucket policy
aws s3api put-bucket-policy --bucket cors-fun2-nb-2468 --policy file://bucket-policy2.json

## Turn on static website hostin
aws s3api put-bucket-website --bucket cors-fun2-nb-2468 --website-configuration file://website.json

## Upload our javascript file and include a resource that would be cross-origin
aws s3 cp hello.js s3://cors-fun2-nb-2468

## Creae API gateway with mock response and then test the endpoint
curl -X POST -H "COntent-Type: application/json" https://4cy1xtizg5.execute-api.us-east-1.amazonaws.com/prod/hello

## Set CORS on our bucket
aws s3api put-bucket-cors --bucket cors-fun-nb-2468 --cors-configuration file://cors.json
