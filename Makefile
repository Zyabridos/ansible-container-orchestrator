ping:
	ansible webservers -m ping

prepare:
	ansible-playbook playbook.yml --tags setup

deploy:
	ansible-playbook playbook.yml --tags deploy
