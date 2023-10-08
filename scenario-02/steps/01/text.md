<br>

Explore the etcd directory
```
grep data-dir /etc/kubernetes/manifests/etcd.yaml
```

Log into the etcd container
```
kubectl exec -it etcd-controlplane -n kube-system -- sh
```

Explore the etcd container
```
etcdctl -h
ls /etc/kubernetes/pki/etcd/
exit
```

Check the etcd health
```
kubectl -n kube-system exec -it etcd-controlplane -- sh \
-c "ETCDCTL_API=3 \
ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt \
ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt \
ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key \
etcdctl endpoint health"
```