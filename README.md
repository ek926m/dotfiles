## Ubuntu (select minimal install)

### ~/.bashrc
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
  
### system packages
    $ sudo apt update -y && sudo apt upgrade -y
    $ sudo apt install -y net-tools git openjdk-11-jdk maven nmap wget gcc g++ build-essential cmake curl ncdu nano tmux libavcodec-extra python3 python3-pip ffmpeg unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline neofetch cowsay fortune-mod youtube-dl cloc ufw
    $ sudo apt autoremove -y

### nodejs
    $ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
    $ sudo npm install -g eslint nodemon pm2 @vue/cli lodash

### laravel
    $ cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
    $ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    $ composer global require laravel/installer && rm composer-setup.php

### ruby on rails
    # RUN COMMAND AS A LOGIN SHELL
    $ sudo apt install -y gnupg2
    $ gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    $ \curl -sSL https://get.rvm.io | bash -s stable --rails

### git
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com

### docker
    $ sudo apt install -y docker.io docker-compose
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}
    ### REBOOT
###### mariadb && phpmyadmin
    $ docker pull mariadb phpmyadmin/phpmyadmin
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
    $ docker run --name some-phpmyadmin --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin/phpmyadmin

### apps
    $ sudo apt remove -y mpv
    $ sudo apt install -y gnome-tweak-tool obs-studio vlc gimp gufw filezilla virtualbox virtualbox-qt virtualbox-dkms 

### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
    $ sudo apt install -f

### snaps
    $ sudo apt install -y snapd
    $ sudo snap install spotify rpi-imager insomnia discord
    $ sudo snap install code --classic
    $ sudo snap install intellij-idea-community --classic
    $ sudo snap install pycharm-community --classic
    $ sudo snap install android-studio --classic

## helpful

###### key bindings
    ###   SUPER+F             Home folder
    ###   SUPER+W             Launch web browser
    ###   SUPER+T             Launch terminal
    ###   CTRL+ALT+1          Move Window to workspace 1
    ###   CTRL+ALT+2          Move Window to workspace 2
    ###   CTRL+ALT+3          Move Window to workspace 3
    ###   CTRL+ALT+4          Move Window to workspace 4
    ###   CTRL+ALT+S          systemctl suspend
    ###   SUPER+L             Lock screen


###### optional (if no docker): mysql (native)
    $ sudo apt install -y mariadb-server
    $ sudo mysql_secure_installation
    $ sudo mysql -u root -p
    $ CREATE DATABASE laravel;
    $ CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'laravel'; GRANT ALL PRIVILEGES ON * . * TO 'laravel'@'localhost'; update mysql.user set plugin='' where user='laravel'; FLUSH PRIVILEGES;

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
    $ sudo apt install openssh-server
    $ sudo systemctl start ssh && sudo systemctl enable ssh
