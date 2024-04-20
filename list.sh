#!/bin/bash

echo -e "\033[1;36mDOCKER CONTAINERS \033[0m"
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}" | sort
read -s -n 1 key && [[ $key == $'\e' ]] && exit

echo -e "\033[1;36mDOCKER IMAGES \033[0m"
docker ps -a --format "table {{.Networks}}\t{{.Names}}\t{{.RunningFor}}\t{{.Image}}\t{{.Command}}\t{{.Mounts}}" | sort
read -s -n 1 key && [[ $key == $'\e' ]] && exit

echo -e "\033[1;36mDOCKER LOGS \033[0m"
docker compose logs --tail 10 --follow
