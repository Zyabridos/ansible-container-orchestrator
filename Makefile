ping:
	ansible webservers -m ping

prepare:
	ansible-playbook playbook.yml
