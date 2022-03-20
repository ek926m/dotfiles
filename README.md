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
###### mariadb && phpmyadmin
    $ docker pull mariadb 
    $ docker pull phpmyadmin
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin
###### mongodb
    $ docker pull mongo
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo
    # OR
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 mongo
    
### git
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com
    
### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && sudo dnf install google-chrome-stable_current_x86_64.rpm -y

### vs code
    $ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    $ sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    $ dnf check-update
    $ sudo dnf install code
    








## debian based setup

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
    
    alias dpifhd='xfconf-query -c xsettings -p /Xft/DPI -s 96'
    alias dpiuhd='xfconf-query -c xsettings -p /Xft/DPI -s 192'
    alias dpi2k='xfconf-query -c xsettings -p /Xft/DPI -s 96'
    alias dpi4k='xfconf-query -c xsettings -p /Xft/DPI -s 192'
    alias nightshift='redshift -O 4000'
    alias nightshiftoff='redshift -x'

    
### system packages
    $ sudo apt update -y && sudo apt upgrade -y
    $ sudo apt install -y git wget gcc g++ build-essential cmake curl ncdu nano tmux libavcodec-extra python3 python3-pip unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline php-curl nmap htop redshift python3-pip python3-flask
###### optional packages
    $ sudo apt install -y ufw neofetch openjdk-11-jdk maven ffmpeg cowsay fortune-mod youtube-dl cloc net-tools
###### optional gui packages
    $ sudo apt install -y gufw gnome-disk-utility obs-studio vlc gimp filezilla virtualbox virtualbox-qt virtualbox-dkms
###### remove crap
    $ sudo apt remove sgt-launcher sgt-puzzles gnome-sudoku gnome-mines -y && sudo apt autoremove -y

### nodejs
    $ curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
    $ sudo npm install -g eslint nodemon pm2 @vue/cli lodash

### mongodb
    $ curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    $ echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    $ sudo apt update -y
    $ sudo apt install mongodb-org -y
    $ sudo systemctl start mongod.service
    $ sudo systemctl enable mongod
    # mongoose connection string: mongodb://localhost:27017/

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
    $ docker pull phpmyadmin
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin
###### mongodb
    $ docker pull mongo
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo
    # OR
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 mongo
    
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
    $ sudo snap install spotify rpi-imager discord postman

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
    
## mac based setup (apple silicon)

### app store
    - magnet
    - noizio
    - daisydisk
    - telegram
    
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
    neofetch
    
### add to ~/.bash_profile    
    export PATH=/opt/homebrew/bin:$PATH
    export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
    export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
    export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export JAVA_HOME="/opt/homebrew/opt/openjdk"
    
    
### homebrew
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    $ brew install bash
    $ brew install tmux
    $ brew install php@8.0
    $ brew install composer
    $ brew install node@16
    $ brew install docker-compose
    $ brew install openjdk
    $ brew install wget
    $ brew install neofetch
    $ brew install appcleaner
    $ brew install monitorcontrol

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
    $ brew install --cask intellij-idea-ce
    $ brew install --cask pycharm-ce
    $ brew install --cask robo-3t
    $ brew install --cask tableplus











## vs code stuff

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
    vscode-icons-team.vscode-icons
    bauke.horizon-vscode

### vscode keybindings.json for non mac setups
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


### vscode keybindings.json for mac setups
    // Place your key bindings in this file to override the defaults
    [
        {
            "key": "cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.toggleTerminal"
        },
        {
            "key": "shift+cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.new"
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
        }
    ]


