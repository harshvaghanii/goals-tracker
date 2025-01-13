## ***Dockerizing a MERN Stack APP***

#### Hey Guys, this project is about dockerizing a simple MERN stack app that has a basic functionality of CREATE, READ and DELETE. It is a Goals Tracker App, where you can simply add some goals and delete them by clicking on the list. The main intention of this project was to learn the process of creating docker images and running them in different containers while maintaing communication between these containers and also persisting storage in MongoDB using Docker Volumes.

---

### Steps to Clone and Run this app

- Make sure you have Docker desktop installed and running on your system

- Clone this repository using 
```bash
git clone https://github.com/harshvaghanii/goals-tracker.git
```

- I've added some shell files that should take care of setting up everything in docker desktop, make sure you make them executable using `chmod +x <file_name>`

- If you're on the root directory of this repository, you can use the below commands to make the script executable. `(The last one is optional).`

```bash
chmod +x /backend/docker-build.sh
chmod +x /frontend/docker-build.sh
chmod +x docker.sh
chmod +x docker-terminate.sh
chmod +x dependency.sh
```

- Make sure you're in the root directory of the repository

- Run the docker shell file using
```bash 
./docker.sh
```

- This will download the `mongo:latest` image from official docker hub and will build the `backend` as well as the `frontend` images. It will then run these images in a container.

- The App should be accessible on `localhost:3000`

- To stop the application, run the following script while making sure you're in the root directory of the repository
```bash
./docker-terminate.sh
```

- The `docker-terminate` script will also delete the 3 images that were downloaded for this project. You can reinstall them anytime by running `./docker.sh`. However, this will take some time since it installs `mongo` image and also rebuilds the `frontend` and the `backend` image every single time. If you don't wish to modify the code, feel free to comment all the lines that start with `docker rmi` in the `docker-terminate` script and this will ensure not deleting the image.

- Feel free to let me know if there are any issues running the file


### Docker Commands Used (Along with description)

```bash
docker build -t goals-tracker-backend .
```

This is used to create a docker image based on the Dockerfile in the current directory. The -t flag is used to add a custom tag-name to the image

```bash
docker run -d --name goals-tracker-be-container -v node-logs:/app/logs -p 80:80 --rm --network goals-tracker goals-tracker-backend
```

This command is used to run the image `goals-tracker-backend` with a few specifications. The name of the container running that image should be `goals-tracker-be-container`, it should persist the logs in a Volume named `node-logs`, it should expose the port 80 of the docker vm to our local machine (localhost) and it is added to a docker network called `goals-tracker` (This is because of enabling communication between different containers).

```bash
docker run -d --network goals-tracker --name mongo-goals-tracker-container mongo
```

I essentially ran this command just once to create a separate container that downloads mongo from dockerhub and runs it in detach mode. This container is also added to the network named `goals-tracker` and the container has a custom name `mongo-goals-tracker-container`.

```bash
docker build -t goals-tracker-frontend .
```

This is used to create a docker image of the React App. Make sure to run this command in the frontend directory.

```bash
docker run -d -p 3000:3000 --name goals-tracker-fe-container --rm --network goals-tracker goals-tracker-frontend
```

This is used to run the react app image which is `goals-tracker-frontend` in a container named `goals-tracker-fe-container` on detached mode. It allows access to `PORT 3000` of the docker virtual machine from the localhost. The `--rm` flag deleted the container when it is stopped.