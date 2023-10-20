### homebrew (arm only)
#### packages
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




### homebrew (old, everything supported way)
#### remove old installations
    brew remove --force $(brew list --formula)
    brew remove --cask --force $(brew list)

#### fix permissions for x86_64 homebrew install
    $ sudo chown -R $(whoami) $(brew --prefix)/* 
    $ sudo chown -R $(whoami) /usr/local/Homebrew/completions/zsh/_brew


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
