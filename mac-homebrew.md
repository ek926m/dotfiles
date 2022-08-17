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
