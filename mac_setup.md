## mac based setup (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ xcode-select –-install
    $ sudo scutil --set HostName mac
    $ defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
    
### from zsh to bash
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin

### ~/.bash_profile
    export BASH_SILENCE_DEPRECATION_WARNING=1

    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'
    
    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"
    

### import terminal theme
    $ wget https://raw.githubusercontent.com/ek926m/dotfiles/main/gruvbox.terminal
    
    $ wget https://raw.githubusercontent.com/ek926m/dotfiles/main/gruvbox.jpg
    or
    $ wget https://raw.githubusercontent.com/ek926m/dotfiles/main/000000.jpg
 
#### install and setup tooling
##### php xdebug
    $ arch -x86_64 sudo pecl install xdebug
##### add at top (/usr/local/Homebrew/etc/php/8.0/php.ini)
    zend_extension=xdebug.so
    xdebug.idekey=PHPSTORM
    xdebug.mode=debug
    xdebug.client_host=127.0.0.1
    xdebug.client_port=9003
    xdebug.start_with_request=yes
    xdebug.discover_client_host = 1
##### phpstorm
    - Run/Debug Configurations
        - set IDE Key (PHPSTORM)
        - Host: 127.0.0.1
        - Port: 8000
        - Debugger: Xdebug
    - CLI Interpreters:
        - Check if Debugger is: Xdebug 3.x.x
    - Additional:
        - Debugger extension: /usr/local/Homebrew/lib/php/pecl/20200930/xdebug.so
##### phpstorm fix
    # https://laracasts.com/series/how-to-be-awesome-in-phpstorm/episodes/15
    $ composer require --dev barryvdh/laravel-ide-helper
    $ php artisan ide-helper:generate
    $ php artisan ide-helper:models
    $ php artisan ide-helper:meta
##### rbenv
    $ rbenv install 3.1.2 && rbenv global 3.1.2 && rbenv rehash
##### nodenv
    $ nodenv install 16.0.0 && nodenv global 16.0.0 && nodenv rehash
##### pyenv
    $ pyenv install 3.10.5 && pyenv global 3.10.5 && pyenv rehash
##### rails, npm libs and laravel
    $ gem install rails
    $ npm install -g nodemon @vue/cli    
    $ composer global require laravel/installer
    
#### encrypt and zip a file
    $ zip -er project.zip ./folder_to_zip/



## homebrew (arm only)

### edit ~/.bash_profile and add
    export PATH=/opt/homebrew/bin:$PATH
    
    export PATH="/usr/local/homebrew/opt/php/bin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="/usr/local/homebrew/opt/openjdk/bin:$PATH"
    export JAVA_HOME="/usr/local/homebrew/opt/openjdk"
    
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(rbenv init -)"
    eval "$(nodenv init -)"
    eval "$(pyenv init -)"

### packages
    $ brew install git mysql ruby-build sqlite3 nodenv tmux bash openjdk openssl wget composer curl php yarn docker-compose pyenv rbenv libyaml
    $ brew install --cask cyberduck
    $ brew install --cask rectangle
    $ brew install --cask parsec
    $ brew install --cask datagrip
    $ brew install --cask postman
    $ brew install --cask discord
    $ brew install --cask docker
    $ brew install --cask spotify
    $ brew install --cask google-chrome
    $ brew install --cask switchresx
    $ brew install --cask intellij-idea
    $ brew install --cask nvidia-geforce-now
    $ brew install --cask visual-studio-code
    $ brew install --cask microsoft-teams
    $ brew install --cask microsoft-powerpoint
    $ brew install --cask microsoft-excel
    $ brew install --cask microsoft-word




## homebrew (old, everything supported way)

### edit ~/.bash_profile and add
    alias intelbrew='arch -x86_64 /usr/local/homebrew/bin/brew'
    export PATH=/usr/local/Homebrew/bin:$PATH
    
    alias armbrew='/opt/homebrew/bin/brew'
    export PATH=/opt/homebrew/bin:$PATH
    
    export PATH="/usr/local/homebrew/opt/php@8.0/bin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="/usr/local/homebrew/opt/openjdk/bin:$PATH"
    export JAVA_HOME="/usr/local/homebrew/opt/openjdk"
    
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(rbenv init -)"
    eval "$(nodenv init -)"
    eval "$(pyenv init -)"

### remove old installations
    brew remove --force $(brew list --formula)
    brew remove --cask --force $(brew list)

### fix permissions for x86_64 homebrew install
    $ sudo chown -R $(whoami) $(brew --prefix)/* 
    $ sudo chown -R $(whoami) /usr/local/Homebrew/completions/zsh/_brew


### intel homebrew
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    arch -x86_64 /usr/local/homebrew/bin/brew
    # alias intelbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

### arm homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /opt/homebrew/bin/brew
    # alias armbrew='/opt/homebrew/bin/brew'
  
### packages
    $ armbrew install --cask docker
    $ armbrew install docker-compose
    $ armbrew install --cask google-chrome
    $ armbrew install --cask chromedriver
    $ armbrew install --cask visual-studio-code
    $ armbrew install --cask microsoft-teams
    $ armbrew install --cask microsoft-excel
    $ armbrew install --cask microsoft-word
    $ armbrew install --cask microsoft-powerpoint
    $ armbrew install --cask intellij-idea
    $ armbrew install --cask spotify
    $ armbrew install --cask cyberduck
    $ armbrew install --cask dbeaver-community
    $ armbrew install --cask discord
    $ armbrew install --cask rectangle
    $ armbrew install --cask 1password
    $ armbrew install --cask reaper
    $ armbrew install --cask postman
    $ armbrew install --cask displaylink
    
    $ armbrew install --cask vlc
    $ armbrew install --cask transmission
    $ armbrew install --cask topnotch
    $ armbrew install --cask obs
    $ armbrew install --cask gimp
    $ armbrew install --cask caffeine
    
    $ intelbrew install bash
    $ intelbrew install tmux
    $ intelbrew install curl
    $ intelbrew install openssl
    $ intelbrew install php@8.0
    $ intelbrew install composer
    $ intelbrew install pyenv
    $ intelbrew install nodenv
    $ intelbrew install rbenv
    $ intelbrew install libyaml
    $ intelbrew install ruby-build
    $ intelbrew install mysql
    $ intelbrew install sqlite3
    $ intelbrew install yarn
    $ intelbrew install openjdk
    $ intelbrew install wget
    $ intelbrew install openconnect
    $ intelbrew install bpytop

