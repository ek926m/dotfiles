## ubuntu based (select minimal install)

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
    neofetch
    
### system packages
    $ sudo apt update -y && sudo apt upgrade -y
    $ sudo apt install -y git wget gcc g++ build-essential cmake curl ncdu nano tmux libavcodec-extra python3 python3-pip unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline nmap htop
###### optional packages
    $ sudo apt install -y ufw neofetch openjdk-11-jdk maven ffmpeg cowsay fortune-mod youtube-dl cloc net-tools
###### optional gui packages
    $ sudo apt install -y gufw gnome-tweak-tool obs-studio vlc gimp filezilla virtualbox virtualbox-qt virtualbox-dkms
    $ sudo apt install -y gnome-shell-extension-autohidetopbar
    # ALT+F2 -> r
    # -> Extensions
    $ sudo apt remove -y mpv && sudo apt autoremove -y

### nodejs
    $ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
    $ sudo npm install -g eslint nodemon pm2 @vue/cli lodash

### laravel
    $ cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
    $ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    $ composer global require laravel/installer && rm composer-setup.php

### docker
    $ sudo apt install -y docker.io docker-compose
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}
###### mariadb && phpmyadmin
    $ docker pull mariadb 
    $ docker pull phpmyadmin/phpmyadmin
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin/phpmyadmin
###### mongodb && mongo-express
    $ docker pull mongo
    $ docker pull mongo-express
    $ docker network create -d bridge some-network-mongo
    $ docker run --network some-network-mongo --name some-mongo -d mongo:latest --restart=always
    $ docker run --network some-network-mongo -e ME_CONFIG_MONGODB_SERVER=some-mongo -p 8081:8081 mongo-express
    
### git
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com
    
### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
    $ sudo apt install -f

### vs code
    # download .deb from https://code.visualstudio.com/
    $ sudo dpkg -i code_

### snaps
    $ sudo apt install -y snapd
    $ sudo snap install spotify rpi-imager postman discord

### mariadb without docker
    $ sudo apt install -y mariadb-server
    $ sudo mysql_secure_installation
    $ sudo mysql -u root -p
    $ CREATE DATABASE laravel;
    $ CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'laravel'; GRANT ALL PRIVILEGES ON * . * TO 'laravel'@'localhost'; update mysql.user set plugin='' where user='laravel'; FLUSH PRIVILEGES;

### if notebook
    $ sudo apt install tlp
    $ sudo systemctl status tlp
    $ sudo tlp start
    $ sudo tlp-stat


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
    
### vscode extensions
    hookyqr.beautify
    ms-azuretools.vscode-docker
    mikestead.dotenv
    editorconfig.editorconfig
    jolaleye.horizon-theme-vscode
    ryannaddy.laravel-artisan
    onecentlin.laravel-blade
    onecentlin.laravel-extension-pack
    amiralizadeh9480.laravel-extra-intellisense
    codingyu.laravel-goto-view
    onecentlin.laravel5-snippets
    stef-k.laravel-goto-controller
    miguelsolorio.min-theme
    gaulomatic.vscode-icontheme-nomo-dark-macos
    felixfbecker.php-debug
    bmewburn.vscode-intelephense-client
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    rangav.vscode-thunder-client
    octref.vetur
    
    
    
    
## macOS apple silicon (install magnet via appstore)

### change shell
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin

### ~/.bash_profile
    export BASH_SILENCE_DEPRECATION_WARNING=1

    alias ll='ls -lah'
    alias cp='cp -v'
    alias mv='mv -v'
    alias rm='rm -v'
    alias servertux='ssh root@127.0.0.1'
    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"
    
### add to ~/.bash_profile
    export PATH=/opt/homebrew/bin:$PATH
    export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
    export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
    export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export JAVA_HOME="/opt/homebrew/opt/openjdk"
    
    
### homebrew
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    $ brew install bash
    $ brew install tmux
    $ brew install php@7.4
    $ brew install composer
    $ brew install node@14
    $ brew install docker docker-compose
    $ brew install openjdk
    $ brew install wget

    $ brew install --cask docker
    $ brew install --cask spotify
    $ brew install --cask cyberduck
    $ brew install --cask discord
    $ brew install --cask google-chrome
    $ brew install --cask visual-studio-code
    $ brew install --cask microsoft-teams
    $ brew install --cask microsoft-word
    $ brew install --cask microsoft-excel
    $ brew install --cask microsoft-powerpoint
    $ brew install --cask gimp
    $ brew install --cask raspberry-pi-imager

### vscode keybindings.json
    // Place your key bindings in this file to override the defaults
    [
        {
            "key": "cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.toggleTerminal"
        },
        {
            "key": "cmd+1",
            "command": "workbench.action.openEditorAtIndex1"
        },
        {
            "key": "cmd+2",
            "command": "workbench.action.openEditorAtIndex2"
        },
        {
            "key": "cmd+3",
            "command": "workbench.action.openEditorAtIndex3"
        },
        {
            "key": "cmd+4",
            "command": "workbench.action.openEditorAtIndex4"
        },
        {
            "key": "cmd+5",
            "command": "workbench.action.openEditorAtIndex5"
        },
        {
            "key": "cmd+6",
            "command": "workbench.action.openEditorAtIndex6"
        },
        {
            "key": "cmd+7",
            "command": "workbench.action.openEditorAtIndex7"
        },
        {
            "key": "cmd+8",
            "command": "workbench.action.openEditorAtIndex8"
        },
        {
            "key": "cmd+9",
            "command": "workbench.action.openEditorAtIndex9"
        },
    ]
    
    
    
    
    
