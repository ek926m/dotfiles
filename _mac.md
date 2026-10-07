# mac (apple silicon)

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
    
### packages
    $ brew install git mysql redis awscli saml2aws tmux bash openssl wget curl libyaml ruby-build sqlite3 gmp libsodium imagemagick bison re2c gd libiconv autoconf automake libtool icu4c oniguruma libzip composer

    $ brew install --cask font-jetbrains-mono
    
    $ brew install --cask alfred
    $ brew install --cask vorssaint
    $ brew install --cask rectangle
    $ brew install --cask vscodium
    $ brew install --cask firefox
    $ brew install --cask dbeaver-community    

    $ brew install --cask cyberduck
    $ brew install --cask discord
    $ brew tap hashicorp/tap
    $ brew install hashicorp/tap/terraform

### install and setup tooling

### [asdf](https://github.com/ek926m/dotfiles/blob/main/asdf.md)
    $ brew install asdf



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

### convert flac to alac without any losses
    # converting to alac
    $ find . -type f -name "*.flac" -exec bash -c 'ffmpeg -i "$1" -c:v copy -c:a alac "${1%.flac}.m4a"' _ {} \;
    # deleting flac
    $ find . -type f -name "*.flac" -delete

### alfred replacement IF it was possible to easy override system input, but it isnt
    open -a "Firefox"               # option + w
    open -a "Microsoft Teams"       # option + c
    open -a "Finder"                # option + f
    open -a "Terminal"              # option + t
    open -a "Preview"               # option + v
    open -a "KeePassXC"             # option + x
    open -a "vscodium"              # option + e
    open -a "DBeaver"               # option + d
    open -a "Music"                 # option + s
