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
aws batch register-job-definition \
--job-definition-name square-job \
--type container \
--container-properties '{ 
    "image": "378950443697.dkr.ecr.us-east-1.amazonaws.com/square", 
    "vcpus": 1, 
    "memory": 128
    }'
## Create queue
aws batch create-job-queue \
--cli-input-json file://<path_to_json_file>/LowPriority.json
-job-queue-name my-job-queue \
--state ENABLED \
--priority 10 \
--compute-environment-order 

{
  "jobQueueName": "LowPriority",
  "state": "ENABLED",
  "priority": 10,
  "computeEnvironmentOrder": [
    {
      "order": 1,
      "computeEnvironment": "M4Spot"
    }
  ]
}

## Submit a Job
aws batch submit-job \
--job-name my-job \
--job-definition square-job \
--job-queue my-job-queue 