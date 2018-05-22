history
pbcopy < ~/.ssh/github_rsa.pub
ls -d */
cat ~/.bash_history
-----------
type java

#http://www.thegeekstuff.com/2009/08/10-awesome-examples-for-viewing-huge-log-files-in-unix/

grep -n "getApprovalList" dbsqlerror.log

sed -n 329,451p dbsqlerror.log
sed -n 329,451p dbsqlerror.log | grep searchSrtring

head -57430 dbsqlerror.log.2016-05-11 | tail -100

## Run a background process
command &>/dev/null &

## Switch a job between background/foreground
#http://www.thegeekstuff.com/2010/05/unix-background-job/
# http://infohost.nmt.edu/tcc/help/unix/fg-bg.html
jobs
bg  or %1&
fg
bg %1  #1 is the job number that gets displayed by jobs
fg %2

## Display tail with line number
cat -n 1 log.log | tail

## arithmetic
echo $(( 16179 - 14400 ))

## find a file 
find interface/batch/config/env/ -iname env.*furikomi*
## Find a file and display the content
find -name addedsysenv.properties | xargs cat
## Find files and open them in vi
find -name addedsysenv.properties -exec vim{} +
## Find and remove
find -name addedsysenv.properties -exec rm -rf {} +;
## find (modified between 5 and 10 days ago) and grep on it
find /directory -type f -mtime -10 -mtime +5
find /directory -type f -mtime -10 -mtime +5 -print0 | xargs -0 grep -l expression 
## grep on files whcih are newer then some_file
find -newer some_file -type f -exec grep 'pattern' {} +

## VI cut/copy paste
v/V + arrow key to select
x to cut, y to copy, p to paste

## sort recrsively based on date
find -printf "%TY-%Tm-%Td %TT %p\n" | sort -n
ls -ltr

date -d '31 days ago' '+*%Y%m%d*gz'

---------------------------------------------------------

grep -r --include='*.sh' 'git diff' ~/GitHub/notes/
find . -iname dir* -exec ls -lShr {} \;
find . -iname info.2017-02-26.log.zip -exec du -sh {} \;
find . -iname info.2017-02-26.log.zip -exec du -ch {} +

for host in {100..102}; do echo 102; done
cat ~/repos/box/sid.json | grep -B 2 -A 2 i101

for host in {100..102} ; do ssh user@${host} ls -l / ; done

-----------------------------
# Sum from Line:
cat t | perl -lpe '$c+=$_}{$_=$c'

# find and replace string
grep -rl SEARCHFOR DIRECTORY | xargs perl -pi -e 's/ASIS/TOBE/g'
----------------------------

curl -L -k -o /dev/null -w %{http_code}

for API in `cat ~/box/SS_StressTest201706`; do grep "scope=" $API | awk -F "scope" '{print $2}' | cut -d ' ' -f1; done
