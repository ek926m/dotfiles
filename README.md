## mac based setup (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta
    $ sudo scutil --set HostName mac
    
### app store
    - magnet
    
### from zsh to bash
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin

### ~/.bash_profile
    export BASH_SILENCE_DEPRECATION_WARNING=1
    alias ll='ls -lah'
    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"
    
### add to ~/.bash_profile    
    export PATH=/opt/homebrew/bin:$PATH
    
    export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
    export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export PATH="~/Library/Python/3.8/bin:$PATH"
    export JAVA_HOME="/opt/homebrew/opt/openjdk"
    
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(rbenv init -)"
    eval "$(nodenv init -)"
    eval "$(pyenv init -)"
    
### git
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com
 
### homebrew
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    $ brew install --cask docker
    $ brew install bash
    $ brew install tmux
    $ brew install php@8.0
    $ brew install composer
    $ brew install pyenv
    $ brew install nodenv
    $ brew install rbenv
    $ brew install ruby-build
    $ brew install sqlite3
    $ brew install yarn
    $ brew install docker-compose
    $ brew install openjdk
    $ brew install wget
    $ brew install neofetch
    $ brew install mysql
    $ brew install --cask chromedriver
    $ brew install --cask dbeaver-community
    $ brew install --cask google-chrome
    $ brew install --cask visual-studio-code
    $ brew install --cask microsoft-teams
    $ brew install --cask microsoft-word
    $ brew install --cask microsoft-excel
    $ brew install --cask microsoft-powerpoint
    $ brew install --cask microsoft-outlook
    $ brew install --cask spotify
    $ brew install --cask cyberduck
    $ brew install --cask discord
    $ brew install --cask topnotch
    
#### install and setup tooling
##### rbenv
    $ rbenv install 3.1.2
    $ rbenv global 3.1.2
    $ rbenv rehash
##### nodenv
    $ nodenv install 16.0.0
    $ nodenv global 16.0.0
    $ nodenv rehash
##### rails, npm libs and laravel
    $ gem install rails -v 7.0.2.3
    $ npm install -g nodemon @vue/cli    
    $ composer global require laravel/installer
    
### docker
    # mariadb
    $ docker pull mariadb 
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest

    # phpmyadmin
    $ docker pull phpmyadmin
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin

    # redis
    $ docker pull redis 
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest

    # mongodb
    $ docker pull mongo
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo

    # mysql
    $ docker pull mysql
    $ docker run --name some-mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest

    # mssql
    $ docker pull mcr.microsoft.com/mssql/server:2022-latest
    $ docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=root" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest

### vscode extensions
    onecentlin.laravel-extension-pack
    ms-vscode-remote.remote-ssh
    ms-azuretools.vscode-docker
    rangav.vscode-thunder-client
    octref.vetur
    gaulomatic.vscode-icontheme-nomo-dark-macos
    miguelsolorio.min-theme

### vscode keybindings.json for mac setups
    // Place your key bindings in this file to override the defaults
    [
        {
            "key": "cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.toggleTerminal"
        },
        {
            "key": "shift+cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.new"
        },
        {
            "key": "cmd+1",
            "command": "workbench.action.openEditorAtIndex1"
        },
        {
            "key": "cmd+2",
            "command": "workbench.action.openEditorAtIndex2"
        },
        {
            "key": "cmd+3",
            "command": "workbench.action.openEditorAtIndex3"
        },
        {
            "key": "cmd+4",
            "command": "workbench.action.openEditorAtIndex4"
        },
        {
            "key": "cmd+5",
            "command": "workbench.action.openEditorAtIndex5"
        },
        {
            "key": "cmd+6",
            "command": "workbench.action.openEditorAtIndex6"
        },
        {
            "key": "cmd+7",
            "command": "workbench.action.openEditorAtIndex7"
        },
        {
            "key": "cmd+8",
            "command": "workbench.action.openEditorAtIndex8"
        },
        {
            "key": "cmd+9",
            "command": "workbench.action.openEditorAtIndex9"
        }
    ]
