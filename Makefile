ping:
	ansible webservers -m ping

prepare:
	ansible-playbook playbook.yml

deploy:
	ansible-playbook deploy.yml --tags deploy
