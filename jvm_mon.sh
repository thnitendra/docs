/usr/local/jdk1.6/bin/jps -lmv

/usr/local/jdk1.6/bin/jstat -gcutil -t `/usr/local/jdk1.6/bin/jps | grep Bootstrap | cut -d" " -f1` 1s

