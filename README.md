## redhat based setup

### ~/.bashrc
    alias ll='ls -lah --color=auto'
    alias cp='cp -v'
    alias mv='mv -v'
    alias rm='rm -v'
    alias servertux='ssh root@127.0.0.1'
    git_branch() {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"
    export PATH=~/.config/composer/vendor/bin:$PATH
    #export PATH=~/.composer/vendor/bin:$PATH
    # neofetch
    neofetch --disable gpu --ascii_distro redhat

### system packages
    $ sudo dnf update -y
    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    $ sudo dnf group install 'Development Tools' -y && sudo dnf install -y gcc-c++ nano autoconf automake bison libffi-devel libtool readline-devel sqlite-devel php-mysqlnd libyaml-devel python3 python3-pip exfat-utils fuse-exfat ncdu tmux htop neofetch
     
### optional gui packages
    $ sudo dnf install -y gnome-tweak-tool mediawriter discord gimp transmission youtube-dl vlc firewall-config lpf-spotify-client && lpf-gui && sudo dnf remove -y lpf-spotify-client
       
### git
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com
 
### nodejs
    $ sudo dnf install -y nodejs
    $ sudo npm install -g eslint nodemon pm2 @vue/cli lodash

### laravel
    $ sudo dnf install -y composer
    $ composer global require laravel/installer

### docker
    $ sudo dnf install -y docker docker-compose
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}
    
    # mariadb
    $ docker pull mariadb 
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest

    # phpmyadmin
    $ docker pull phpmyadmin
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin

    # mongodb
    $ docker pull mongo
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 mongo
            
### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && sudo dnf install google-chrome-stable_current_x86_64.rpm -y

### vs code
    $ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    $ sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    $ dnf check-update
    $ sudo dnf install code

### vscode extensions
    onecentlin.laravel-extension-pack
    - mikestead.dotenv
    - editorconfig.editorconfig
    - codingyu.laravel-goto-view
    - onecentlin.laravel5-snippets
    - stef-k.laravel-goto-controller
    - felixfbecker.php-debug
    - amiralizadeh9480.laravel-extra-intellisense
    - ryannaddy.laravel-artisan
    - onecentlin.laravel-blade
    - bmewburn.vscode-intelephense-client
    ms-vscode-remote.remote-ssh
    - ms-vscode-remote.remote-ssh-edit
    hookyqr.beautify
    ms-azuretools.vscode-docker
    miguelsolorio.min-theme
    gaulomatic.vscode-icontheme-nomo-dark-macos
    rangav.vscode-thunder-client
    octref.vetur

### vscode keybindings.json
    // Place your key bindings in this file to override the defaults
    [
        {
            "key": "ctrl+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.toggleTerminal"
        },
        {
            "key": "shift+ctrl+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.new"
        },
        {
            "key": "ctrl+1",
            "command": "workbench.action.openEditorAtIndex1"
        },
        {
            "key": "ctrl+2",
            "command": "workbench.action.openEditorAtIndex2"
        },
        {
            "key": "ctrl+3",
            "command": "workbench.action.openEditorAtIndex3"
        },
        {
            "key": "ctrl+4",
            "command": "workbench.action.openEditorAtIndex4"
        },
        {
            "key": "ctrl+5",
            "command": "workbench.action.openEditorAtIndex5"
        },
        {
            "key": "ctrl+6",
            "command": "workbench.action.openEditorAtIndex6"
        },
        {
            "key": "ctrl+7",
            "command": "workbench.action.openEditorAtIndex7"
        },
        {
            "key": "ctrl+8",
            "command": "workbench.action.openEditorAtIndex8"
        },
        {
            "key": "ctrl+9",
            "command": "workbench.action.openEditorAtIndex9"
        }
    ]

## helpful

###### copy host folder x over ssh with user@ip to home folder of remote
    $ rsync -v -r foldername user@12.34.56.78:.
###### find a file with a name
    $ find / -name testfile
###### curl simple web requests
    $ curl 'http://localhost/test'
    $ curl -A "test user agent" 'http://localhost/api/helloworld?name=ek&lang=de'
    $ curl -A "test user agent" -d '{"data1": "0","data2": "0"}' -H "Content-Type: application/json" -X POST http://localhost/api/test
###### change root password
    $ passwd
###### create user
    $ useradd -m user
    $ passwd user
###### add user to groups
    $ usermod -aG sudo,audio,video user
###### change shell to bash
    $ sudo chsh -s /bin/bash user
###### switch user
    $ su user
###### ssh authorized_keys
    $ cd && mkdir .ssh && touch .ssh/authorized_keys
    ### ADD YOUR MAIN MACHINE SSH KEY INTO THAT FILE
###### verify sha example
    $ echo "3ef833828009fb69d5c584f3701d6946f89fa304757b7947e792f9491caa270e *ubuntu-20.10-desktop-amd64.iso" | shasum -a 256 --check
    # you should get: ubuntu-20.10-desktop-amd64.iso: OK
###### lines of code basic laravel project
    $ cloc app database resources routes
###### run gui over ssh on remote computer
    $ DISPLAY=:0 lxterminal
###### run gui oder ssh local
    $ ssh pi@192.168.7.109 -Y 'lxterminal'
###### install ssh server
    $ sudo apt install openssh-server -y
    $ sudo systemctl start ssh && sudo systemctl enable ssh
