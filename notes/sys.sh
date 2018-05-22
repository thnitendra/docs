-- recent logged in users / activities
last

-------------
https://help.ubuntu.com/community/UsingTheTerminal
https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps

-- File Utils
http://linux.about.com/library/cmd/blcmdl1_file.htm
file -sL /dev/sd*

-- Disk Utils
fdisk -l
lsblk
blkid

mount -l
cat /etc/fstab

badblocks
fsck
parted -l

du -sh -c
df -kh
du -ck ./* | sort -n

sysctl -a
sysctl -n hw.ncpu
sw_vers
system_profiler | more
sysctl -a

ulimit -a
uname -a
cat /proc/cpuinfo
cat /proc/meminfo
cat /etc/*-release
lsb_release -a
cat /proc/version

-------------------------

/etc/environment
/etc/alternatives/
/etc/profile
~/.profile

/etc/sudoers
sudo env "PATH=$PATH" your_command
Ex: sudo env "PATH=$PATH" mvn install-install-file …...

awk -F':' '{ print $1}' /etc/passwd

arch
uname -a
echo $SHELL

top
uptime
sar
sar -r -f /var/log/sa/sa07 -s 01:44:00 -e 02:00:00
# for load avg
sar -q -f /var/log/sa/sa07 -s 01:44:00 -e 02:00:00
------------------------------
ps -p $$
ps aux | grep mount
ps -ef --forest | grep httpd
ps axo pid=,stat=

------------------------------
tail /var/log/cron
crontab -l
crontab -e
crontab -r
crontab -l > bkp
crontab -l < bkp

------------------------------

# network commands
dig <hostname>
lsof -i | grep memcached
netstat nlp
telnet 127.0.0.1 11211
networksetup -getcomputername
networksetup -listallnetworkservices
networksetup -getwebproxy Wi-Fi
dig
netstat
# nslookup can used to check if the domain points to a SLB or GSLB. In case of GSLB, a CNAM record is returned. In case of SLB, A Record is returned
nslookup <domain>
ifconfig
traceroute / tracert / tracepath

# check if smtp is working
nc -zv 127.0.0.1 25
telnet localhost 25

# Get public IP on any machine
curl ipecho.net/plain ; echo
----------------

#User / Group mgmt:
id
id <user>
groups
groups <user>
sudo -l
visudo
/etc/shadow     #Secure user account information
/etc/passwd     #User account information
/etc/gshadow	#Contains the shadowed information for group accounts
/etc/group      #Defines the groups to which users belong
/etc/sudoers	#List of who can run what by sudo
/home/*         #Home directories


---------
# port scan
nmap -sS -A 127.0.0.1
# Connect to a service by knowing its port
nc localhost PORT_NUMBER
# iptables is a firwall software. On mac, pfctl is similar to iptables
iptables -L
# flush all rules
iptables -F
# Default policies
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
# allow all incoming TCP traffic on port 80
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
# allow incoming TCP traffic from given IP on port 80
iptables -A INPUT -p TCP -s 192.168.0.2 --dport 80 -j ACCEPT
# it is difficult to restrict outgoing traffic based on port becasue while sending response system uses some random unrelated highport. So, such rules are created based on connection state of a request.
# Allow outgoing TCP traffic but only as part of the mentioned connection state. All others must be dropped.
iptables -A OUTPUT -p TCP -m state --state ESTABLISHED -j ACCEPT
iptables -P OUTPUT DROP

--------
chmod ugo+r test.txt
# SUID and SGID: https://www.thegeekdiary.com/what-is-suid-sgid-and-sticky-bit/
chmod +s cmd_file

# password policy is stored in
/etc/login.defs
/etc/pam.d/system-auth
# add this line in /etc/pam.d/system-auth to disallow most frequently used words as passwords.
# password required pam_cracklib.so
# password required pam_cracklib.so retry=5

---------
# constrin ssh access
vim /etc/ssh/sshd_config
>>	PermitRootLogin no
	PasswordAuthentication no

service sshd restart

# keys based authN for ssh
ssh-keygen -t rsa
chmod u-rwx,og= ~/.ssh
chmod u-rw,og= ~/.ssh/id_rsa

# SFTP = FTP over SSH connection
# FTPS = FTP over SSL connection (becsue, soemtimes SFTP is not pssible to configure. So, FTPS is backward compatible woth FTP and it just trasmits over secure SSL connection)
# configure FTPS - vsftpd process
mkdir /etc/ssl/ftps
openssl req -x509 -nodes -newkey rsa:1024 -keyout /etc/ssl/ftps/vsftpd.pem -out /etc/ssl/ftps/vsftpd.pem
>> Get the crt signed by a public or internal corporate CA
vim /etc/vsftpd/vsftpd.conf
>>	cert_file=/etc/ssl/ftps/vsftpd.pem
	rsa_private_key_file=/etc/ssl/ftps/vsftpd.pem
	ssl_enable=YES
	force_local_data_ssl=YES
	force_local_logins_ssl=YES

#check current Unix runlevel
who -r

###########
# IDS/IPS Systems (Intrusion Detection/Prevention Systems)

date
mv /etc/localtime /etc/localtime.bak
ln -s /usr/share/zoneinfo/America/New_York/etc/localtime
# NTP (Network Time Protocol) periodically updates server's clock using a time server. These services get time from an atomic clock
yum install ntp ntpdate
chkconfig ntpd on
ntpdate pool.ntp.working/etc/init.d/ntpd start

# public vulnerability database. Store known vulnerabilities of all major softwares; cna be searced using s/w versions
www.cvedetails.com

# to check process treee. Is also used to check attacks to a server
pstree

# rkhunter tool is used to detect backdoors and rootkits to a host like file modification, s/w install, cron chnages etc
rkhunter -c


############
