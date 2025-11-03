#!/bin/bash
echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml -n dev
kubectl apply -f k8s/service.yaml -n dev
