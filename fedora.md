# dotfiles and scripts
some configs and scripts I need to setup my dev environment

## redhat based setup


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

    neofetch --disable gpu --ascii_distro redhat

    export PATH=~/.composer/vendor/bin:$PATH
    
    # if wsl:
    # export PATH=/mnt/c/Users/user/AppData/Local/Programs/Microsoft\ VS\ Code/bin:$PATH
    
    EOT

### system packages
###### update
    $ sudo dnf update -y
###### rpm fusion
    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
###### base & dev
    $ sudo dnf group install 'Development Tools' -y && sudo dnf install -y gcc-c++ nano autoconf automake bison libffi-devel libtool readline-devel sqlite-devel php-mysqlnd libyaml-devel python3 python3-pip exfat-utils fuse-exfat ncdu tmux htop neofetch

### nodejs
###### install
    $ sudo dnf install -y nodejs
###### global
    $ sudo npm install -g eslint nodemon pm2 @vue/cli

### laravel
###### composer
    $ sudo dnf install composer -y
###### global
    $ composer global require laravel/installer

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
    $ sudo dnf install -y docker docker-compose
###### service & group
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}
    ### fix RH Kernel Issue:
    $ sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
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


## desktop environment packages

### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && sudo dnf install google-chrome-stable_current_x86_64.rpm -y

### vs code
    $ cd && cd Downloads && sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && dnf check-update && sudo dnf install code -y
    $ sudo nano /etc/sysctl.conf
    # fs.inotify.max_user_watches = 524288
    $ sudo sysctl -p --system
    # Laravel Extension Pack
    # vscode-icons
    # vetur
    # remote ssh
    # if wsl: remote wsl

### other apps
    $ sudo dnf install -y gnome-tweak-tool mediawriter discord gimp transmission youtube-dl vlc firewall-config lpf-spotify-client && lpf-gui && sudo dnf remove -y lpf-spotify-client

### key bindings
    ###   SUPER+F             Home folder
    ###   SUPER+W             Launch web browser
    ###   SUPER+T             gnome-terminal
    ###   SUPER+RETURN        Maximize Window
    ###   CTRL+ALT+SHIFT+1    Move Window to workspace 1
    ###   CTRL+ALT+SHIFT+2    Move Window to workspace 2
    ###   CTRL+ALT+SHIFT+3    Move Window to workspace 3
    ###   CTRL+ALT+SHIFT+4    Move Window to workspace 4
    ###   F11                 Toggle fullscreen mode
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
