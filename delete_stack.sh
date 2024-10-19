#!/bin/bash

read -p "Please enter stack name to delete: " stack_name

portainer_token=$(curl "https://portainer.labb.doe23-swarm.chasacademy.dev/api/auth" -X POST --data "{\"username\": \"$portainer_username\", \"password\": \"$portainer_password\"}" | jq -r '.jwt')

stack_id=$(curl -s -X GET "https://portainer.labb.doe23-swarm.chasacademy.dev/api/stacks" -H "Authorization: Bearer $portainer_token" | jq -r ".[] | select(.Name==\"$stack_name\") | .Id")

echo "Deleting stack with ID: $stack_id"

curl -X DELETE "https://portainer.labb.doe23-swarm.chasacademy.dev/api/stacks/$stack_id" \
-H "Authorization: Bearer $portainer_token" \
-F "endpointId=1"

echo "Stack deleted."
