#! /bin/bash
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt install apache2 mariadb-server php7.4 libapache2-mod-php7.4 php7.4-cli php7.4-mysql php7.4-json php7.4-opcache php7.4-mbstring php7.4-intl php7.4-xml php7.4-gd php7.4-zip php7.4-curl php7.4-xmlrpc -y
wget -O joomla.tar.bz https://downloads.joomla.org/cms/joomla3/3-9-27/Joomla_3-9-27-Stable-Full_Package.tar.bz2
sudo mkdir /var/www/html/joomla3.9.27
sudo tar -xjf joomla.tar.bz -C /var/www/html/joomla3.9.27
sudo chown -R www-data:www-data /var/www/html/joomla3.9.27/
sudo chmod -R 755 /var/www/html/joomla3.9.27/
sudo echo '<VirtualHost *:80>
  DirectoryIndex index.html index.php
  DocumentRoot /var/www/html/joomla3.9.27

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined

<Directory "/var/www/html/joomla3.9.27">   
DirectoryIndex index.html index.html.var index.php
      Options FollowSymlinks
      Allowoverride All
      Require all granted
  </Directory>
</VirtualHost>' > /etc/apache2/sites-available/joomla.conf
sudo a2dissite 000-default.conf
sudo a2ensite joomla.conf
sudo systemctl reload apache2
sudo systemctl restart apache2