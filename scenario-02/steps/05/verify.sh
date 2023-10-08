#!/bin/bash

# Check if nginx deployment has 3 replicas
kubectl get deployment nginx -n default -o jsonpath='{.spec.replicas}' | grep 3
