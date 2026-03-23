## Create a new bucket
aws s3api create-bucket  --bucket acl-example-nb-2468 --region us-east-1

## Turn off block public access for acls
aws s3api put-public-access-block \
    --bucket acl-example-nb-2468 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"

    aws s3api get-public-access-block --bucket acl-example-nb-2468

## Change bucket ownership
aws s3api put-bucket-ownership-controls --bucket acl-example-nb-2468 --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

## Change acls to allow for a user in another account AWS account
aws s3api put-bucket-acl \
--bucket acl-example-nb-2468 \
--access-control-policy file:///workspaces/AWS-Examples/s3/acls/policy.json