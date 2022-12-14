### git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    $ ssh -T git@github.com

#### git config
    $ git config --global color.ui true
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    
#### create new project from folder
    $ git init -b master
    $ git add .
    $ git commit -am "initial"
    $ git remote add origin git@github.com:ek926m/test.git
    $ git remote -v
    $ git push -u -f origin master
 
#### git stash single file
    $ git checkout HEAD -- file.txt
    
#### git reset to a specific commit hash
    # Reset the index and working tree to the desired tree
    # Ensure you have no uncommitted changes that you want to keep
    $ git reset --hard 56e05fced

    # Move the branch pointer back to the previous HEAD
    $ git reset --soft "HEAD@{1}"

    $ git commit -m "Revert to 56e05fced"
