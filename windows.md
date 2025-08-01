# windows 11 dev installation

## no cloud account, use local user account
### new: 
![unnamed](https://github.com/user-attachments/assets/05a14327-d620-4798-9359-f407109d2b97)
![unnamed (1)](https://github.com/user-attachments/assets/b5561840-5e3d-48bf-ae0a-fc49ff0d6c30)

### old:
You can press SHIFT+F10 keys 
to open Command Prompt.  Execute 

`OOBE\BYPASSNRO`


## autologin if you have a living room tv pc with no data
![unnamed (2)](https://github.com/user-attachments/assets/b73bbb16-7132-4e53-b2fd-cceb84d09690)
![unnamed (3)](https://github.com/user-attachments/assets/ad9449a4-b433-4d06-8e9c-c9ec808f074b)


## winget

### main
    $ winget install --id Git.Git -e --source winget
    $ winget install --id Microsoft.WindowsTerminal -e --source winget
    $ winget install --id Microsoft.VisualStudio.2022.Community -e --source winget
    $ winget install --id Microsoft.VisualStudioCode -e --source winget
    $ winget install --id Microsoft.Office -e --source winget
    $ winget install --id dbeaver.dbeaver -e --source winget
    $ winget install --id WinSCP.WinSCP -e --source winget
    $ winget install --id Google.Chrome -e --source winget
    $ winget install --id Mozilla.Firefox -e --source winget
    $ winget install --id Discord.Discord -e --source winget
    $ winget install --id Spotify.Spotify -e --source winget
    $ winget install --id 7zip.7zip -e --source winget
    $ winget install --id ApacheFriends.Xampp.8.2 -e --source winget
    $ winget install --id RubyInstallerTeam.Ruby.3.2 -e --source winget
    $ winget install --id Python.Python.3.12 -e --source winget
    $ winget install --id OpenJS.NodeJS.LTS -e --source winget
    $ winget install --id MongoDB.Compass.Community -e --source winget
    $ winget install --id Postman.Postman -e --source winget
    $ winget install --id Valve.Steam -e --source winget
    $ winget install --id OBSProject.OBSStudio -e --source winget
    $ winget install --id GIMP.GIMP -e --source winget
    $ winget install --id Cockos.REAPER -e --source winget

# wsl
    $ wsl --install

## ubuntu
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin
    $ cd && touch .bash_profile
    
### basic packages
    $ sudo apt update
    $ sudo apt install -y git wget gcc g++ build-essential cmake ncdu curl nano tmux openjdk-21-jre-headless

### docker
    $ sudo apt install -y docker.io docker-compose
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}

#### some basic container
    $ docker run --name some-mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo


### .bash_profile
    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'
    
    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

### git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    $ ssh -T git@github.com
#### git config
    $ git config --global color.ui true
    $ git config --global user.email "your@mail.com"
    $ git config --global user.name "Your Name"

### ruby version manager https://github.com/rbenv/rbenv
    $ sudo apt install -y ruby-dev libyaml-dev ruby-build
    $ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    $ ~/.rbenv/bin/rbenv init
    $ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
#### restart shell
    $ rbenv install 3.1.6 && rbenv global 3.1.6 && rbenv rehash
    $ gem install rails
    
### node version manager https://github.com/nvm-sh/nvm
    $ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
#### add to .bash_profile
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#### restart shell
    $ nvm install --lts
    $ nvm use --lts
    $ npm install -g nodemon @vue/cli  

### python version manager https://github.com/pyenv/pyenv
    $ curl https://pyenv.run | bash
#### add to .bash_profile
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
#### restart shell
    $ pyenv install 3.10.5 && pyenv global 3.10.5 && pyenv rehash

### php version manager https://github.com/phpenv/phpenv
    $ sudo apt install -y pkg-config libbz2-dev sqlite3 libsqlite3-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libonig-dev libreadline-dev libtidy-dev libxslt-dev libzip-dev libpng-dev composer unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline php-curl  
    $ git clone https://github.com/phpenv/phpenv.git ~/.phpenv
    $ git clone https://github.com/php-build/php-build $(phpenv root)/plugins/php-build
#### add to .bash_profile
    $ export PATH="$HOME/.phpenv/bin:$PATH"
    $ eval "$(phpenv init -)"
    $ export PATH=~/.config/composer/vendor/bin:$PATH
#### restart shell
    $ phpenv install 8.1.29 && phpenv global 8.1.29 && phpenv rehash
    $ composer global require laravel/installer









    
