# Check the Map deployment scripts

Based on Centos 7 installations

[![Requirements Status](https://requires.io/github/ta5ae/check_the_map/requirements.svg?branch=master)](https://requires.io/github/ta5ae/check_the_map/requirements/?branch=master)

# One time set up
1. Install requirements

	* Vagrant
	* VirtualBox or supported provider.

1. Install vagrant plugin

		vagrant plugin install vagrant-sshfs

1. Clone development environment repo

		git clone git@github.com:asset-web/ctm-deploy.git

1. Check out project code

		mkdir -p ctm-deploy/src
		cd ctm-deploy/src
		git clone git@github.com:asset-web/check_the_map.git

# Start development environment

	cd ctm-deploy
	vagrant up

# Intitial Django super user and database table creation

	vagrant vagrant-sshfs
	sh /vagrant/start-up.sh

# Run development server

	python manage.py runserver 0.0.0.0:8000

# View in browser

	http://localhost:8000

# How to create a new wagtail project (one-off)

	vagrant ssh
	source /vagrant/venv/bin/activate
	wagtail start check_the_map
	