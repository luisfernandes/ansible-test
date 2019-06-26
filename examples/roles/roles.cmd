# run the main playbook
ansible-playbook -i hosts site.yml

# run just the postgres hosts
ansible-playbook -i hosts --limit "postgres" site.yml

# run just a tag
ansible-playbook -i hosts --limit "postgres" --tags "install" site.yml

# don't run a tag
ansible-playbook -i hosts --limit "postgres" --skip-tags "install" site.yml