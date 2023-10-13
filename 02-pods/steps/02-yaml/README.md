
The manifests are used to create and update the objects in the cluster. The manifests can be in the form of YAML or JSON and should include the following:

* `apiVersion` - Which version of the Kubernetes API you're using to create this object
* `kind` - What kind of object you want to create
* `metadata` - Data that helps uniquely identify the object, including a name string, `UID`, and optional `namespace`
* `spec` - What state you desire for the object

### Show the YAML behind the pod named `nginx`.

kubectl supports the --dry-run flag that can be used to preview the object that would be sent to your cluster, without really submitting it into the cluster, and without saving it to a file. 

```bash
k run nginx --image=nginxdemos/hello:plain-text --dry-run=client -o yaml
```

### Export the pod named `nginx` on YAML format.
```bash
k run nginx --image=nginxdemos/hello:plain-text --dry-run=client -o yaml > nginx.yaml
```

### Edit the YAML file.
```bash
vim nginx.yaml
```

### Create the pod named `nginx` from the YAML file.
```bash
k create -f nginx.yaml
```
