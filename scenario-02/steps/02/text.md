<br>

Show the deployment named `nginx` on YAML format.
```
kubectl get deployment nginx -o yaml
```

Export the deployment named `nginx` on YAML format.
```
kubectl get deployment nginx -o yaml > nginx.yaml
```

Delete the deployment named `nginx`.
```
kubectl delete deployment nginx
```

Create the deployment named `nginx` from the YAML file.
```
kubectl create -f nginx.yaml
```