## Create NACL
aws ec2 create-network-acl --vpc-id vpc-0ed80d4e4e12ff46f

## Get AMI for Amazon Linux 2
Grab the latest AML2 AMI

Amazon Linux 2023 AMI 2023.10.20260105.0 x86_64 HVM kernel-6.1

aws ec2 describe-instance-types \
--filters "Name=free-tier-eligible,Values=true" \
--query "InstanceTypes[].InstanceType" \
--region us-east-1 \
--output text

## Add Entry
aws ec2 create-network-acl-entry \
--network-acl-id acl-07177df999f10ab35 \
--ingress \
--rule-number 90 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block 180.191.181.250/32 \
--rule-action deny