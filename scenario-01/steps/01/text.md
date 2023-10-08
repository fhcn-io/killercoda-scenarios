<br>

Create a new deployment named `nginx` with the image `nginxdemos/hello:plain-text`.
```
kubectl create deployment nginx --image=nginxdemos/hello:plain-text
```

Check the deployment
```
kubectl get deployments
```

Check the pods
```
kubectl get pods
```

Check the events
```
kubectl get events
```

Describe the deployment named `nginx`.
```
kubectl describe deployment nginx
```

