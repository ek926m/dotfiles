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
    $ brew install git mysql redis tmux bash openssl wget curl libyaml ruby-build sqlite3 gmp libsodium imagemagick bison re2c gd libiconv autoconf automake libtool icu4c oniguruma libzip composer
    
    $ brew install awscli saml2aws
    $ brew tap hashicorp/tap
    $ brew install hashicorp/tap/terraform

    $ brew install --cask alfred
    $ brew install --cask rectangle-pro
    $ brew install --cask visual-studio-code
    $ brew install --cask spotify
    $ brew install --cask google-chrome
    $ brew install --cask dbeaver-community    
    $ brew install --cask cyberduck
    $ brew install --cask discord
    $ brew install --cask nvidia-geforce-now
    $ brew install --cask docker # alternative: brew install --cask rancher
    $ brew install docker-compose

    $ brew install --cask rubymine
    $ brew install --cask datagrip
    $ brew install --cask clion
    $ brew install --cask rider
    $ brew install --cask intellij-idea
    $ brew install --cask pycharm

### optional packages
    $ brew install --cask postman
    $ brew install --cask redisinsight
    $ brew install --cask mongodb-compass
    $ brew install --cask intellij-idea
    $ brew install --cask datagrip

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
    
#### encrypt and zip a file
    $ zip -er project.zip ./folder_to_zip/

### system settings (pre ventura)
* [settings](https://github.com/ek926m/dotfiles/blob/main/settings.md)

### mac os font smoothing

#### Disable font smoothing:

`defaults -currentHost write -g AppleFontSmoothing -int 0`

#### Reset to default font smoothing level (medium):

`defaults -currentHost delete -g AppleFontSmoothing`

You will need to log off or restart your Mac for any changes to take effect.

### keyboard issue <^

If this doesn't solve it, you can try manually resetting the settings file:

1.	Delete /Library/Preferences/com.apple.keyboardtype.plist
2.	Restart
3.	When the keyboard assistent pops up. press the key like it says and select ISO (European)

