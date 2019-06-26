# should respond all existing servers
ansible all -m shell -a 'echo "Hello World!"'

# add localhost to the file
echo "spark1" >> hosts

# should respond all servers
ansible all -m shell -a 'echo "Hello World!"'

# should respond only the postgres
ansible postgres -m shell -a 'echo "Hello World!"'
