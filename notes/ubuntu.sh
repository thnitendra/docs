https://help.ubuntu.com/community/UsingTheTerminal

Package mgmt
http://askubuntu.com/questions/2389/generating-list-of-manually-installed-packages-and-querying-individual-packages

comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n '	s/^Package: //p' | sort -u)

comm -23 <(aptitude search '~i !~M' -F '%p' | sed "s/ *$//" | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

http://unix.stackexchange.com/questions/40442/which-installed-software-packages-use-the-most-disk-space-on-debian
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
dpkg-query -W -f='${Installed-Size;8}  ${Package}\n' | sort -n
dpigs -n 10

apt-cache search racing game
apt-cache show torcs
apt-cache policy torcs
apt-get install torcs
dpkg -l
dpkg -L torcs | grep /usr/games/
apt-get clean
apt-get remove torcs
apt-get purge torcs
apt-cache rdepends packagename

apt-cache show <package> | grep "Installed-Size"
dpkg --print-avail <package> | grep "Installed-Size"	
echo -n | sudo apt-get purge <package> | grep "disk space will be freed"
echo -n | sudo apt-get purge --auto-remove <package> | grep "disk space will be freed"
sudo apt-get --assume-no autoremove PACKAGENAME
apt-space-used-by() { sudo apt-get --assume-no autoremove $@ | grep freed | cut -d' ' -f4-5 ;}


Check config details after istallation:
cat /var/lib/dpkg/info/maven.conffiles


Install java
http://www.wikihow.com/Install-Oracle-Java-on-Ubuntu-Linux

sudo apt-get purge openjdk-\* 

sudo mkdir /usr/local/java

sudo cp -r Downloads/jdk-8u77-linux-x64.tar.gz /usr/local/java/ 

 cd /usr/local/java/ 

sudo tar xvzf jdk-8u77-linux-x64.tar.gz

sudo gedit /etc/profile

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.7.0_45/jre/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.7.0_45/bin/javac" 1 
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jre1.7.0_45/bin/javaws" 1 

sudo update-alternatives --set java /usr/local/java/jdk1.7.0_45/jre/bin/java
sudo update-alternatives --set javac /usr/local/java/jdk1.7.0_45/bin/javac 
sudo update-alternatives --set javaws /usr/local/java/jdk1.7.0_45/bin/javaws

. /etc/profile

update-alternatives --query java 
update-alternatives --list java 
update-alternatives --all
--------------------------------------------

https://help.ubuntu.com/community/RootSudo

sudo -i

gksu nautilus 

------------------------------------------


Eclipse Install

http://askubuntu.com/questions/695382/how-to-install-eclipse-using-its-installer
http://ubuntuhandbook.org/index.php/2014/06/install-latest-eclipse-ubuntu-14-04/
http://stackoverflow.com/questions/13603173/eclipse-installation-and-how-to-run-it-on-ubuntu
http://askubuntu.com/questions/26632/how-to-install-eclipse

---------------------
Disk Utils

TODO: http://askubuntu.com/questions/291570/mark-bad-sectors-on-hard-drive-without-formating/490549#490549
http://unix.stackexchange.com/questions/25926/can-i-fix-bad-blocks-on-my-hard-disk-with-a-single-command

–-------------------------------

Booting / Repair (GRUB)
http://askubuntu.com/questions/654386/windows-10-upgrade-lead-into-grub-rescue
https://www.linux.com/learn/tutorials/776643-how-to-rescue-a-non-booting-grub-2-on-linux/
https://help.ubuntu.com/community/Grub2/Installing
http://manpages.ubuntu.com/manpages/xenial/en/man8/grub.8.html
 

------------

MySql
http://dev.mysql.com/doc/refman/5.7/en/binary-installation.html
http://dev.mysql.com/doc/refman/5.7/en/default-privileges.html

URL: jdbc:mysql://localhost:3306/nitdb
DB: nitdb
User: mysql
password: mysql123

---------------
jboss
admin / admin-123

----------------------------------------
AnyPoint

AnypointStudio /JAVA_HOME/bin/ -clean


add the followed parameter to the AnypointStudio.ini file:
--launcher.GTK_version 
