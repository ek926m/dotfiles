# dotfiles and scripts
some configs and scripts I need to setup my dev environment

## debian based setup

### ~/.bashrc
###### append following lines
    alias ls='ls -l --color=auto'
    alias ll='ls -lah --color=auto'
    alias cp='cp -v'
    alias mv='mv -v'
    alias grep='grep --color=auto'
    alias rm='rm -v'
    alias nano='nano -$'

    alias servertux='ssh root@134.122.75.61'
    alias home='cd ~/projects'

    git_branch() {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

    #neofetch --disable gpu --ascii_distro debian
    #fortune | cowsay -f tux
    export PATH=~/.composer/vendor/bin:$PATH
    

### configuration
###### change root password
    $ passwd
###### create user
    $ useradd -m user
    $ passwd user
###### add user to groups
    $ usermod -aG sudo,audio,video user
###### change shell to bash
    $ sudo chsh -s /bin/bash user


### ssh
###### authorized_keys
    $ cd && mkdir .ssh && touch .ssh/authorized_keys
    ### ADD YOUR MAIN MACHINE SSH KEY INTO THAT FILE


### system packages
###### update
    $ sudo apt update && sudo apt upgrade -y
###### base & dev
    $ sudo apt install -y git openjdk-11-jdk maven nmap wget gcc g++ build-essential cmake curl ncdu nano tmux libavcodec-extra python3 python3-pip ffmpeg unzip php php-cli php-common php-mbstring php-xml php-mysql php-sqlite3 php-zip php-json php-opcache php-readline neofetch cowsay fortune-mod youtube-dl exfat-fuse exfat-utils
###### remove old packages
    $ sudo apt autoremove -y


### nodejs
###### install
    $ curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
###### global
    $ sudo npm install -g eslint nodemon pm2 @vue/cli


### laravel
###### composer
    $ cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
    $ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
###### global
    $ composer global require laravel/installer && rm composer-setup.php


### docker
###### install
    $ sudo apt install -y docker.io docker-compose
###### service & group
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}
    ### REBOOT
###### redis
    $ docker pull redis
    $ docker run --name some-redis --restart=always -p 6379:6379 redis
###### mariadb
    $ docker pull mariadb
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
###### phpmyadmin
    $ docker pull phpmyadmin/phpmyadmin
    $ docker run --name some-phpmyadmin --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin/phpmyadmin


### git
###### config
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
###### generate key
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
###### add to account
    ### https://github.com/settings/keys
###### verify
    $ ssh -T git@github.com


### firewall
###### cli
    $ sudo apt install -y ufw


## helpful scripts
###### copy files over ssh to a remote server
    ### copy host folder x over ssh with user@ip to home folder of remote
    $ rsync -v -r foldername user@12.34.56.78:.
###### find a file with a name
    $ find / -name testfile
###### curl simple web requests
    $ curl 'http://localhost/test'
    $ curl -A "test user agent" 'http://localhost/api/helloworld?name=ek&lang=de'
    $ curl -A "test user agent" -d '{"data1": "0","data2": "0"}' -H "Content-Type: application/json" -X POST http://localhost/api/test



## desktop environment packages

### firewall
###### gui
    $ sudo apt install -y gufw

### software
###### gui
    $ sudo apt install -y gpick gimp vlc obs-studio libreoffice remmina transmission papirus-icon-theme
###### theme
    adapta-nokto via cinnamon theme finder
###### remove crap
    $ sudo apt-get purge -y snapd aisleriot gnome-sudoku gnome-mines gnome-mahjongg cheese thunderbird seahorse gnome-todo totem totem-plugins shotwell deja-dup gnome-todo-common gnome-getting-started-docs gnome-logs gnome-power-manager yelp rhythmbox mpv && sudo apt-get purge -y aisleriot gnome-sudoku gnome-mines gnome-mahjongg cheese thunderbird seahorse gnome-todo totem totem-plugins shotwell deja-dup gnome-todo-common gnome-getting-started-docs gnome-logs gnome-power-manager yelp rhythmbox mpv five-or-more four-in-a-row gnome-chess gnome-klotski gnome-nibbles gnome-robots gnome-taquin gnome-tetravex hitori hoichess iagno lightsoff quadrapassel swell-foop tali brasero pidgin sound-juicer mlterm xiterm+thai xterm goldendict fcitx kasumi hdate-applet uim mozc-data mozc-server mozc-utils-gui uim-mozc uim-data mlterm-common fcitx-* && sudo apt autoremove -y
###### remove old packages
    $ sudo apt autoremove -y

### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb


### vscode
###### install
    ### https://code.visualstudio.com/Download
    $ sudo dpkg -i code_<version>
###### addons
- Horizon Theme
- Nomo Dark MacOS Icon Theme
- Rest Client
- Laravel Extension Pack
- ES6
- ES7
- Docker
- Remote SSH


### spotify
    $ curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
    $ echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    $ sudo apt-get update && sudo apt-get install spotify-client


### discord
    $ cd && cd Downloads && wget 'https://discordapp.com/api/download?platform=linux&format=deb' -O discord.deb && sudo dpkg -i discord.deb


### power management for notebooks
    $ sudo apt install tlp -y
    $ sudo systemctl enable tlp



### ONLY IF REALLY NEEDED [BACKPORTS] 
    $ echo "deb http://deb.debian.org/debian buster-backports main" | sudo tee /etc/apt/sources.list.d/buster-backports.list
##### NEW KERNEL
    $ sudo apt-get update && apt search -t buster-backports linux-image && sudo apt install -t buster-backports -y linux-image-amd64



### key bindings
    ###   SUPER+F             Home folder
    ###   SUPER+W             Launch web browser
    ###   SUPER+T             gnome-terminal
    ###   SUPER+,             Settings
    ###   CTRL+ALT+1          Move Window to workspace 1
    ###   CTRL+ALT+2          Move Window to workspace 2
    ###   CTRL+ALT+3          Move Window to workspace 3
    ###   CTRL+ALT+4          Move Window to workspace 4
    ###   F11                 Toggle fullscreen mode
    ###   CTRL+ALT+S          systemctl suspend
    ###   SUPER+L             Lock screen
