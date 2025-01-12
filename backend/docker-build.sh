#!/bin/bash

# Running the mongo image on the same network

docker stop mongo-goals-tracker-container || { echo "Error stopping the container, restarting..."; }

# - Use only while initializing
docker run -d --network goals-tracker --rm -v goals:/data/db --name mongo-goals-tracker-container mongo

docker rmi goals-tracker-backend || { echo "Error deleting the image named goals-tracker-backend, creating a new image with the same same..."; }

docker build -t goals-tracker-backend .

docker stop goals-tracker-be-container || { echo "Error deleting container with the name goals-tracker-be-container, creating a new one..."; }

docker run -d --name goals-tracker-be-container -v node-logs:/app/logs -p 80:80 --rm --network goals-tracker goals-tracker-backend