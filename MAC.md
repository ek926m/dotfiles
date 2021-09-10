## macOS apple silicon (install magnet via appstore)

### change shell
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin

### ~/.bash_profile
    export BASH_SILENCE_DEPRECATION_WARNING=1

    alias ll='ls -lah'
    alias cp='cp -v'
    alias mv='mv -v'
    alias rm='rm -v'
    alias servertux='ssh root@127.0.0.1'
    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"
    neofetch
    
### add to ~/.bash_profile    
    export PATH=/opt/homebrew/bin:$PATH
    export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
    export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
    export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export JAVA_HOME="/opt/homebrew/opt/openjdk"
    
    
### homebrew
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    $ brew install bash
    $ brew install tmux
    $ brew install php@7.4
    $ brew install composer
    $ brew install node@14
    $ brew install docker docker-compose
    $ brew install openjdk
    $ brew install wget
    $ brew install neofetch

    $ brew install --cask docker
    $ brew install --cask spotify
    $ brew install --cask cyberduck
    $ brew install --cask discord
    $ brew install --cask google-chrome
    $ brew install --cask visual-studio-code
    $ brew install --cask microsoft-teams
    $ brew install --cask microsoft-word
    $ brew install --cask microsoft-excel
    $ brew install --cask microsoft-powerpoint
    $ brew install --cask gimp
    $ brew install --cask raspberry-pi-imager
    $ brew install --cask intellij-idea-ce
    $ brew install --cask pycharm-ce

### vscode keybindings.json
    // Place your key bindings in this file to override the defaults
    [
        {
            "key": "cmd+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.toggleTerminal"
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
    ]
    
### if the keyboard is broken
    $ sudo rm /Library/Preferences/com.apple.keyboardtype.plist
    restart mac

    src: https://github.com/tmk/tmk_keyboard/issues/35
    src: https://www.mactechnews.de/forum/discussion/MX-Keys-Tasten-vertauscht-340788.html

    
