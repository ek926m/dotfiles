# windows 11 dev installation
## winget
### main
    $ winget install --id Git.Git -e --source winget
    $ winget install --id Microsoft.WindowsTerminal -e --source winget
    $ winget install --id Microsoft.VisualStudio.2022.Community -e --source winget
    $ winget install --id Microsoft.VisualStudioCode -e --source winget
    $ winget install --id dbeaver.dbeaver -e --source winget
    $ winget install --id WinSCP.WinSCP -e --source winget
    $ winget install --id Google.Chrome -e --source winget
    $ winget install --id Mozilla.Firefox -e --source winget
    $ winget install --id Discord.Discord -e --source winget
    $ winget install --id Spotify.Spotify -e --source winget

### optional
    $ winget install --id Microsoft.Office -e --source winget
    $ winget install --id MoonlightGameStreamingProject.Moonlight -e --source winget
    $ winget install --id ApacheFriends.Xampp.8.2 -e --source winget
    $ winget install --id VideoLAN.VLC -e --source winget
    $ winget install --id Plex.Plex -e --source winget
    $ winget install --id RubyInstallerTeam.Ruby.3.2 -e --source winget
    $ winget install --id Python.Python.3.12 -e --source winget
    $ winget install --id OpenJS.NodeJS.LTS -e --source winget
    $ winget install --id MongoDB.Compass.Community -e --source winget
    $ winget install --id Postman.Postman -e --source winget

# wsl
    $ wsl --install

## ubuntu
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin
    $ cd && touch .bash_profile
    $ sudo apt update
    $ sudo apt install -y git wget gcc g++ build-essential cmake ncdu curl nano tmux openjdk-21-jre-headless

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
    $ sudo apt install -y ruby-dev
    $ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    $ ~/.rbenv/bin/rbenv init
    $ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
#### add to .bash_profile
    export GEM_HOME=~/.ruby/
    export PATH="$PATH:~/.ruby/bin"
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
    $ pyenv install 3.10.5 && pyenv global 3.10.5 && pyenv rehash
#### add to .bash_profile
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
#### restart shell

### php version manager https://github.com/phpenv/phpenv
    $ sudo apt install -y pkg-config libbz2-dev sqlite3 libsqlite3-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libonig-dev libreadline-dev libtidy-dev libxslt-dev libzip-dev libpng-dev composer unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline php-curl  
    $ git clone https://github.com/phpenv/phpenv.git ~/.phpenv
    $ echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bash_profile
    $ echo 'eval "$(phpenv init -)"' >> ~/.bash_profile
    $ echo 'export PATH=~/.config/composer/vendor/bin:$PATH' >> ~/.bash_profile
#### restart shell
    $ git clone https://github.com/php-build/php-build $(phpenv root)/plugins/php-build
    $ phpenv install 8.1.29 && phpenv global 8.1.29 && phpenv rehash
    $ composer global require laravel/installer


# MAC: $ sudo apt install git mysql ruby-build sqlite3 nodenv tmux bash openjdk openssl wget composer curl php yarn docker-compose pyenv rbenv libyaml








    
