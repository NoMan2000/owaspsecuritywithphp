echo "Sometimes, you have too many processes running."
echo "Htop is a nice way to see what processes are running."
echo "Then run killall \-v processName to kill it all off.  Some common ones."

killall -v php
sudo service apache2 restart
mysql-ctl restart
sudo netstat -tulpn | grep :1025 