### git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    $ ssh -T git@github.com

#### git config
    $ git config --global color.ui true
    $ git config --global user.email "your@mail.com"
    $ git config --global user.name "Your Name"
    
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

#### git strategy
    hint: You have divergent branches and need to specify how to reconcile them.
    hint: You can do so by running one of the following commands sometime before
    hint: your next pull:
    hint: 
    hint:   git config pull.rebase false  # merge
    hint:   git config pull.rebase true   # rebase
    hint:   git config pull.ff only       # fast-forward only
    hint: 
    hint: You can replace "git config" with "git config --global" to set a default
    hint: preference for all repositories. You can also pass --rebase, --no-rebase,
    hint: or --ff-only on the command line to override the configured default per
    hint: invocation.
    fatal: Need to specify how to reconcile divergent branches.
