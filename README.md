## mac based setup (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ sudo scutil --set HostName mac
    $ defaults write com.apple.screencapture type jpg
    $ defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
    $ zip -er project.zip ./folder_to_zip/

### app store
    - xcode
    - magnet
    - noizio
    
### from zsh to bash
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin

### import terminal theme
    $ wget https://raw.githubusercontent.com/ek926m/.dotfiles/main/Gruvbox-dark.terminal

### ~/.bash_profile
    export BASH_SILENCE_DEPRECATION_WARNING=1
    alias vpn="sudo openconnect -v --authgroup d.velop -u ekai webvpn.d-velop.de"

    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'
    
    alias fire='vlc --intf dummy ~/aa_fire.mp3 --gain=0.4'
    alias thunder='vlc --intf dummy ~/aa_thunder.mp3 --gain=0.15'

    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

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

### homebrew
#### remove old installations
    brew remove --force $(brew list --formula)
    brew remove --cask --force $(brew list)

#### intel homebrew
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    arch -x86_64 /usr/local/homebrew/bin/brew
    # alias intelbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

#### arm homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /opt/homebrew/bin/brew
    # alias armbrew='/opt/homebrew/bin/brew'
  
#### packages
    $ armbrew install --cask docker
    $ armbrew install docker-compose
    $ armbrew install --cask google-chrome
    $ armbrew install --cask chromedriver
    $ armbrew install --cask visual-studio-code
    $ armbrew install --cask microsoft-teams
    $ armbrew install --cask raspberry-pi-imager
    $ armbrew install --cask spotify
    $ armbrew install --cask cyberduck
    $ armbrew install --cask dbeaver-community
    $ armbrew install --cask discord
    
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
 
#### install and setup tooling
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
    
### vscode extensions
    code --list-extensions | xargs -L 1 echo code --install-extension
    code --install-extension amiralizadeh9480.laravel-extra-intellisense
    code --install-extension bmewburn.vscode-intelephense-client
    code --install-extension codingyu.laravel-goto-view
    code --install-extension EditorConfig.EditorConfig
    code --install-extension Gaulomatic.vscode-icontheme-nomo-dark-macos
    code --install-extension glitchbl.laravel-create-view
    code --install-extension IHunte.laravel-blade-wrapper
    code --install-extension miguelsolorio.min-theme
    code --install-extension mikestead.dotenv
    code --install-extension naoray.laravel-goto-components
    code --install-extension octref.vetur
    code --install-extension onecentlin.laravel-blade
    code --install-extension onecentlin.laravel-extension-pack
    code --install-extension onecentlin.laravel5-snippets
    code --install-extension rebornix.ruby
    code --install-extension ryannaddy.laravel-artisan
    code --install-extension sainnhe.gruvbox-material
    code --install-extension shufo.vscode-blade-formatter
    code --install-extension sianglim.slim
    code --install-extension wingrunr21.vscode-ruby 
  
### vscode user settings.json
    {
        "workbench.iconTheme": "vscode-icontheme-nomo-dark-macos",
        "workbench.colorTheme": "Min Light",
        "terminal.integrated.fontSize": 14,
        "editor.wordWrap": "on",
        "security.workspace.trust.untrustedFiles": "open",
        "workbench.activityBar.visible": false,
        "ruby.intellisense": "rubyLocate",
        "editor.fontSize": 13
    }

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
        },
        {
            "key": "cmd+0",
            "command": "workbench.action.zoomReset"
        },
        {
            "key": "cmd+numpad0",
            "command": "-workbench.action.zoomReset"
        },
        {
            "key": "cmd+g",
            "command": "-editor.action.nextMatchFindAction",
            "when": "editorFocus"
        },
        {
            "key": "shift+cmd+g",
            "command": "-editor.action.previousMatchFindAction",
            "when": "editorFocus"
        },
        {
            "key": "shift+cmd+g",
            "command": "-workbench.action.terminal.findPrevious",
            "when": "terminalFindFocused && terminalHasBeenCreated || terminalFindFocused && terminalProcessSupported || terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported"
        },
        {
            "key": "shift+cmd+g",
            "command": "workbench.view.scm",
            "when": "workbench.scm.active"
        },
        {
            "key": "ctrl+shift+g",
            "command": "-workbench.view.scm",
            "when": "workbench.scm.active"
        }
    ]
