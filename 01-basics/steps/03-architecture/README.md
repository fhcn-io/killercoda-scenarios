
# Control Plane Components
```bash
k get pods -n kube-system
```

## kube-apiserver
```bash
k describe pod kube-apiserver-controlplane -n kube-system | less
k describe pod -l component=kube-apiserver -n kube-system | less
less /etc/kubernetes/admin.conf 
```

## etcd
```bash
k describe pod etcd-controlplane -n kube-system | less
k describe pod -l component=etcd -n kube-system | less
ls /etc/kubernetes/pki/etcd/
```

## kube-scheduler
```bash
k describe pod kube-scheduler-controlplane -n kube-system | less
k describe pod -l component=kube-scheduler -n kube-system | less
less /etc/kubernetes/scheduler.conf
```

## kube-controller-manager
```bash
k describe pod kube-controller-manager-controlplane -n kube-system | less
k describe pod -l component=kube-controller-manager -n kube-system | less
less /etc/kubernetes/controller-manager.conf
```

# Kubernetes Node Components

Give a look at the [Kubernetes Node Components](https://kubernetes.io/docs/concepts/architecture/nodes/).

## Nodes
```bash
k get nodes
k get nodes -o wide
```

## kubelet
```bash
systemctl status kubelet
journalctl -xefu kubelet
less /etc/kubernetes/kubelet.conf
```

## kube-proxy
```bash
k describe pod -l k8s-app=kube-proxy -n kube-system | less
k describe cm -l app=kube-proxy -n kube-system | less
```

### Kubernetes Addons

```bash
k get pods -l k8s-app!=kube-proxy,\
component!=kube-apiserver,\
component!=etcd,\
component!=kube-scheduler,\
component!=kube-controller-manager -n kube-system
```

### Components Health Checks
```bash
kubectl get componentstatuses # deprecated
kubectl get --raw='/readyz?verbose'
curl -k https://localhost:6443/livez?verbose
```

## References
* [Kubernetes Components](https://kubernetes.io/docs/concepts/overview/components/).
* [Kubernetes Control Plane Components](https://kubernetes.io/docs/concepts/overview/components/#control-plane-components).
