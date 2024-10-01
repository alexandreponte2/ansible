# ansible



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
    "owner": "alexandre.s.ponte",
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
    "owner": "alexandre.s.ponte",
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



ansible -i "pi5," -m ping pi5
