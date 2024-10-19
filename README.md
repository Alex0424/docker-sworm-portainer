# Deploy a stack in sworm portainer with docker-compose file


Access api in order to have deploy/delete access e.g.:
```
curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/auth" -X POST --data "{\"username\": \"$portainer_username\", \"password\": \"$portainer_password\"}"
```
```
curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/stacks" -X GET -H "authorization: Bearer $token" | jq
```
