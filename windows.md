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
    $ sudo apt install git mysql ruby-build sqlite3 nodenv tmux bash openjdk openssl wget composer curl php yarn docker-compose pyenv rbenv libyaml

### bash
    export BASH_SILENCE_DEPRECATION_WARNING=1
    
    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'
    
    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

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

### git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    $ ssh -T git@github.com
#### git config
    $ git config --global color.ui true
    $ git config --global user.email "your@mail.com"
    $ git config --global user.name "Your Name"

#### ruby, node, python
    $ rbenv install 3.1.2 && rbenv global 3.1.2 && rbenv rehash
    $ nodenv install 16.0.0 && nodenv global 16.0.0 && nodenv rehash
    $ pyenv install 3.10.5 && pyenv global 3.10.5 && pyenv rehash

#### rails, npm libs, laravel
    $ gem install rails
    $ npm install -g nodemon @vue/cli    
    $ composer global require laravel/installer





    
