#!/bin/bash
set -e

# Variables
AWS_REGION="us-east-1"
CLUSTER_NAME="brain-tasks-clusters"
ECR_REPO="118187397376.dkr.ecr.$AWS_REGION.amazonaws.com/brain-tasks-app:latest"
NAMESPACE="default"
DEPLOYMENT_NAME="brain-tasks-deployment"
SERVICE_FILE="/tmp/app/k8s/service.yaml"
DEPLOYMENT_FILE="/tmp/app/k8s/deployment.yaml"

echo "Updating kubeconfig..."
aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

echo "Applying Kubernetes deployment..."
kubectl apply -f $DEPLOYMENT_FILE -n $NAMESPACE

echo "Updating deployment image..."
kubectl set image deployment/$DEPLOYMENT_NAME brain-tasks-container=$ECR_REPO -n $NAMESPACE

echo "Applying service manifest..."
kubectl apply -f $SERVICE_FILE -n $NAMESPACE

echo "Deployment completed successfully!"
