#!/bin/bash

cd backend

./docker-build.sh

cd ../frontend

./docker-build.sh

cd ..