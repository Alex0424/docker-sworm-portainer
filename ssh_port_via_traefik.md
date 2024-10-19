# Can you even expose OneDev's ssh port via traefik? If not, why?

Yes, you can expose OneDev's ssh port via traefik but there are some considirations:

Traefik is primarily an HTTPS(S) reverse proxy, meaning it routes HTTP and HTTPS traffic to services. While SSH is not an HTTPS protocol so traefik dosen't nativly support SSH proxying. But there are ways to expose non-HTTP services through Traefik using TCP routers.

SSH doesn't use the same protocol as HTTP, meaning features like TLS termination would work differently.

This could conflict becouse HTTP/HTTPS

exposing SSH publicly is more vulnerable, so thats why stricting firewall, authentication, priviliges, and ip's is important (im not showing how to improve security here tho).

so in order to setup SSH for OneDev do this:

add this labels blocks to docker-compose file(under onedev service):
```
labels:
      - traefik.enable=true
      - traefik.tcp.routers.onedev-ssh.rule=HostSNI(`*`)
      - traefik.tcp.routers.onedev-ssh.entrypoints=ssh  # add ssh in entrypoint in Traefik see below
      - traefik.tcp.routers.onedev-ssh.service=onedev-ssh-service
      - traefik.tcp.services.onedev-ssh-service.loadbalancer.server.port=6611  # OneDev SSH port
```



# dynamic.yaml

```
tcp:
  routers:
    onedev-ssh:
      rule: "HostSNI(`*`)" 
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
