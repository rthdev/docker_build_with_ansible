Build Version v1.0 of container image

`# docker build -f Dockerfile.v1.0 -t localhost:5000/kbus_base:v1.0 .`


Build Version v1.1 of container image

`# docker build -f Dockerfile.v1.1 -t localhost:5000/kbus_base:v1.1 .`


Configure docker network and containers according to playbook and inventory variables

`# ansible-playbook -i hosts.yml myapp.yml`

Start Demonstration of docker image building, container creation, updates + controlling/deployment via ansible
`# ./demo.sh`
