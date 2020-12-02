# debian based setup
## Ubuntu (select minimal install)
### configuration

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

    neofetch

    export PATH=~/.composer/vendor/bin:$PATH
    
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

### ruby on rails
###### terminal settings
    RUN COMMAND AS A LOGIN SHELL
###### dependencies
    $ sudo apt install -y gnupg2
###### import keys
    $ gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
###### ruby + rails
    $ \curl -sSL https://get.rvm.io | bash -s stable --rails

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

### optional (if no docker): mysql (native)
    $ sudo apt install -y mariadb-server
    $ sudo mysql_secure_installation
    $ sudo mysql -u root -p
    $ CREATE DATABASE laravel;
    $ CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'laravel'; GRANT ALL PRIVILEGES ON * . * TO 'laravel'@'localhost'; update mysql.user set plugin='' where user='laravel'; FLUSH PRIVILEGES;

## desktop environment packages

### firewall
###### cli and gui
    $ sudo apt install -y ufw gufw

### apps
    $ sudo apt remove -y mpv
    # set font scaling to 1.25
    $ sudo apt install -y gnome-tweak-tool obs-studio vlc gimp

### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
###### if it fails
    $ sudo apt install -f

### if you want to use snaps
    $ sudo apt install -y snapd
    $ sudo snap install spotify rpi-imager insomnia discord beekeeper-studio
    $ sudo snap install code --classic
    $ sudo snap install intellij-idea-community --classic
    $ sudo snap install pycharm-community --classic
    $ sudo snap install android-studio --classic

### key bindings
    ###   SUPER+F             Home folder
    ###   SUPER+W             Launch web browser
    ###   SUPER+T             Launch terminal
    ###   CTRL+ALT+1          Move Window to workspace 1
    ###   CTRL+ALT+2          Move Window to workspace 2
    ###   CTRL+ALT+3          Move Window to workspace 3
    ###   CTRL+ALT+4          Move Window to workspace 4
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

