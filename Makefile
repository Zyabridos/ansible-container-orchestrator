ping:
	ansible webservers -m ping

prepare:
	ansible-playbook playbook.yml --tags setup --ask-vault-pass

install-roles:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook playbook.yml --tags deploy --ask-vault-pass

debug:
	ansible-playbook playbook.yml --tags debug --ask-vault-pass

vault-edit:
	ansible-vault edit group_vars/webservers/vault.yml

vault-view:
	ansible-vault view group_vars/webservers/vault.yml

clean-redmine:
	ansible webservers -a "docker rm -f redmine || true"

check:
	ansible webservers -a "curl -s -o /dev/null -w '%{http_code}' http://localhost:3000"

setup:
	make install-roles
	ansible webservers -m ping
	ansible-playbook playbook.yml --tags setup --ask-vault-pass
