#!/bin/bash
set -e

# Set your namespace and EKS cluster
NAMESPACE="default"
CLUSTER_NAME="brain-tasks-clusters"
AWS_REGION="us-east-1"
ECR_REPO="118187397376.dkr.ecr.us-east-1.amazonaws.com/brain-tasks-app"
IMAGE_TAG="latest"

echo "Logging in to EKS cluster..."
aws eks update-kubeconfig --region us-east-1 --name brain-tasks-clusters

echo "Updating deployment image in Kubernetes..."
kubectl set image deployment/brain-tasks-deployment \
  brain-tasks-container=118187397376.dkr.ecr.us-east-1.amazonaws.com/brain-tasks-app:latest \
  -n default

echo "Applying service manifest..."
kubectl apply -f /tmp/app/k8s/service.yaml -n default

echo "Deployment completed successfully."
