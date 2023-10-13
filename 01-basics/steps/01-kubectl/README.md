By this step you should already be familiar with the basics of Kubernetes, so now you are going to learn how to use `kubectl` to interact with Kubernetes.

# kubectl overview

```bash
kubectl --help
```

## Know the version
```bash
kubectl version
```

## Get the current context
```bash
kubectl config current-context
```

## Print the client and server version
```bash
kubectl cluster-info
```

## List the nodes in the current cluster
```bash
kubectl get nodes
```
### Wide output
```bash
kubectl get nodes -o wide
```

### Print on YAML
```bash
kubectl get nodes -o yaml
```

### Print on JSON
```bash
kubectl get nodes -o json
```
### Print specific fields
```bash
kubectl get nodes -o jsonpath='{.items[0].status.nodeInfo.osImage}'
```

## Aliases

```bash
alias k=kubectl
k get nodes
```

