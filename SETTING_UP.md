Setting Up!
==

Please note that we have been using a mac OSX to test the version of Mogo.

To do this we have hade to make some changes to our .htaccess please read on if you are **NOT** using Mac OSX to run your server

APACHE .htaccess (Centos, cPanel, Ubuntu etc)

your htaccess needs to look like the following.


Options +FollowSymlinks
Options +Indexes
RewriteEngine on
RewriteRule ^sitemap.xml$   index.php?uri=/sitemap    [NC,L,QSA]
# if your app is in a subfolder
# RewriteBase /my_app/
RewriteCond %{SCRIPT_FILENAME} !-f
RewriteCond %{SCRIPT_FILENAME} !-d
RewriteRule ^(.*)$   index.php?uri=/$1    [NC,L,QSA]

Mongo admin area .htaccess
==

needs to look like the following


Options +FollowSymlinks
Options +Indexes
RewriteEngine on
RewriteBase /mogo/
RewriteCond %{SCRIPT_FILENAME} !-f
RewriteCond %{SCRIPT_FILENAME} !-d
RewriteRule ^(.*)$   index.php?uri=/$1    [NC,L,QSA]
