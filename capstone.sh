clone the below mentioned repo and deploy the application (run the application in port 80 [http] )
https://github.com/sriram-R-krishnan/devops-build
dockerize the application by creating a Docker file
create a docker-compose to use the above image

#!/bin/bash
git clone https://github.com/sriram-R-krishnan/devops-build
cd devops-build
sudo apt  install docker.io
create docker file
nano dockerfile
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY build/ /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]

sudo systemctl start docker

sudo docker build -t test.

sudo docker run -itd -p 80:80 test


Aranganathan Prakash
4:06 PM
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY build/ /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
Aranganathan Prakash
4:16 PM
https://github.com/AranganathanPrakash/capstone.git
ufg-rnby-omn




#!/bin/bash

# Clone the repository
git clone https://github.com/sriram-R-krishnan/devops-build
cd devops-build

# Install Docker
sudo apt update
sudo apt install -y docker.io

# Create Dockerfile
cat <<EOF > Dockerfile
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY build/ /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
EOF

# Start Docker service
sudo systemctl start docker

# Build Docker image
sudo docker build -t test .

# Run Docker container on port 80
sudo docker run -itd -p 80:80 test
