#!/bin/bash

# Ngrok for Node-RED (jofag12024@etondy.com)
# docker run --rm --network fiware_default --name ngrok \
# -e NGROK_AUTHTOKEN=2N790LnsQbKo5iF2teAKEdpJ7q0_6BEZbvZpgnEM32dnuf3sy ngrok/ngrok:latest http node-red:1880

# MongoExpress
docker run -d --rm --network fiware_default --name fe-mongo \
-e ME_CONFIG_MONGODB_SERVER=mongo-db mongo-express:latest

# Ngrok for Mongo Express
# docker run --rm --network fiware_default --name ngrok-mongo \
# -e NGROK_AUTHTOKEN=2L2kdrNlcTBcxDERiOxTW3kyEaV_3siN3rWauYmt4KLGHrHZg ngrok/ngrok:latest http fe-mongo:8081

# phpMyAdmin
docker run -d --rm --network fiware_default --name fe-mysql \
-e PMA_HOST=mysql-db -e PMA_USER=root -e PMA_PASSWORD=secret phpmyadmin:latest

# Ngrok for phpMyAdmin
# docker run --rm --network fiware_default --name ngrok-mysql \
# -e NGROK_AUTHTOKEN=2L2kdrNlcTBcxDERiOxTW3kyEaV_3siN3rWauYmt4KLGHrHZg ngrok/ngrok:latest http fe-mysql:8080

# Ngrok for MongoExpress and phpMyAdmin
docker run --rm --network fiware_default --name ngrok \
-e NGROK_CONFIG=/etc/ngrok.yml -v $(pwd)/ngrok.yml:/etc/ngrok.yml ngrok/ngrok:latest start --all
