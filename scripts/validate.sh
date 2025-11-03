#!/bin/bash
echo "Validating EKS cluster connection..."
kubectl get nodes
kubectl get pods -n default
