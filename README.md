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
