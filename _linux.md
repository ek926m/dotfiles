# fedora 44

## rename pc
    $ sudo hostnamectl set-hostname --static tux

## update pc
    $ sudo dnf update -y

## enable rpm fusion
### free repo
    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
### nonfree repo
    $ sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## google-chrome-stable
    $ sudo dnf install fedora-workstation-repositories
    $ sudo dnf config-manager setopt google-chrome.enabled=1
    $ sudo dnf install google-chrome-stable

## flatpak
    $ sudo dnf install flatpak
    $ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    $ flatpak install flathub com.spotify.Client
    $ flatpak install flathub com.discordapp.Discord
    $ flatpak install com.moonlight_stream.Moonlight
    $ flatpak install io.dbeaver.DBeaverCommunity
    $ flatpak install com.visualstudio.code
    
    $ flatpak install com.redis.RedisInsight
    $ flatpak install com.mongodb.Compass
    $ flatpak install md.obsidian.Obsidian
    $ flatpak install com.getpostman.Postman
    $ flatpak install ai.lmstudio.lm-studio

## system packages
    $ sudo dnf install steam
    $ sudo dnf install ncdu tmux btop htop nano git gcc ruby-devel libxml2-devel sqlite sqlite3 sqlite-devel bzip2 bzip2-devel libcurl libcurl-devel libpng libpng-devel libjpeg libjpeg-devel libicu libicu-devel oniguruma oniguruma-devel libtidy libtidy-devel libxslt libxslt-devel libzip libzip-devel php-cli composer java-latest-openjdk gcc-c++ autoconf automake bison libffi-devel libtool readline-devel php-mysqlnd libyaml-devel exfat-utils fuse-exfat re2c gd gd-devel libpq libpq-devel patch

## remove old packages
    $ sudo dnf autoremove

## edit .bashrc
    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'

    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

## docker installation
### remove conflicting packages
    $ sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine docker-cli docker-compose

### docker community edition installation
    $ sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
    $ sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    $ sudo systemctl enable --now docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker $USER
    # relog user for docker commands to work without sudo

### spin up a container
    $ docker run --name some-mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest

## asdf installation
    # https://asdf-vm.com/guide/getting-started.html
    # https://github.com/asdf-vm/asdf/releases
    $ cd && cd Downloads && wget https://github.com/asdf-vm/asdf/releases/download/v0.20.0/asdf-v0.20.0-linux-amd64.tar.gz && tar -xvzf asdf-v0.20.0-linux-amd64.tar.gz && sudo mv asdf /usr/bin/asdf

### add to .bashrc
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
    . ~/.asdf/plugins/java/set-java-home.bash

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


## test if it works: rails, npm libs, laravel
    $ gem install rails
    $ npm install -g nodemon @vue/cli    
    $ composer global require laravel/installer

### mac alfred alternative
    $ sudo dnf install kdotool

#### Create a file named run-or-raise in your ~/.local/bin/ folder (create the folder if it doesn't exist):
    $ mkdir -p ~/.local/bin
    $ nano ~/.local/bin/run-or-raise

#### this is the files content:
    #!/bin/bash
    ## Usage: run-or-raise <window-class> <command-to-launch>
    
    CLASS=$1
    CMD=$2
    
    ## Search for the window by class name
    PID=$(kdotool search --class "$CLASS" | head -n 1)
    
    if [ -n "$PID" ]; then
      # If found, activate (focus) it
      kdotool windowactivate "$PID"
    else
      # If not found, launch it
      # detach the process so it doesn't close with the script
      nohup $CMD >/dev/null 2>&1 &
    fi

#### make it runnable and test it
    $ chmod +x ~/.local/bin/run-or-raise
    $ run-or-raise firefox firefox

#### usage to find names:
    $ kdotool search --class "steam"
    {ddff72a0-f13f-4eb5-b404-4f77947abda2}

    $ kdotool getwindowclassname {ddff72a0-f13f-4eb5-b404-4f77947abda2}
    steam

