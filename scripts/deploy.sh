#!/bin/bash
set -e

# Login to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 414819400975.dkr.ecr.ap-south-1.amazonaws.com

# Stop and remove old container (only flask-container, not all)
docker stop flask-container || true
docker rm flask-container || true

# Remove old image (optional, to ensure fresh pull)
docker rmi 414819400975.dkr.ecr.ap-south-1.amazonaws.com/flask-app:latest || true

# Pull latest image
docker pull 414819400975.dkr.ecr.ap-south-1.amazonaws.com/flask-app:latest

# Run new container
docker run -d --name flask-container -p 80:5000 414819400975.dkr.ecr.ap-south-1.amazonaws.com/flask-app:latest
