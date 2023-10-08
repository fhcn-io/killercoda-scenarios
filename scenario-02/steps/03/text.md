<br>

The `expose` command
```
kubectl expose -h
```

Expose your deployment
```
kubectl expose deployment/nginx
```

You will likely get an error message like this:
```
error: couldn't find port via --port flag or introspection
```

This is because the nginx deployment does not expose any ports and the `expose` command does not know which port to expose.

There are two ways to fix this. The first is to specify the port on the command line:
```
kubectl expose deployment/nginx --port 80
```

The second is to edit the deployment and add the port to the container spec:
```
kubectl edit deployment/nginx
```

Add the following to the container spec:
```
        ports:
        - containerPort: 80
          protocol: TCP
```

