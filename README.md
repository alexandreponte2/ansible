# ansible

ssh-agent bash
ssh-add key-name.pem
###########


ansible localhost -m setup

ansible -m ping localhost


# Criar arquivo 
ansible -m file -a "dest=hello state=touch" localhost

# criar diretorio
ansible -m file -a "dest=test state=directory" localhost

[WARNING]: No inventory was parsed, only implicit localhost is available
localhost | CHANGED => {
    "changed": true,
    "gid": 20,
    "group": "staff",
    "mode": "0755",
    "owner": "alexandre",
    "path": "test",
    "size": 64,
    "state": "directory",
    "uid": 501
}



❯ ansible -m file -a "dest=test state=directory" localhost

[WARNING]: No inventory was parsed, only implicit localhost is available
localhost | SUCCESS => {
    "changed": false,
    "gid": 20,
    "group": "staff",
    "mode": "0755",
    "owner": "alexandre",
    "path": "test",
    "size": 64,
    "state": "directory",
    "uid": 501
}

# remover diretorio

ansible -m file -a "dest=test state=absent" localhost


❯ ansible -m file -a "dest=test state=absent" localhost

[WARNING]: No inventory was parsed, only implicit localhost is available
localhost | CHANGED => {
    "changed": true,
    "path": "test",
    "state": "absent"
}
❯ ansible -m file -a "dest=test state=absent" localhost

[WARNING]: No inventory was parsed, only implicit localhost is available
localhost | SUCCESS => {
    "changed": false,
    "path": "test",
    "state": "absent"
}




# para consultar na documentação, ex file
ansible-doc file


# criar um arquivo e escrever nele.
ansible -m copy -a "dest=hello content=word" localhost


# Teste antes de alterar o arquivo
ansible -m copy -a "dest=hello content=word" localhost --check --diff


# systemsetup -gettimezone
Time Zone: America/Sao_Paulo

ansible -m timezone -a "name=America/New_York" localhost


# ping remote hosts
ansible -m ping localhost
ansible -m command -a date localhost

ansible -i "pi5," -m ping pi5


ansible -i "pi5,pi4,pi6" -m ping all


ansible -i "pi5,pi4,pi6" -m command -a date



ansible -i "pi5,pi4,pi6" -m command -a date all,localhost

ansible -i my_inventory -m command -a "date" all


ansible -m command -a "date" all

ansible -m ping all



ansible-inventory --list --yaml
all:
  children:
    ungrouped:
      hosts:
        localhost: {}
        pi4: {}
        pi5: {}




# validando configuração
ansible-config dump --only-changed




# usar sudo/root no host remoto
ansible -m timezone -a "name=America/New_York" pi3 --become



ansible -m timezone -a "name=America/New_York" localhost --diff --become


ansible -m timezone -a "name=America/New_York" localhost --diff --become --ask-become-pass


ansible -m ping localhost --diff --become --ask-become-pass



#######


ansible -m command -a date all,localhost



ansible -m timezone -a "name=America/New_York" all,localhost --diff --become --ask-become-pass

ansible -m command -a date all,localhost

ansible-playbook playbook.yml -v (verboso, da pra colocar mais v's exemplo -vvv) 