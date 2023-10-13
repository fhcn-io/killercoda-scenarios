The `k8s` objects are persistent entities in the Kubernetes system. Kubernetes uses these entities to represent the state of your cluster. Specifically, they can describe:

* What containerized applications are running (and on which nodes)
* The resources available to those applications
* The policies around how those applications behave, such as restart policies, upgrades, and fault-tolerance

The manifests are used to create and update the objects in the cluster. The manifests can be in the form of YAML or JSON and should include the following:

* `apiVersion` - Which version of the Kubernetes API you're using to create this object
* `kind` - What kind of object you want to create
* `metadata` - Data that helps uniquely identify the object, including a name string, `UID`, and optional `namespace`
* `spec` - What state you desire for the object

### API Resources 
```bash
k api-resources
```
### Pods
```bash
k explain pods
```
```bash
k explain pods.apiVersion
k explain pods.kind
k explain pods.metadata
k explain pods.spec
```
```bash
k explain pods.spec.containers
```
```bash
k get pods --all-namespaces
```

### Labels
```bash
k explain pods.metadata.labels
```

### Selectors
```bash
k get pods -l component=kube-apiserver --all-namespaces
```

### Namespaces
```bash
k explain namespaces
```
```bash
k get namespaces
```

### Annotations
```bash
k explain pods.metadata.annotations
```

### Field Selectors
```bash
k get pods --field-selector status.phase=Running  --all-namespaces
```

### Finalizers
```bash
k explain pods.metadata.finalizers
```

## References

* [Kubernetes Objects Overview](https://kubernetes.io/docs/concepts/overview/working-with-objects)