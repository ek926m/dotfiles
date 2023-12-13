## mac based setup (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ xcode-select --install
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

### git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    $ ssh -T git@github.com

#### git config
    $ git config --global color.ui true
    $ git config --global user.email "your@mail.com"
    $ git config --global user.name "Your Name"

### install and setup tooling (use homebrew part below to install)

#### ruby, node, python
    $ rbenv install 3.1.2 && rbenv global 3.1.2 && rbenv rehash
    $ nodenv install 16.0.0 && nodenv global 16.0.0 && nodenv rehash
    $ pyenv install 3.10.5 && pyenv global 3.10.5 && pyenv rehash
    
#### rails, npm libs and laravel
    $ gem install rails
    $ npm install -g nodemon @vue/cli    
    $ composer global require laravel/installer
    
#### encrypt and zip a file
    $ zip -er project.zip ./folder_to_zip/

## homebrew

### edit ~/.bash_profile and add

    export PATH="/opt/homebrew/bin:$PATH"
    
    export PATH="/opt/homebrew/opt/php/bin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    
    export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
    export PATH="/opt/homebrew/opt/mysql/bin:$PATH" 
    
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export JAVA_HOME="/opt/homebrew/opt/openjdk"
    
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(rbenv init -)"
    eval "$(nodenv init -)"
    eval "$(pyenv init -)"

### packages
    $ brew install git mysql ruby-build sqlite3 nodenv tmux bash openjdk openssl wget composer curl php yarn docker-compose pyenv rbenv libyaml

    $ brew install --cask intellij-idea
    $ brew install --cask nvidia-geforce-now
    $ brew install --cask visual-studio-code
    $ brew install --cask cyberduck
    $ brew install --cask rectangle
    $ brew install --cask datagrip
    $ brew install --cask postman
    $ brew install --cask discord
    $ brew install --cask docker
    $ brew install --cask spotify
    $ brew install --cask google-chrome
    $ brew install --cask redisinsight
    $ brew install --cask aldente
    $ brew install --cask switchresx
    $ brew install --cask alt-tab
    $ brew install --cask reaper # I need a new license

### system settings (pre ventura)
* [settings](https://github.com/ek926m/dotfiles/blob/main/settings.md)
