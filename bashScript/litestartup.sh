echo "Installing common software components needed."

sudo apt-get install -y build-essential software-properties-common \
                        vim curl wget tmux python-software-properties \
                        htop mutt

#echo "Installing the php 5.6 repository, should also use it for MySQL and Apache"

echo "Creating an alias called random which generates 12 random characters and saving it to the text file password.txt and creating an environment variable called password"

alias random='echo "$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12 | xargs echo)"'
random > password.txt
password=$(< password.txt)

echo "This is a basic shell script to begin installation of features you will need for this all to work."

#echo "Begin by updating the System."
#sudo apt-get -y update
#sudo apt-get -y upgrade
sudo apt-get autoclean
sudo apt-get autoremove
sudo apt-get clean

sudo apt-get install -y php5-dev php5-sqlite sqlite3 libsqlite3-dev

echo "It begins by installing php5-redis and mcrypt extensions.  Mcrypt should already be on the system, but let's be sure.  Also installing Stunnel."

sudo apt-get install -y php5-redis php5-mcrypt stunnel4 php5-curl

echo "Also generating a SSL certificate for Redis."

sudo mkdir -p /etc/stunnel;sudo touch /etc/stunnel/stunnel.pem;sudo touch /etc/stunnel/private.pem

echo "The following keys do not have a passphrase attached to avoid the problem of constantly typing in a password."

openssl genrsa -out key.pem 4096
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 -config openssl.cnf  \
-subj '/C=US/CN=c9.io/O=widgetCorp/ST=WidgetLand/OU=Tech/emailAddress=widgetCorp@example.com/L=Portland'

echo "Setting up the stunnel keys and setting up a redis-server conf."

sudo sh -c 'cat key.pem cert.pem > /etc/stunnel/stunnel.pem;
touch /etc/stunnel/redis-server.conf;
cat conf/redis-server.conf > /etc/stunnel/redis-server.conf;
chmod 640 /etc/stunnel/stunnel.pem;
cat conf/stunnel4 > /etc/default/stunnel4;
cp conf/phpliteadmin.conf /etc/apache2/sites-available/;
cp conf/001-cloud9.conf /etc/apache2/sites-available/;'

echo "Starting Redis."

sudo service redis-server start
#sudo service redis-server restart

echo "You can install Grunt cli and Bower with the following commands.  Node comes pre-installed."
echo "For this course, you do not have to do this, as everything is already pre-packaged."

#npm install -g grunt-cli --save-dev

#npm install -g bower --save-dev

echo "Installing Composer."

curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer

echo "Moving up one directory and installing all the files in the package.json"

cd ..

#npm install

echo "Installing composer dependencies"

sudo composer install

sudo composer global require "phing/phing:2.*"

echo "Bower dependencies are not necessary, but can be installed"

#bower install

#echo "Installing scss-lint"

#gem update --system
#gem install scss-lint

#echo "Running Grunt."

#grunt

echo "Installing mailcatcher gem."

#gem install mailcatcher

#echo "Configuring PHP for mailcatcher."

#echo "sendmail_path = /usr/bin/env $(which catchmail) -f test@local.dev" | sudo tee /etc/php5/mods-available/mailcatcher.ini

#sudo php5enmod mailcatcher
sudo a2enmod headers

sudo pecl install igbinary
sudo cp /home/ubuntu/workspace/bashScript/conf/igbinary.ini /etc/php5/mods-available/igbinary.ini
sudo php5enmod igbinary

echo "Creating a special Apache user and group"
echo "In a production environment, you would need to edit the /etc/apache2/envvars file to change the user and the group.  I do not \
recommend this when using c9 as the ACE editor has problems with this and you will go through some serious pain to get it all working again."

sudo groupadd apache
sudo useradd -d /home/ubuntu/workspace/ -g apache -s /bin/bash apache
sudo usermod -a -G apache ubuntu
mkdir /home/ubuntu/workspace/tmp
mkdir -p /home/ubuntu/workspace/errors/phing
mkdir /home/ubuntu/workspace/logs

echo "Starting up MySQL"

echo "Installing phpmyadmin.  This will not work from a bash script, but it is a placeholder for you to see"
# sudo mysql-ctl install
# sudo mysql-ctl start
# phpmyadmin-ctl install

sudo service apache2 start

sudo a2ensite phpliteadmin

cd bashScript

sudo service mysql start

sudo mysql_secure_installation

mysql -uroot -padmin < phpmyadmin.sql

sudo service apache2 start

sudo cp /home/ubuntu/workspace/bashScript/conf/phpmyadmin.conf /etc/apache2/sites-available/
sudo cp ~/workspace/bashScript/conf/config.inc.php /etc/phpmyadmin/config.inc.php
sudo a2ensite phpmyadmin
sudo service apache2 reload

echo "You only have to do this on c9, the default user is ubuntu with group of ubuntu"

sudo chown -R ubuntu:ubuntu /var/lib/phpmyadmin
sudo chown -R ubuntu:ubuntu /etc/phpmyadmin/
sudo chown -R ubuntu:ubuntu /home/ubuntu/workspace
echo 'export PATH="$PATH:~/.composer/vendor/bin"' >> ~/.bashrc
export PATH="$PATH:~/.composer/vendor/bin"
echo "All Done!"