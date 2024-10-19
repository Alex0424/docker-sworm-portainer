# API with sworm portainer

## API with a token is usefull becouse then you can deploy/delete/modify your stacks

### how to get an API token:
```
curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/auth" -X POST --data "{\"username\": \"$portainer_username\", \"password\": \"$portainer_password\"}"
```

### EXAMPLE: how to use API with a token:
```
curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/stacks" -X GET -H "authorization: Bearer $token" | jq
```

### All Portainer API's commands:
https://app.swaggerhub.com/apis/portainer/portainer-ce/2.21.3#/stacks/StackCreateDockerStandaloneFile
