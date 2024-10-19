# dynamic.yaml

```
tcp:
  routers:
    onedev-ssh:
      rule: "HostSNI(`*`)"  # Replace * with the actual host if needed
      entryPoints: "ssh"
      service: onedev-ssh-service

  services:
    onedev-ssh-service:
      loadBalancer:
        servers:
          - address: "onedev-service:6611"
```

# traefik.toml
```
[entryPoints]
  [entryPoints.web]
    address = ":80" # HTTP
  [entryPoints.websecure]
    address = ":443" # HTTPS
  [entryPoints.ssh]
    address = ":6611" # SSH
```
