#!/bin/bash
set -e

# Variables
NAMESPACE="default"
CLUSTER_NAME="brain-tasks-clusters"
AWS_REGION="us-east-1"
ECR_REPO="118187397376.dkr.ecr.$AWS_REGION.amazonaws.com/brain-tasks-app"
IMAGE_TAG="latest"

echo "Logging in to EKS cluster..."
aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

echo "Updating deployment image in Kubernetes..."
kubectl set image deployment/brain-tasks-deployment \
  brain-tasks-container=$ECR_REPO:$IMAGE_TAG \
  -n $NAMESPACE

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml -n $NAMESPACE
kubectl apply -f k8s/service.yaml -n $NAMESPACE

echo "Deployment completed successfully!"
