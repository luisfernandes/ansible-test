# all servers should respond
ansible all -m shell -a 'echo "Hello World!"'

# should respond postgres server
ansible database -m shell -a 'echo "Hello World!"'

# should respond the two spark servers
ansible batch -m shell -a 'cat /etc/hosts'
