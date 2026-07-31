# macos (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ xcode-select --install
    $ sudo scutil --set HostName mac

### remove animations
    https://apple.stackexchange.com/questions/14001/how-to-turn-off-all-animations-on-os-x/142734#142734

    # disable animations

    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -int 0
    killall Dock

    defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
    defaults write -g NSScrollAnimationEnabled -bool false
    defaults write -g NSWindowResizeTime -float 0.001
    defaults write -g QLPanelAnimationDuration -float 0
    defaults write -g NSScrollViewRubberbanding -bool false
    defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
    defaults write -g NSToolbarFullScreenAnimationDuration -float 0
    defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock expose-animation-duration -float 0
    defaults write com.apple.dock springboard-show-duration -float 0
    defaults write com.apple.dock springboard-hide-duration -float 0
    defaults write com.apple.dock springboard-page-duration -float 0
    defaults write com.apple.finder DisableAllAnimations -bool true
    defaults write com.apple.Mail DisableSendAnimations -bool true
    defaults write com.apple.Mail DisableReplyAnimations -bool true
    defaults write NSGlobalDomain NSWindowResizeTime .001

    # restore default settings

    defaults delete com.apple.dock autohide-delay
    defaults delete com.apple.dock autohide-time-modifier
    killall Dock

    defaults delete -g NSAutomaticWindowAnimationsEnabled
    defaults delete -g NSScrollAnimationEnabled
    defaults delete -g NSWindowResizeTime
    defaults delete -g QLPanelAnimationDuration
    defaults delete -g NSScrollViewRubberbanding
    defaults delete -g NSDocumentRevisionsWindowTransformAnimation
    defaults delete -g NSToolbarFullScreenAnimationDuration
    defaults delete -g NSBrowserColumnAnimationSpeedMultiplier
    defaults delete com.apple.dock autohide-time-modifier
    defaults delete com.apple.dock autohide-delay
    defaults delete com.apple.dock expose-animation-duration
    defaults delete com.apple.dock springboard-show-duration
    defaults delete com.apple.dock springboard-hide-duration
    defaults delete com.apple.dock springboard-page-duration
    defaults delete com.apple.finder DisableAllAnimations
    defaults delete com.apple.Mail DisableSendAnimations
    defaults delete com.apple.Mail DisableReplyAnimations
    defaults delete NSGlobalDomain NSWindowResizeTime
    

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

## homebrew

### edit ~/.bash_profile and add
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
    export PATH="/opt/homebrew/opt/mysql/bin:$PATH" 
    export PATH="/Users/$USER/.local/bin:$PATH"

    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
    . ~/.asdf/plugins/java/set-java-home.bash
    
### packages
    $ brew install font-jetbrains-mono
    $ brew install git mysql redis awscli saml2aws tmux bash openssl wget curl libyaml ruby-build sqlite3 gmp libsodium imagemagick bison re2c gd libiconv autoconf automake libtool icu4c oniguruma libzip composer

    $ brew install --cask alfred
    $ brew install --cask rectangle
    $ brew install --cask visual-studio-code
    $ brew install --cask spotify
    $ brew install --cask google-chrome
    $ brew install --cask dbeaver-community    
    $ brew install --cask cyberduck
    $ brew install --cask discord
    
    $ brew install --cask lm-studio
    $ brew install --cask redis-insight
    $ brew install --cask postman
    $ brew install --cask obsidian
    $ brew install --cask mongodb-compass
    $ brew install --cask nvidia-geforce-now
    $ brew install --cask 1password
    $ brew install --cask reaper

    $ brew tap hashicorp/tap
    $ brew install hashicorp/tap/terraform

### install and setup tooling

### asdf
    $ brew install asdf
    # https://github.com/asdf-vm/asdf-plugins/tree/master/plugins
    
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

#### rails, npm libs, laravel
    $ gem install rails
    $ npm install -g nodemon @vue/cli    
    $ composer global require laravel/installer

### docker runtime
#### for colima
    $ brew install colima docker docker-compose
    $ sudo xcodebuild -license accept
    $ brew services start colima
    $ colima start
    # or
    $ colima start --memory 4 --vm-type=vz --vz-rosetta
#### for docker
    $ brew install --cask docker
    $ brew install docker-compose

#### spin up a container
    $ docker run --name some-mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
    $ docker run --name some-postgres --restart=always -p 5432:5432 -e POSTGRES_PASSWORD=root -d postgres:latest
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest



