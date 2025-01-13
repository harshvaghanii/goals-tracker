#!/bin/bash

docker stop mongo-goals-tracker-container || { echo "Error while stopping the mongo container"; }

docker stop goals-tracker-be-container || { echo "Error while stopping the backend container"; }

docker stop goals-tracker-fe-container || { echo "Error while stopping the frontend container"; }

docker rmi goals-tracker-frontend || { echo "Error while deleting the backend image"; }

docker rmi goals-tracker-backend || { echo "Error while deleting the frontend image"; }

docker rmi mongo || { echo "Error while deleting the mongo image"; }