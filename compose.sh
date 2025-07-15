#!/usr/bin/env bash
# compose.sh

# Exit on first error
set -e

# Load env variables from myvars.env
set -o allexport
source .env.prod
set +o allexport

# Run docker compose (adjust file if yours is docker-compose.dev.yaml)
docker compose -f docker-compose.yaml up -d