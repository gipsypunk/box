sudo pacman -Syyy
# NGINX
sudo pacman -S nginx-mainline 
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl status nginx
sudo systemctl disable nginx

# MSQL 
sudo pacman -S mariadb
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo systemctl status mariadb

sudo mysql_secure_installation
sudo mysql -u root -p



# PHP
sudo pacman -S php php-fpm
sudo systemctl enable php-fpm
sudo systemctl status php-fpm

sudo vim /etc/nginx/nginx.conf
location / {
root   /usr/share/nginx/html;
index  index.html index.htm index.php;
}
location ~ \.php$ {
fastcgi_pass   unix:/var/run/php-fpm/php-fpm.sock;
fastcgi_index  index.php;
root   /usr/share/nginx/html;
include        fastcgi.conf;
}



sudo systemctl restart nginx
sudo systemctl restart php-fpm
sudo vim /usr/share/nginx/html/info.php
<?php
phpinfo();
?>


