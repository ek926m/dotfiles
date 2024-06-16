
# fedora 40 kde spin

# rpm fusion

    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    $ sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# chrome

    $ sudo dnf install fedora-workstation-repositories
    $ sudo dnf config-manager --set-enabled google-chrome
    $ sudo dnf install google-chrome-stable

# discover

    - enable flathub source
        - install moonlight flatpak
        - install spotify flatpak

# .bashrc

    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.nodenv/shims:$PATH"
    export PATH="$HOME/.pyenv/bin:$PATH"
    export PATH="$HOME/.phpenv/bin:$PATH"

# .bash_profile

    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'

    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

    eval "$(nodenv init - bash)"
    eval "$(pyenv init -)"
    eval "$(phpenv init -)"

# git

    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    $ ssh -T git@github.com

# git config

    $ git config --global color.ui true
    $ git config --global user.email "your@mail.com"
    $ git config --global user.name "Your Name"

# dnf packages

    $ sudo dnf -y groupinstall "Development Tools"
    $ sudo dnf install git rbenv gcc ruby-devel libxml2-devel sqlite sqlite3 sqlite-devel bzip2 bzip2-devel libcurl libcurl-devel libpng libpng-devel libjpeg libjpeg-devel libicu libicu-devel oniguruma oniguruma-devel libtidy libtidy-devel libxslt libxslt-devel libzip libzip-devel php-cli composer java-latest-openjdk filezilla htop obs-studio mediawriter gimp transmission gcc-c++ nano autoconf automake bison libffi-devel libtool readline-devel php-mysqlnd libyaml-devel  exfat-utils fuse-exfat ncdu tmux


# docker

    $ sudo dnf -y install dnf-plugins-core
    $ sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    $ sudo dnf install docker-compose docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    # If prompted to accept the GPG key, verify that the fingerprint matches 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35, and if so, accept it.
    $ sudo systemctl enable docker
    $ sudo systemctl start docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker $USER
    # Log out and log back in so that your group membership is re-evaluated.
    # You do not need sudo anymore then

# vs code

    $ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    $ echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    $ dnf check-update
    $ sudo dnf install code

# nodenv

    $ git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    $ cd ~/.nodenv && src/configure && make -C src
    $ echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
    $ ~/.nodenv/bin/nodenv init
    $ git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
    $ git -C "$(nodenv root)"/plugins/node-build pull
    $ cd ~/Downloads
    # download latest release https://github.com/nodenv/node-build/releases
    $ tar -xzf node-build-*.tar.gz
    $ sudo PREFIX=/usr/local ./node-build-*/install.sh

# pyenv

    $ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    $ cd ~/.pyenv && src/configure && make -C src

# phpenv

    $ git clone git@github.com:phpenv/phpenv.git ~/.phpenv
    $ git clone https://github.com/php-build/php-build $(phpenv root)/plugins/php-build

# ruby, node, python

    $ rbenv install 3.1.2 && rbenv global 3.1.2 && rbenv local 3.1.2 && rbenv rehash
    $ nodenv install 20.9.0 && nodenv global 20.9.0 && nodenv local 20.9.0 && nodenv rehash
    $ pyenv install 3.12.0 && pyenv global 3.12.0 && pyenv local 3.12.0 && pyenv rehash
    $ phpenv install 8.3.8 && phpenv global 8.3.8 && phpenv local 8.3.8 && phpenv rehash

# rails, npm libs and laravel

    $ gem install rails
    $ npm install -g nodemon @vue/cli
    $ composer global require laravel/installer

# dbeaver

    $ wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
    $ sudo rpm -ivh dbeaver-*

# mongodb compass

    $ wget https://downloads.mongodb.com/compass/mongodb-compass-1.43.0.x86_64.rpm
    $ sudo rpm -ivh mongodb-compass-*


