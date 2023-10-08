#!/bin/bash

# Check if kubernetes deployment nginx is running and return 0 if it is
kubectl get deployment nginx -n default -o jsonpath='{.status.readyReplicas}' | grep 1
