#!/bin/bash

echo "List of the installing apps:"
echo "NVM + Latest LTS NodeJS"
echo "Git"
echo "yarn"
echo "NestJS CLI"

read -p "Do you want to install the entire list of apps above? (y/n) " yn

case $yn in 
	y|"" )
		echo "installing NVM...";
		wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash;
		source ~/.bashrc;
		source ~/.nvm/nvm.sh;

		echo "Installing latest LTS NodeJS...";
		nvm install --lts;

		echo "Installing Git...";
		sudo apt update;
		sudo apt-get install git-all <<< "y";
		git --version;

		echo "Installing yarn...";
		npm install --global yarn;
		echo Yarn verstion: $(yarn --version)

		echo "Installing NestJS CLI...";
		npm i -g @nestjs/cli;
		echo NestJS CLI verstion: $(nest -v)
		;;
	# n ) echo "Do not install";;
	# * ) echo invalid response;exit 1;;
	* ) echo "Do not install";;
esac

read -p "Do you want to install PostgreSQL? (y/n) " postyn

if [[ "$postyn" == "y" || "$postyn" == "" ]]; then
  	echo "installing PostgreSQL..."
  	sudo apt update
  	sudo apt install postgresql postgresql-contrib <<< "y"
  	sudo systemctl start postgresql.service

	echo $(psql --version)
  	echo "use this command to enter in PostgreSQL: sudo -i -u postgres"
fi

