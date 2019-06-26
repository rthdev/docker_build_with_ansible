docker build -t localhost:5000/kbus_base:v1.0 .
ansible-playbook -i hosts.yml myapp.yml 
