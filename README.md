# copy .bash_aliases to home directory then restart the shell
cp .bash_aliases ~/

# Run installations
bash install.sh

# add .bashrc contents to the ~/.bashrc
cat .bashrc >> ~/.bashrc