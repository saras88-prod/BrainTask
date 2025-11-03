#!/bin/bash
echo "Verifying rollout of deployment..."
kubectl rollout status deployment/brain-tasks-deployment -n default
