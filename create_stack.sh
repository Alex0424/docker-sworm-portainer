#!/bin/bash

read -p "Enter the name of the Docker Compose file (must be in the same directory) that you want to deploy: " compose_file
read -p "Enter the name of the stack you want to create: " stack_name

portainer_token=$(curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/auth" -X POST --data "{\"username\": \"$portainer_username\", \"password\": \"$portainer_password\"}" | jq -r '.jwt')

curl -X POST "https://portainer.labb.doe23-swarm.chasacademy.dev/api/stacks/create/swarm/file" \
-H "Authorization: Bearer $portainer_token" \
-H "Content-Type: multipart/form-data" \
-F "Name=$stack_name" \
-F "Env=[{\"name\": \"db_pass\", \"value\": \"$db_pass\"}]" \
-F "SwarmID=1" \
-F "file=@./$compose_file" \
-F "endpointId=1"
