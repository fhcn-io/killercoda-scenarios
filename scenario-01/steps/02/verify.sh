#!/bin/bash

# Check if nginx.yaml exists and if kubernetes deployment nginx is running and return 0 if it is if not return 1

if [ -f nginx.yaml ]; then
    kubectl get deployment nginx -n default -o jsonpath='{.status.readyReplicas}' | grep 1
else
    echo "nginx.yaml does not exist"
    exit 1
fi
