
# debian server install

## login as root and create user
    $ useradd -m user
    $ passwd user
    $ usermod -aG sudo,audio,video user
    $ sudo chsh -s /bin/bash user
    $ su user
    $ mkdir .ssh
    $ cd && cp -r /root/.ssh/authorized_keys .ssh/
    $ cd && sudo chown -c .ssh/$USER authorized_keys

## ~/.bashrc
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

## packages
    $ sudo apt update -y && sudo apt upgrade -y
    $ sudo apt install -y git wget gcc g++ build-essential cmake curl ncdu nano tmux libavcodec-extra python3 python3-pip unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline php-curl nmap htop python3-pip python3-flask

## nodejs
    $ curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
    $ sudo npm install -g nodemon pm2 @vue/cli

## composer
    $ cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
    $ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    $ composer global require laravel/installer && rm composer-setup.php

## docker
    $ sudo apt install -y docker.io docker-compose
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}

## remove apache and install nginx
    $ sudo apt remove -y apache2 && sudo apt install -y nginx
    
### config    
    $ sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/backup_default
    $ sudo nano /etc/nginx/sites-available/default

    server {
        listen 80;
        return 301 https://$host$request_uri;
    }

    server {
        listen       443 ssl;
        server_name  localhost;

        ssl_certificate  /etc/nginx/ssl/server.crt;
        ssl_certificate_key /etc/nginx/ssl/server.key;

        location / {
            proxy_pass http://localhost:3000;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
        }
    }

    $ sudo service nginx restart

### generate key
    $ sudo mkdir /etc/nginx/ssl && sudo touch /etc/nginx/ssl/server.key && sudo touch /etc/nginx/ssl/server.crt
    $ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt