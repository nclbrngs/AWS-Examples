## Convert to json
The command
yq -o=json '.' policy.yaml > policy.json

The bash script
./convert

## Create iam policy
aws iam create-policy \
--policy-name my-fun-policy \
--policy-document file://policy.json

## Attach Policy to user
aws iam attach-user-policy \
--policy-arn arn:aws:iam::378950443697:policy/my-fun-policy \
--user-name aws-examples

## Deleting Policy
aws iam delete-policy-version \
--policy-arn arn:aws:iam::123456789012:policy/MyPolicy \
--version-id v2

