## Register Job
aws batch register-job-definition \
--job-definition-name square-job \
--type container \
--container-properties '{"image": "my-docker-image"}'

## Log in to ECR
aws ecr get-login-password --region us-east-1 | docker login \
--username AWS \
--password-stdin 378950443697.dkr.ecr.us-east-1.amazonaws.com

## Build Image
docker build -t app .
docker build -t square .

## Tag your image so you can push the image to this repository
docker tag square:latest 378950443697.dkr.ecr.us-east-1.amazonaws.com/square:latest

## Push this image to your newly created AWS repository
docker push 378950443697.dkr.ecr.us-east-1.amazonaws.com/square:latest

## Register job description
(by default, EC2)

aws batch register-job-definition \
--job-definition-name square-job \
--type container \
--container-properties '{ 
    "image": "378950443697.dkr.ecr.us-east-1.amazonaws.com/square", 
    "vcpus": 1, 
    "memory": 128
    }'

(by Fargate)

aws batch register-job-definition \
  --job-definition-name square-job \
  --type container \
  --platform-capabilities FARGATE \
  --container-properties '{
    "image": "378950443697.dkr.ecr.us-east-1.amazonaws.com/square",
    "executionRoleArn": "arn:aws:iam::378950443697:role/ECSExecutionRole",
    "resourceRequirements": [
      { "type": "VCPU", "value": "1" },
      { "type": "MEMORY", "value": "2048" }
    ]
  }'

## Create Compute Env
aws batch create-compute-environment \
--computeEnvironmentName my-compute-env \
--type MANAGED \
--computeResources  minvCpus=0, maxvCpus=1, desiredvCpus=1, instanceTypes=m4.16xlarge, subnets=subnet-05493b191ec29a308, securityGroupIds=sg-06e209e947a236d37 \
--serviceRole arn:aws:iam::378950443697:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch

## Create queue
aws batch create-job-queue \
--job-queue-name my-job-queue \
--state ENABLED \
--priority 10 \
--compute-environment-order '[
    {
      "order": 1,
      "computeEnvironment": "arn:aws:batch:us-east-1:378950443697:compute-environment/ComputeEnv"
    }
  ]'

## Submit a Job
aws batch submit-job \
--job-name my-job \
--job-definition square-job \
--job-queue my-job-queue1

