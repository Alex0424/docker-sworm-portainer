```
curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/auth" -X POST --data "{\"username\": \"$portainer_username\", \"password\": \"$portainer_password\"}"
```
```
curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/stacks" -X GET -H "authorization: Bearer $token" | jq
```
