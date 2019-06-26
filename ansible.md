# Ansible
* Automation tool for IT purposes
* App deployments, orchestration, configuration management, provisioning
* Avoiding manual deployments, black magic configurations and setups
* Making deployments repeatable and reusable
* Agentless (openssh and winrm)

## Notes
Allow to automate and do deployment, health checks, configuration updates, iptables changes, creation of users, installing updates, packages... etc whatever we do in the local machine we can do in ansible remotely... for hundreds of machines... and in parallel... with one command...
Versioning control of deployments without black magic one time installs, everything is registered...
No extra software is needed to deploy using ansible... just ssh to the machines...

# Arquitecture
https://cdn-images-1.medium.com/max/1200/1*PPM4yvx7gx1-6yRVss0IPg.png
* Playbooks - Group of Plays that describe the final desired state
* Roles - Organizational structure of variables, tasks, templates etc...
* Variables - Configuration and customization
* Inventory - Servers, ranges and dynamic servers

## Notes
Inventories define the logical structure of a deployments, groups can be defined by aws region, type of servers, ip ranges, whatever...
Playbooks are just plain yml files with the host to run on, the remote user, and the task list.
Variables allow to configurable per enviroment making the scripts more reusable.
Config - ANSIBLE_CONFIG, ansible.cfg in the current working directory, .ansible.cfg in the home dir or /etc/ansible/ansible.cfg

# Working with Ansible
* Ad-Hoc `ansible <inventory> -m`
* Playbooks `ansible-playbook`
* Automation Frameworks (Tower, AWX)
* Hands-on (adhoc folder)

# Inventories
* Logical folders for my servers
* Hands-on (inventory folder)

## Notes
* Special groups are `all` and `ungrouped` (all host that don't belong to a group)
* ansible all -m setup (retrieve facts from the servers) very usefull to verify that the requested arch is present
* Why do i use INI format to define hosts?

```
[atlanta]
host1
host2

[raleigh]
host2
host3

[southeast:children]
atlanta
raleigh

[southeast:vars]
some_server=foo.southeast.example.com
halon_system_timeout=30
self_destruct_countdown=60
escape_pods=2

[usa:children]
southeast
northeast
southwest
northwest
```

```
all:
  children:
    usa:
      children:
        southeast:
          children:
            atlanta:
              hosts:
                host1:
                host2:
            raleigh:
              hosts:
                host2:
                host3:
          vars:
            some_server: foo.southeast.example.com
            halon_system_timeout: 30
            self_destruct_countdown: 60
            escape_pods: 2
        northeast:
        northwest:
        southwest:
```

# Playbooks
* Playbooks are a composition of tasks to be played. A task is a module call.
* Hands-on (inventory folder)

## Notes
* Variable precedence (22 PLACES!!!): https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#ansible-variable-precedence
* Modules list is gigantic.
* delegate_to: localhost
* Grouping tasks inside master playbook using imports... etc...

# Roles
Structure of a role:
```
site.yml
webservers.yml
fooservers.yml
roles/
   common/
     tasks/
     handlers/
     files/
     templates/
     vars/
     defaults/
     meta/
   webservers/
     tasks/
     defaults/
     meta/
```
The main.yml should contain relevant information about the directory. Ex: /tasks/main.yml - contains the main list of tasks to be executed by the role.
