#!/bin/bash

docker rmi goals-tracker-frontend || { echo "Error deleting the image named goals-tracker-backend, creating a new image with the same same..."; }

docker build -t goals-tracker-frontend .

docker stop goals-tracker-fe-container || { echo "Error deleting container with the name goals-tracker-fe-container, creating a new one..."; }

docker run -d -p 3000:3000 --name goals-tracker-fe-container --rm --network goals-tracker goals-tracker-frontend
