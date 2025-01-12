#!/bin/bash

docker stop mongo-goals-tracker-container || { echo "Error while stopping the mongo container"; }

docker stop goals-tracker-be-container || { echo "Error while stopping the backend container"; }

docker stop goals-tracker-fe-container || { echo "Error while stopping the frontend container"; }