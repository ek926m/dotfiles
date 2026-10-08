# mac (apple silicon)

## setup
### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ xcode-select --install
    $ sudo scutil --set HostName mac

### remove animations
    # disable animations

    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -int 0
    killall Dock

    # restore default settings

    defaults delete com.apple.dock autohide-delay
    defaults delete com.apple.dock autohide-time-modifier
    killall Dock
    
### from zsh to bash
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin

### ~/.bash_profile
    export BASH_SILENCE_DEPRECATION_WARNING=1
    export CLICOLOR=1
    alias ls='ls -G'
    alias ll='ls -lahG'
    alias grep='grep --color=auto'

    export HOMEBREW_PREFIX=/opt/homebrew
    export PATH="$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/opt/bison/bin:$HOMEBREW_PREFIX/opt/mysql/bin:$HOME/.local/bin:$PATH"
    export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/icu4c/lib/pkgconfig:$HOMEBREW_PREFIX/opt/libxml2/lib/pkgconfig:$HOMEBREW_PREFIX/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$HOMEBREW_PREFIX/opt/openssl"

    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
    [[ -r ~/.asdf/plugins/java/set-java-home.bash ]] && . ~/.asdf/plugins/java/set-java-home.bash
    [[ -r ~/.asdf/plugins/dotnet/set-dotnet-env.bash ]] && . ~/.asdf/plugins/dotnet/set-dotnet-env.bash

    if php_dir="$(asdf where php 2>/dev/null)"; then
        export PATH="$php_dir/.composer/vendor/bin:$PATH"
    fi

    [[ $- == *i* ]] && command -v fastfetch >/dev/null && fastfetch


## homebrew
### install
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # open a new terminal

### shell
    $ brew install bash
    $ echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
    $ chsh -s /opt/homebrew/bin/bash

### packages
    $ brew install asdf pkgconf autoconf automake libtool bison re2c openssl readline xz zstd libffi libyaml gmp libsodium libzip oniguruma icu4c libiconv libxml2 gettext gd freetype libpng jpeg gpg gawk imagemagick tcl-tk

    $ brew install fastfetch git tmux wget curl ffmpeg mysql redis

### casks
    $ brew install --cask font-jetbrains-mono
    $ brew install --cask alfred
    $ brew install --cask rectangle
    $ brew install --cask vscodium
    $ brew install --cask firefox
    $ brew install --cask keepassxc
    $ brew install --cask dbeaver-community
    $ brew install --cask discord
    $ brew install --cask cyberduck

### only work additions
    $ brew install --cask vorssaint
    $ brew install awscli saml2aws
    $ brew install --cask google-chrome
    $ brew install --cask redis-insight

## git

### generate key
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    # paste the key into github
    $ ssh -T git@github.com

### git config
    $ git config --global color.ui true
    $ git config --global user.email "your@mail.com"
    $ git config --global user.name "Your Name"


## asdf

### you may need to install some system libs for the next steps
    $ asdf plugin add nodejs
    $ asdf plugin add ruby
    $ asdf plugin add php
    $ asdf plugin add python
    $ asdf plugin add java
    $ asdf plugin add dotnet
    $ asdf plugin add terraform
    
    $ asdf plugin list --urls
    $ asdf install nodejs latest
    $ asdf install ruby latest
    $ asdf install php latest
    $ asdf install python latest
    $ asdf install dotnet latest
    $ asdf list all java
    $ asdf latest java openjdk
    $ asdf install java openjdk-27
    $ asdf install terraform latest
    
    # run from your home path to create .tool-versions file
    $ asdf set nodejs latest
    $ asdf set ruby latest
    $ asdf set php latest
    $ asdf set python latest
    $ asdf set dotnet latest
    $ asdf set java openjdk-27
    $ asdf set terraform latest

    $ asdf plugin add composer
    $ asdf install composer latest
    $ asdf set composer latest

    # cat ~/.tool-versions

### rails, laravel, chromedriver
    # open a new terminal
    $ gem install rails
    $ composer global require laravel/installer
    $ npm install -g chromedriver
    $ asdf reshim nodejs


## docker runtime
## pick one
### for colima
    $ brew install colima docker docker-compose
    $ colima start --cpu 4 --memory 8 --vm-type vz --mount-type virtiofs --vz-rosetta
### for docker
    $ brew install --cask docker
    $ brew install docker-compose

### spin up a container
    $ docker run --name some-mysql --restart=always -p 127.0.0.1:3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
    $ docker run --name some-postgres --restart=always -p 127.0.0.1:5432:5432 -e POSTGRES_PASSWORD=root -d postgres:latest
    $ docker run --name some-redis --restart=always -p 127.0.0.1:6379:6379 -d redis:latest


## other stuff

### vscodium user json
    {
        "editor.wordWrap": "on",
        "security.workspace.trust.untrustedFiles": "open",
        "markdown.preview.fontSize": 12,
        "scm.inputFontSize": 12,
        "workbench.startupEditor": "none",
        "editor.tabSize": 2,
        "editor.insertSpaces": true,
        "workbench.activityBar.location": "top",
        "window.commandCenter": false,
        "workbench.layoutControl.enabled": false,
        "editor.fontSize": 14,
        "chat.viewSessions.orientation": "stacked",
        "editor.fontFamily": "'Jetbrains Mono', Menlo, Monaco, 'Courier New', monospace",
        "workbench.colorTheme": "Light Modern",
        "editor.lineHeight": 1.4,
        "workbench.iconTheme": "vscode-icons",
    }

### convert flac to alac without any losses
    # converting to alac
    $ find . -type f -name "*.flac" -exec bash -c 'ffmpeg -i "$1" -c:v copy -c:a alac "${1%.flac}.m4a"' _ {} \;

    # deleting flac
    $ find . -type f -name "*.flac" -delete
