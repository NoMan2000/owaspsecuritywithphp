echo "Remove default phpmyadmin configuration and replace it with own."

sudo unlink /etc/apache2/sites-enabled/phpmyadmin.conf
sudo cp /home/ubuntu/workspace/bashScript/conf/phpmyadmin.conf /etc/apache2/sites-available/
sudo a2ensite phpmyadmin
sudo service apache2 reload