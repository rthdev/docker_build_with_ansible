#!/bin/bash

# Define your commands here, do not forget the last newline
COMMANDS="docker search nginx
docker build -f Dockerfile.v1.0 -t localhost:5000/kbus_base:v1.0 .
docker build -f Dockerfile.v1.1 -t localhost:5000/kbus_base:v1.1 .
docker images | grep kbus
docker run -dit --name kbus_app -p 12380:80 localhost:5000/kbus_base:v1.0
docker ps | grep kbus
curl localhost:12380
docker stop kbus_app
docker rm kbus_app
docker run -dit --name kbus_app -p 12380:80 localhost:5000/kbus_base:v1.1
docker ps | grep kbus
curl localhost:12380
docker stop kbus_app
docker rm kbus_app
docker run -dit --name kbus_app -p 12380:80 -v /var/www/html/infra:/usr/share/nginx/html:ro localhost:5000/kbus_base:v1.1 
docker ps | grep kbus
curl localhost:12380
docker stop kbus_app
docker rm kbus_app
ansible-playbook -i hosts.yml myapp.yml
"

echo "Cleaning up"
docker stop kbus_app kbus_app1 kbus_app2 kbus_frontend
docker rm kbus_app kbus_app1 kbus_app2 kbus_frontend
docker rmi localhost:5000/kbus_base:v1.0 
docker rmi localhost:5000/kbus_base:v1.1



# We set the field separator to newline
IFS=$'\n'

# Clear the initial terminal
clear

# Loop through all commands in ${COMMANDS}
for cmd in ${COMMANDS}
do
   unset IFS
   echo "Executing: \"${cmd}\" ... "
   echo -n "Press ENTER to execute" 
   read
   echo "----"
   bash -c "${cmd}"
   echo "----"
   echo -n "Press ENTER to continue" 
   read
   clear
   IFS=$'\n'
done

# Reset the field separator
unset IFS
