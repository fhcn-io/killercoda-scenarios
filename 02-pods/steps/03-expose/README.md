### The `expose` command
```bash
k expose -h
```

### Failing to expose

```bash
k expose pod/nginx
```

You will likely get an error message like this:
```bash
error: couldn't find port via --port flag or introspection
```

This is because the nginx pod does not define any containerPort so the `expose` command does not know which port to expose.

## Exposing a pod with no containerPort
There are two ways to fix this. The first is to specify the port on the command line:
```bash
k expose pod/nginx --port 80
```

## Edit the pod and then expose
The second is to edit the pod and add the port to the container spec:
```bash
k edit pod/nginx
```

Add the following to the container spec:
```yaml
      ports:
      - containerPort: 80
        protocol: TCP
```
Save and exit the editor.

Now you can expose the pod:
```bash
k expose pod/nginx
```

