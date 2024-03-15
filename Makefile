# Load environment variables from .env file
include .env
export

# Define phony targets (targets that are not actual files)
.PHONY: up deploy

# Target to start the Docker containers
up:
	@docker compose up

# Target for deployment
deploy:
	@echo "Deploying your application..."
	ssh $(SSH_SERVER) 'cd /app && git pull origin main && docker compose up --force-recreate'
	@echo "Deployment successful!"
