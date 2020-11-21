# dotfiles and scripts
some configs and scripts I need to setup my dev environment

## debian based setup


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

### firewall
###### cli
    $ sudo apt install -y ufw


### ~/.bashrc
###### append following lines
    $ cat <<EOT >> ~/.bashrc

    alias ls='ls -l --color=auto'
    alias ll='ls -lah --color=auto'
    alias cp='cp -v'
    alias mv='mv -v'
    alias grep='grep --color=auto'
    alias rm='rm -v'
    alias nano='nano -$'

    alias servertux='ssh root@127.0.0.1'

    git_branch() {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

    neofetch --disable gpu --ascii_distro debian

    export PATH=~/.composer/vendor/bin:$PATH
    
    # if wsl:
    # export PATH=/mnt/c/Users/user/AppData/Local/Programs/Microsoft\ VS\ Code/bin:$PATH
    
    EOT

### system packages
###### update
    $ sudo apt update -y && sudo apt upgrade -y
###### base & dev
    $ sudo apt install -y git openjdk-11-jdk maven nmap wget gcc g++ build-essential cmake curl ncdu nano tmux libavcodec-extra python3 python3-pip ffmpeg unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline neofetch cowsay fortune-mod youtube-dl
###### remove old packages
    $ sudo apt autoremove -y

### nodejs
###### install
    $ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
###### global
    $ sudo npm install -g eslint nodemon pm2 @vue/cli

### laravel
###### composer
    $ cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
    $ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
###### global
    $ composer global require laravel/installer && rm composer-setup.php

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

### mysql (native)
    $ sudo apt install -y mariadb-server
    $ sudo mysql_secure_installation
    $ sudo mysql -u root -p
    $ CREATE DATABASE laravel;
    $ CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'laravel'; GRANT ALL PRIVILEGES ON * . * TO 'laravel'@'localhost'; update mysql.user set plugin='' where user='laravel'; FLUSH PRIVILEGES;

## desktop environment packages

### xfce stuff
    $ sudo apt install -y exfat-fuse exfat-utils redshift adapta-gtk-theme preload filezilla obs-studio
    $ sudo apt remove -y sgt-launcher sgt-puzzles gnome-sudoku gnome-mines

### firewall
###### gui
    $ sudo apt install -y gufw

### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
###### if it fails
    $ sudo apt install -f

### vs code
    $ wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    $ sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    $ sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    $ sudo apt install apt-transport-https
    $ sudo apt update
    $ sudo apt install code
    $ sudo nano /etc/sysctl.conf
    # fs.inotify.max_user_watches = 524288
    $ sudo sysctl -p --system
    # Laravel Extension Pack
    # vscode-icons
    # vetur
    # remote ssh
    # if wsl: remote wsl

### spotify
    $ curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
    $ echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    $ sudo apt-get update && sudo apt-get install spotify-client

### discord
    $ cd && cd Downloads && wget 'https://discordapp.com/api/download?platform=linux&format=deb' -O discord.deb && sudo dpkg -i discord.deb && sudo apt install -y -f

### key bindings
    ###   SUPER+F             Home folder
    ###   SUPER+W             Launch web browser
    ###   SUPER+T             gnome-terminal
    ###   *SUPER+RETURN       Maximize Window
    ###   *CTRL+ALT+SHIFT+1   Move Window to workspace 1
    ###   *CTRL+ALT+SHIFT+2   Move Window to workspace 2
    ###   *CTRL+ALT+SHIFT+3   Move Window to workspace 3
    ###   *CTRL+ALT+SHIFT+4   Move Window to workspace 4
    ###   *F11                Toggle fullscreen mode
    ###   *ALT+M		          Move Window
    ###   *ALT+R		          Resize Window
    ###   *SUPER+SPACE	      xfce4-popup-whiskermenu
    ###   CTRL+ALT+S          systemctl suspend
    ###   SUPER+L             Lock screen

### helpful scripts

###### copy host folder x over ssh with user@ip to home folder of remote
    $ rsync -v -r foldername user@12.34.56.78:.
###### find a file with a name
    $ find / -name testfile
###### curl simple web requests
    $ curl 'http://localhost/test'
    $ curl -A "test user agent" 'http://localhost/api/helloworld?name=ek&lang=de'
    $ curl -A "test user agent" -d '{"data1": "0","data2": "0"}' -H "Content-Type: application/json" -X POST http://localhost/api/test
###### redshift
    $ redshift -t 5000:4000
###### set dpi in xfce
    $ xfconf-query -c xsettings -p /Xft/DPI -s 192
    $ xfconf-query -c xsettings -p /Xft/DPI -s 96
###### tiling windowmanager like feeling
    # Window Manager Tweaks -> Placement -> Large
    $ sudo mkdir -p /usr/share/themes/empty/xfwm4 && sudo touch /usr/share/themes/empty/xfwm4/themerc
    # Window Manager -> Style -> Theme -> empty
