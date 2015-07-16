## Install Ansible 

```bash
sudo apt-get install python-pip
sudo pip install ansible==1.8.2
```

## Setup Environment

Call the Ansible playbook (tested using Vagrant):
```bash
wget https://raw.githubusercontent.com/haidai/environment/master/ansible.yml
ansible-playbook -i "localhost," -c local ansible.yml --ask-sudo-pass
```

If remote do:

```bash
cd embedded-ansible/ansible
ansible-playbook -i "HOST_NAME_OR_IP," ansible.yml -u REMOTE_USER_NAME --ask-sudo-pass
```
