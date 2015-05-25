sudo apt-get install -y build-essential software-properties-common \
                        vim curl wget tmux python-software-properties \
                        htop

# Install PHP 5.6
sudo add-apt-repository -y ppa:ondrej/php5-5.6
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install apt-transport-https
curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | sudo apt-key add -
sudo sh -c 'echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list'
sudo apt-get update
sudo apt-get install varnish
echo "Get private ip address"
ip addr | awk '/inet / {sub(/\/.*/, "", $2); print $2}'
# sudo apt-get install -y php5 php5-fpm php5-mcrypt php5-curl

sudo cat >> /etc/apt/sources.list <<EOT
deb http://www.rabbitmq.com/debian/ testing main
EOT

wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc
sudo apt-get install rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management

sudo rabbitmqctl add_user admin admin
sudo rabbitmqctl add_user client client
sudo rabbitmqctl set_user_tags admin administrator
sudo rabbitmqctl set_permissions client ".*" ".*" ".*"

sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart