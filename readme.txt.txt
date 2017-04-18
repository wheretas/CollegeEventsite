included in the files is the sql table file. 

Steps to have db server up:

1) install XAMPP
2) run APACHE and MySQL in the XAMPP Control Panel
3) open a browser and type "localhost" in the address bar
4) select phpMyAdmin in the top right corner
5) In the top bar inside of phpMyAdmin, select import
6) import by selecting "choose file" the SQL file delivered in this repo
7) click the "User Accounts" button on the top bar
8) Create new account. named "web" with password "localpassword" (check off the DATA box ONLY)
9) AND ENJOY :D




get php inside of html


at the end of apache/conf file 
<IfModule mod_mime.c>
AddType application/x-httpd-php .php
AddType application/x-httpd-php .phtml
AddType application/x-httpd-php .php3
AddType application/x-httpd-php .php4
AddType application/x-httpd-php .html
AddType application/x-httpd-php-source .phps
</IfModule>
