Pods are the smallest deployable units of computing that you can create and manage in Kubernetes, you are going to work with a pod named `nginx` and the image `nginxdemos/hello:plain-text`.

### Create a Pod
```bash
k run nginx --image=nginxdemos/hello:plain-text
```

### Check the pod
```bash
k get pods
```

### Check pod details
```bash
k get pods -o wide
```

### Check pod logs
```bash
k logs nginx
```

### Describe the pod named `nginx`.
```bash
k describe pod nginx
```

### Delete the pod
```bash
k delete pods
```

### Check the events
```bash
k get events
```

