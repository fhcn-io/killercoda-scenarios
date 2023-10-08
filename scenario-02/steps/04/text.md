<br>

Show the service
```
kubectl get svc nginx
```

Show the endpoints
```
kubectl get ep nginx
```

Make a request to the service
```
curl xxx.xxx.xxx.xxx:80
```

Make a request to the endpoint
```
curl xxx.xxx.xxx.xxx:80
```

Inspect the pod network namespace
```
POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}')
POD_NAMESPACE=default
NETNS=$(sudo crictl inspectp $(sudo crictl pods --name=$POD_NAME --namespace=$POD_NAMESPACE -q --no-trunc) | jq -r '.info.runtimeSpec.linux.namespaces[] |select(.type=="network") | .path')
echo $NETNS
nsenter --net=${NETNS} ip addr
nsenter --net=${NETNS} ss -pant
nsenter --net=${NETNS} tcpdump -i eth-0 -n -l
```