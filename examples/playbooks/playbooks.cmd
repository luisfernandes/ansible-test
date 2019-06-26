# create testing dir in fraud servers
ansible-playbook -i hosts create-test-dir.yml

# check testing dir in fraud servers
ansible-playbook -i hosts check-test-dir.yml

# check the testing dir on database group
ansible-playbook -i hosts check-test-dir-database.yml

# check the testing dir on database group
ansible-playbook -i hosts check-test-dir-database-fail.yml

# overriding the directory variable to create the directory
ansible-playbook -i hosts -e 'testing_dir="/home/new_test"' check-test-dir-database-fail.yml

# create the new dir
ansible-playbook -i hosts -e 'testing_dir="/home/new_test"' create-test-dir-database.yml

# check if its created
ansible-playbook -i hosts -e 'testing_dir="/home/new_test"' check-test-dir-database-fail.yml

