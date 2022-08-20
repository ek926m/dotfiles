### git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com

#### git config
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    
#### create new project from folder
    $ git init -b master
    $ git add .
    $ git commit -am "initial"
    $ git remote add origin git@github.com:ek926m/test.git
    $ git remote -v
    $ git push -u -f origin master
 
