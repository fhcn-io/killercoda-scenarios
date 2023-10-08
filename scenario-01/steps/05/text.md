<br>

Scale the deployment
```
kubectl scale deployment/nginx --replicas 3
```

Show the pods
```
kubectl get pods -l app=nginx
```

Show the endpoints
```
kubectl get ep nginx
```

Delete one of the pods
```
POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}')
kubectl delete pod $POD_NAME
```

Show the pods
```
kubectl get pods -l app=nginx
``` 

Make a request to the service
```
SERVICE_IP=$(kubectl get svc nginx -o jsonpath='{.spec.clusterIP}')
curl http://$SERVICE_IP
```
