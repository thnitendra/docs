# I/O Redirection
# http://www.tldp.org/LDP/abs/html/io-redirection.html

cat .git/FETCH_HEAD

git hash-object one.txt
git config --list
git config --global --list
git config --global user.name thnitendra

git rev-parse HEAD
git cat-file -t HEAD
git cat-file -t 8987c50
git cat-file commit HEAD
git cat-file blob 35d242ba79ae89ac695e26b3d4c27a8e6f028f9e
git ls-tree HEAD
git ls-tree -r HEAD

git branch --all -vv
git describe --all --tags

git fetch --all --tags
git fetch origin master

git clean -f -d -X
git reset
git reset --hard b558eba
git checkout -f [branch:]<path>

git diff
git diff master
git diff master --first-parent
git diff --first-parent
git diff --name-only 20160621
git diff --name-only 20160621 20160629
git diff --name-only master
git diff --name-only origin/master
git diff --name-only staging...master
# all changes between HEAD and master. same as git diff HEAD master or (master HEAD)
git diff --oneline --name-only ..master
git diff --oneline --name-only master..
# changes that occured on master branch since when the current branch was cut off
git diff --oneline --name-only ...master
# changes that occured on current branch
git diff --oneline --name-only master...

git log --all --no-merges --name-only  --not master
    (without all, it shows commits only on current branch)
git log --tags[=<pattern>] --merges --name-status --first-parent
git log --pretty=short [branch:][<path>]
git log --pretty="%h %Cred %D %Cgreen %cd %cn %Cblue %s" --author="Manish" --since=2.weeks --until=20-Oct-2016
git log --graph --oneline --decorate --simplify-by-decoration --stat -5 680e22d..HEAD
git --follow -p tools/Jenkins.groovy
# commits made to master since the current branch was cut off
git log --oneline --name-only ..master
# commits made to current branch
git log --oneline --name-only master..
# all unique commits on both branches
git log --oneline --name-only ...master
git log --oneline --name-only master...

# if the file is staged fro commit, use --cached
git diff --cached myfile

gitk --all

#make alias:
git config --global alias.logs 'log --graph --oneline --decorate'


git logs --all

git shortlog
git reflog
git show-branch staging
git status
git tag --list
git show HEAD
git show is a convinient way to display the concise contents corresponding to a hash. for blobs, it shows the file content, for commits, it shows the commit detials etc.
git show 44442d2d7b0b7a0acff098319d3c6cff9e33a2b0

git revert -m 1 40d1624
diff <(git diff --oneline --name-only ..master) <(git diff --oneline --name-only master..)
git branch --contains d973b10

git push origin --delete pre_master
git branch -D pre_master

# Advanced merging
git checkout master
#http://nvie.com/posts/a-successful-git-branching-model/
git merge [--ff][--ff-only][--no-ff] staging

#https://www.kernel.org/pub/software/scm/git/docs/howto/revert-a-faulty-merge.txt
git merge staging
git revert -m 1 <the merge commit>
git revert <the revert commit>
git merge staging

#https://stackoverflow.com/questions/173919/is-there-a-theirs-version-of-git-merge-s-ours
git merge -s recursive -X theirs B
git pull -s ours master
git pull -X theirs master
#https://git-scm.com/docs/git-merge

#https://git-scm.com/docs/git-rebase
#https://ariejan.net/2011/07/05/git-squash-your-latests-commits-into-one/
git rebase -i HEAD~3

git cherry-pick -m 1 b5d87fb 6c41ba0

# Conflict resolution
#https://developer.atlassian.com/blog/2015/12/tips-tools-to-solve-git-conflicts/
#https://git-scm.com/book/en/v2/Git-Tools-Advanced-Merging
git status -sb
git merge-base staging pre_master
git merge --abort
git checkout --theirs one.txt
git reset --hard
git show :1:hello.rb > hello.common.rb
git show :2:hello.rb > hello.ours.rb
git show :3:hello.rb > hello.theirs.rb
git checkout --patch branch2 file.py
git merge-file -p \
hello.ours.rb hello.common.rb hello.theirs.rb > hello.rb
#using GUI tool
git mergetool --tool=bc3 one.txt

git difftool --tool=opendiff HEAD:<file> remotes/origin/staging:<file>
git diff HEAD:<file> remotes/origin/staging:<file> | mate

git checkout -b new_local_branch
git push -u origin new_local_branch
git push origin local-name:remote-name
git ls-remote --tags origin jnk-*

# to merge one specific file from another branch
git checkout --patch branch2 file.py

# check git repos access (taken from jenkins)
git -c core.askpass=true ls-remote -h https://github.com/thnitendra/scripts.git HEAD
ssh -T git@github.com

git config --get remote.origin.url
git remote show origin
git reset --hard origin/staging
git clean -xfd

git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive


git diff --name-only --diff-filter=M -G"this.getClass" master | xargs git checkout master


# find when a commmit was merged https://github.com/grosser/git-whence
git whence <commit>

# https://github.com/mhagger/git-when-merged
$ brew update
$ brew install git-when-merged
git config --get remote.origin.url
git remote -v
