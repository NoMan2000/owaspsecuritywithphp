echo "Enabling phpliteadmin for SQLite support"

sudo cp conf/phpliteadmin.conf /etc/apache2/sites-available/002-phpliteadmin.conf
sudo a2ensite 002-phpliteadmin.conf
sudo service apache2 reload