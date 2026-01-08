## Create a user with no permissions
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table

Copy the access key and secret access key here
aws configure

Then edit credentials file to change away from default profile

Test who you are:
aws sts get-caller-identity --profile sts

Make sure you don't have an access to S3
aws s3 ls --profile sts

## Create a Role
chmod u+x bin/deploy
./bin/deploy

## Use newuser credentials and assume roles
aws iam put-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json

aws sts assume-role \
--role-arn arn:aws:iam::378950443697:role/my-sts-fun-stack-StsRole-iv15lcZeqOpH \
--role-session-name s3-sts-fun \
--profile sts

aws sts get-caller-identity --profile assumed

## Cleanup
aws iam delete-access-key \
--access-key id \
-user-name-sts-machine-user

aws iam delete-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy 

aws iam delete-user --user-name sts-machine-user