### my commands (keyboard -> shortcuts)
    Name                                               Anwendungskennung                                  Version                               Zweig                   Installation
    Discord                                            com.discordapp.Discord                             1.0.149                               stable                  system
    Redis Insight                                      com.redis.RedisInsight                             3.6.0                                 stable                  system
    Spotify                                            com.spotify.Client                                 1.2.92.147.g5b8f9367                  stable                  system
    Visual Studio Code                                 com.visualstudio.code                              1.129.1                               stable                  system
    DBeaver Community                                  io.dbeaver.DBeaverCommunity                        26.1.2                                stable                  system

    
#### add command or script
    META + V = run-or-raise okular okular
    META + W = run-or-raise google-chrome google-chrome-stable
    META + E = run-or-raise Code "flatpak run com.visualstudio.code"
    META + T = run-or-raise konsole konsole
    META + F = run-or-raise dolphin dolphin
    META + D = run-or-raise DBeaver "flatpak run io.dbeaver.DBeaverCommunity"
    META + C = run-or-raise Discord "flatpak run com.discordapp.Discord"
    META + S = run-or-raise Spotify "flatpak run com.spotify.Client"
    META + N = run-or-raise Obsidian "flatpak run md.obsidian.Obsidian"
    META + R = run-or-raise Redis "flatpak run com.redis.RedisInsight"
    META + K = run-or-raise Lmstudio "flatpak run ai.lmstudio.lm-studio"
    META + M = run-or-raise Mongodb "flatpak run com.mongodb.Compass"
    

## keyboard shortcuts
### map these to different work spaces
    Super+V  -  Viewer
    Super+W  -  Web Browser
    Super+E  -  Code Editor
    Super+T  -  Terminal
    Super+F  -  File Browser
    Super+D  -  Database Browser
    Super+C  -  Communication
    Super+S  -  Music
    Super+N  -  Notes
    Super+R  -  Cache Server Browser
    Super+K  -  KI Agent
    Super+M  -  Mongodb

#### window management
    ALT + ^ = Walk Through Windows of Current Application
    SHIFT + ALT + ^ = Walk Through Windows of Current Application (Reverse)
    ALT + TAB = Walk Through Windows
    SHIFT + ALT + TAB = Walk Through Windows (Reverse)
    META + ARROW_LEFT = Quick Tile Window to the Left
    META + ARROW_RIGHT = Quick Tile Window to the Right
    META + ARROW_TOP =  Quick Tile Window to the Top
    META + ARROW_BOTTOM = Quick Tile Window to the Bottom
    META + ENTER = Maximize Window
    META + Q = Close Window
    META + ??? = Move Window to the Center

----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----
----

## old notes

### disable swap
    $ sudo swapoff /dev/zram0
    $ sudo zramctl --reset /dev/zram0
    $ sudo touch /etc/systemd/zram-generator.conf
    $ sudo dnf remove zram-generator-defaults

#### optional: tweak energy profile
    $ tuned-adm active
    $ tuned-adm list
    $ sudo tuned-adm profile throughput-performance
    $ sudo tuned-adm verify

#### optional: play tft on android via pc remote connection
    $ sudo dnf copr enable zeno/scrcpy
    $ sudo dnf install scrcpy
    # enable developer options
    # enable usb debugging
    # allow android and pc handshake
    $ scrcpy

#### optional: custom keymap for games
    $ setxkbmap de nodeadkeys
    $ setxkbmap -v
    
    # set 105 generic instead of 104 in keyboard settings
    # set german no dead keys in keyboard settings

#### optional: keymap script
    $ nano keyboard_layout.sh
    
    #!/bin/bash
    setxkbmap de nodeadkeys

#### optional: test changes
    # go to the kde autostart settings and use this script
    # and make it runnable
    # verify it after pc restart:
    
    $ setxkbmap -v
    
        WARNING: Running setxkbmap against an Xwayland server
        Trying to build keymap using the following components:
        keycodes:   evdev+aliases(qwertz)
        types:      complete
        compat:     complete
        symbols:    pc+de(nodeadkeys)+inet(evdev)
        geometry:   pc(pc105)
    
    
#### optional: wow midnight beta:
    add following flag in settings:
    -d3d11
    then it will launch and not crash

