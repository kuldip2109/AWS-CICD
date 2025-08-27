#!/bin/bash
# Stop existing container
docker stop $(docker ps -q) || true
docker rm $(docker ps -aq) || true

# Pull latest image from ECR
docker pull 414819400975.dkr.ecr.ap-south-1.amazonaws.com/flask-app:latest

# Run container
docker run -d -p 80:5000 414819400975.dkr.ecr.ap-south-1.amazonaws.com/flask-app:latest
