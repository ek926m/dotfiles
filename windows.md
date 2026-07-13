# windows 11 dev installation
## winget

### main

    $ winget install --id Git.Git -e --source winget
    $ winget install --id Microsoft.VisualStudioCode -e --source winget
    $ winget install --id DBeaver.DBeaver.Community -e --source winget
    $ winget install --id WinSCP.WinSCP -e --source winget
    $ winget install --id Google.Chrome -e --source winget
    $ winget install --id Discord.Discord -e --source winget
    $ winget install --id Spotify.Spotify -e --source winget
    $ winget install --id 7zip.7zip -e --source winget

### streaming
    $ winget install --id Nvidia.GeForceNow -e --source winget
    $ winget install --id Valve.Steam -e --source winget
    $ winget install --id MoonlightGameStreamingProject.Moonlight --source winget
    $ winget install --id LizardByte.Sunshine --source winget

### optional
    $ winget install --id Rufus.Rufus -e --source winget
    $ winget install --id Postman.Postman -e --source winget
    $ winget install --id Microsoft.WindowsTerminal -e --source winget
    $ winget install --id Microsoft.Office -e --source winget
    $ winget install --id OBSProject.OBSStudio -e --source winget
    $ winget install --id GIMP.GIMP -e --source winget
    $ winget install --id Cockos.REAPER -e --source winget
    $ winget install --id ApacheFriends.Xampp.8.2 -e --source winget
    $ winget install --id MongoDB.Compass.Community -e --source winget
    $ winget install --id Microsoft.VisualStudio.2022.Community -e --source winget
    $ winget install --id Mozilla.Firefox -e --source winget
        
## wsl
    $ wsl --install --distribution FedoraLinux-44
    $ wsl --update
    $ wsl --set-default FedoraLinux-44
    $ wsl --list --verbose
    $ wsl --set-default-version 2

### install packages
    $ sudo dnf update -y
    $ sudo dnf install tmux nano git gcc ruby-devel libxml2-devel sqlite sqlite3 sqlite-devel bzip2 bzip2-devel libcurl libcurl-devel libpng libpng-devel libjpeg libjpeg-devel libicu libicu-devel oniguruma oniguruma-devel libtidy libtidy-devel libxslt libxslt-devel libzip libzip-devel php-cli composer java-latest-openjdk gcc-c++ autoconf automake bison libffi-devel libtool readline-devel php-mysqlnd libyaml-devel re2c gd gd-devel libpq libpq-devel patch
    $ sudo dnf autoremove
### add to .bashrc
    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'
    
    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
    . ~/.asdf/plugins/java/set-java-home.bash
    

### asdf installation
    # https://asdf-vm.com/guide/getting-started.html
    # https://github.com/asdf-vm/asdf/releases
    $ cd && cd Downloads && wget https://github.com/asdf-vm/asdf/releases/download/v0.20.0/asdf-v0.20.0-linux-amd64.tar.gz && tar -xvzf asdf-v0.20.0-linux-amd64.tar.gz && sudo mv asdf /usr/bin/asdf

### asdf setup
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
    $ asdf install java openjdk-24.0.2
    
    $ asdf set nodejs latest
    $ asdf set ruby latest
    $ asdf set php latest
    $ asdf set python latest
    $ asdf set java openjdk-24.0.2
    
    $ asdf plugin update --all

### create a .tool-versions file in home path
    ruby 3.4.5
    nodejs 24.5.0
    php 8.4.11
    python 3.13.5t
    java openjdk-24.0.2

### test if it works: rails, npm libs, laravel
    $ gem install rails
    $ npm install -g nodemon @vue/cli    
    $ composer global require laravel/installer

## docker desktop
    # https://www.docker.com/products/docker-desktop/
### spin up a container
    $ docker run --name some-mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
