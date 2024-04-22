#!/bin/bash

echo -e "\033[1;34mDOCKER CONTAINERS \033[0m"
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}" | sort
echo -e "\033[1;32mPress any key to continue (Enter or ESC to terminate)...\033[0m"
read -s -n 1 key && [[ $key == '' ]] || [[ $key == $'\e' ]] && echo && exit
echo

echo -e "\033[1;34mDOCKER IMAGES \033[0m"
docker ps -a --format "table {{.Networks}}\t{{.Names}}\t{{.RunningFor}}\t{{.Image}}\t{{.Command}}\t{{.Mounts}}" | sort
echo -e "\033[1;32mPress any key to continue (Enter or ESC to terminate)...\033[0m"
read -s -n 1 key && [[ $key == '' ]] || [[ $key == $'\e' ]] && echo && exit
echo

echo -e "\033[1;34mDOCKER LOGS (CTRL+C to terminate) \033[0m"
docker compose logs --tail 10 --follow
