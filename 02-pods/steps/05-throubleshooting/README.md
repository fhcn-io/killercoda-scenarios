It's usual to have problems with pods, containers and applications running inside them. In this section we will see how to troubleshoot them.

### Execute command inside the pod
```bash
k exec -it nginx -- ls /etc/nginx
```

### Execute shell inside the pod
```bash 
k exec -it nginx -- /bin/sh
```

### Inspect the pod with `crictl`
```bash
CRICTL_POD_ID=$(sudo crictl pods --name=nginx --namespace=default -q --no-trunc) 
crictl inspectp $CRICTL_POD_ID | less
```

### Inspect the container with `crictl`
```bash
CRICTL_POD_ID=$(sudo crictl pods --name=nginx --namespace=default -q --no-trunc) 
CRICTL_CONTAINER_ID=$(sudo crictl ps -p $CRICTL_POD_ID -q --no-trunc)
crictl inspect $CRICTL_CONTAINER_ID | less
```

### Execute command inside the container
```bash
CRICTL_POD_ID=$(sudo crictl pods --name=nginx --namespace=default -q --no-trunc) 
CRICTL_CONTAINER_ID=$(sudo crictl ps -p $CRICTL_POD_ID -q --no-trunc)
crictl exec -it $CRICTL_CONTAINER_ID ls /etc/nginx
crictl exec -it $CRICTL_CONTAINER_ID /bin/sh
```

### Inspect the pod network namespace
```bash
POD_NAME=$(k get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}')
POD_NAMESPACE=default
NETNS=$(sudo crictl inspectp $(sudo crictl pods --name=$POD_NAME --namespace=$POD_NAMESPACE -q --no-trunc) | jq -r '.info.runtimeSpec.linux.namespaces[] |select(.type=="network") | .path')
echo $NETNS
nsenter --net=${NETNS} ip addr
nsenter --net=${NETNS} ss -pant
nsenter --net=${NETNS} tcpdump -i eth-0 -n -l
```