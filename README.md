# FIWARE Universe
FIWARE stack with enhanced security and blockchain.

## Setup (for Nginx and Let's Encrypt)
Set your domain and email in the following files:
- `compose.yaml`
- `nginx/nginx.conf`

## Usage
`./run.sh` or `docker compose up -d` to start the containers.

### Note
For a security issue on Web3 libraries, the blockchain container is empty.
Please import the smart contract manually.
