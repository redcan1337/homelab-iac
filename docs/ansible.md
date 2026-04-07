# Initial configuration

1. Install required collections via ansible-galaxy
`ansible-galaxy collection install -r requirements.yml`

2. Change **remote_user** and **private_key_file** in **ansible/ansible.cfg** to match your enviroment

3. Create Ansible Vault based on **ansible/group_vars/vault.yml.example**
`ansible-vault create ansible/group_vars/vault.yml`
