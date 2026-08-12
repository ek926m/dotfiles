# fedora 44 gnome

## rename and update pc
    $ sudo hostnamectl set-hostname --static tux
    $ sudo dnf update -y
    $ sudo dnf autoremove

## enable rpm fusion free and nonfree repo
    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    $ sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## system packages
    $ sudo dnf install steam gnome-tweaks
    $ sudo dnf install firefox jetbrains-mono-fonts-all
    $ sudo dnf install ncdu tmux btop htop nano git gcc ruby-devel libxml2-devel sqlite sqlite3 sqlite-devel bzip2 bzip2-devel libcurl libcurl-devel libpng libpng-devel libjpeg libjpeg-devel libicu libicu-devel oniguruma oniguruma-devel libtidy libtidy-devel libxslt libxslt-devel libzip libzip-devel php-cli composer java-latest-openjdk gcc-c++ autoconf automake bison libffi-devel libtool readline-devel php-mysqlnd libyaml-devel re2c gd gd-devel libpq libpq-devel patch

## flatpak
    $ sudo dnf install flatpak
    $ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    $ flatpak install flathub com.spotify.Client
    $ flatpak install flathub com.discordapp.Discord
    $ flatpak install io.dbeaver.DBeaverCommunity
    $ flatpak install com.visualstudio.code
    $ flatpak install md.obsidian.Obsidian
    $ flatpak install com.redis.RedisInsight
    $ flatpak install com.mongodb.Compass
    $ flatpak install com.getpostman.Postman
    $ flatpak install ai.lmstudio.lm-studio

## edit .bashrc
    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'

    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

## asdf installation
    # https://asdf-vm.com/guide/getting-started.html
    # https://github.com/asdf-vm/asdf/releases
    $ cd && cd Downloads && wget https://github.com/asdf-vm/asdf/releases/download/v0.20.0/asdf-v0.20.0-linux-amd64.tar.gz && tar -xvzf asdf-v0.20.0-linux-amd64.tar.gz && sudo mv asdf /usr/bin/asdf

### add to .bashrc
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
    . ~/.asdf/plugins/java/set-java-home.bash
    export PATH="$(asdf where php)/.composer/vendor/bin:$PATH"

### you may need to install some system libs for the next steps
    $ asdf plugin add nodejs
    $ asdf plugin add ruby
    $ asdf plugin add php
    $ asdf plugin add python
    $ asdf plugin add java
    
    $ asdf plugin list --urls
    $ asdf install nodejs latest
    $ asdf install ruby latest
    $ asdf install php latest
    $ asdf install python latest
    $ asdf list all java
    $ asdf latest java openjdk
    $ asdf install java openjdk-26.0.1
    
    $ asdf set nodejs latest
    $ asdf set ruby latest
    $ asdf set php latest
    $ asdf set python latest
    $ asdf set java openjdk-26.0.1
    
    $ asdf plugin update --all

### create a .tool-versions file in home path
    ruby 4.0.6
    nodejs 26.5.0
    php 8.5.8
    python 3.14.6t
    java openjdk-26.0.1

### test if it works: rails, npm libs, laravel
    $ gem install rails
    $ composer global require laravel/installer

## docker installation

### remove conflicting packages
    $ sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine docker-cli docker-compose

### docker community edition installation
    $ sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
    $ sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    $ sudo systemctl enable --now docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker $USER
    # restart for docker commands to work without sudo

### spin up a container
    $ docker run --name some-mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
    $ docker run --name some-postgres --restart=always -p 5432:5432 -e POSTGRES_PASSWORD=root -d postgres:latest
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest
