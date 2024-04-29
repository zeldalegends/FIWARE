# FIWARE Universe
FIWARE stack with enhanced security and blockchain.

## Setup (for Nginx and Let's Encrypt)
Set your domain and email in the following files:
- **compose.yaml***
- **nginx/nginx.conf**
- **run.sh**

## Usage
Initialize containers with:
- `$ ./run.sh` (first time)

Run containers with:
- `$ docker compose up -d` (or `$ ./run.sh`)

Stop containers with:
- `$ docker compose down` (or `$ ./stop.sh`)

## MVP
**docker-compose.yml**
```
services:

  # Orion Context Broker LD
  orion:
    image: fiware/orion-ld:1.5.1
    depends_on:
      - mongo-db
    restart: always
    ports:
      - "1026:1026" # http://localhost:1026
    command: -dbhost mongo-db -logLevel DEBUG -forwarding # -db orion -experimental
    healthcheck:
      test: curl --fail -s http://orion:1026/version || exit 1

  # Mongo DB for Orion
  mongo-db:
    image: mongo:4.4
    container_name: db-mongo
    restart: always
    command: --nojournal
    volumes:
      - mongo-db:/data/db
    healthcheck:
      test: mongo --eval "db.adminCommand('ping')" --quiet

volumes:
  mongo-db: ~
```
