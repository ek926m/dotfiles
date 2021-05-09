## ubuntu based (select minimal install)

### ~/.bashrc
    alias ll='ls -lah --color=auto'
    alias cp='cp -v'
    alias mv='mv -v'
    alias rm='rm -v'
    alias servertux='ssh root@127.0.0.1'
    git_branch() {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"
    export PATH=~/.config/composer/vendor/bin:$PATH
    neofetch
    
### system packages
    $ sudo apt update -y && sudo apt upgrade -y
    $ sudo apt install -y git wget gcc g++ build-essential cmake curl ncdu nano tmux libavcodec-extra python3 python3-pip unzip php php-cli php-common php-mbstring php-xml php-ldap php-mysql php-sqlite3 php-zip php-json php-opcache php-readline nmap htop
###### optional packages
    $ sudo apt install -y ufw neofetch openjdk-11-jdk maven ffmpeg cowsay fortune-mod youtube-dl cloc net-tools
###### optional gui packages
    $ sudo apt install -y gufw gnome-tweak-tool obs-studio vlc gimp filezilla virtualbox virtualbox-qt virtualbox-dkms
    $ sudo apt install -y gnome-shell-extension-autohidetopbar
    # ALT+F2 -> r
    # -> Extensions
    $ sudo apt remove -y mpv && sudo apt autoremove -y

### nodejs
    $ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
    $ sudo npm install -g eslint nodemon pm2 @vue/cli lodash

### laravel
    $ cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
    $ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    $ composer global require laravel/installer && rm composer-setup.php

### docker
    $ sudo apt install -y docker.io docker-compose
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}
###### mariadb && phpmyadmin
    $ docker pull mariadb 
    $ docker pull phpmyadmin/phpmyadmin
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
    $ docker run --name some-phpmyadmin --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin/phpmyadmin
###### mongodb && mongo-express
    $ docker pull mongo
    $ docker pull mongo-express
    $ docker network create -d bridge some-network-mongo
    $ docker run --network some-network-mongo --name some-mongo -d mongo:latest --restart=always
    $ docker run --network some-network-mongo -e ME_CONFIG_MONGODB_SERVER=some-mongo -p 8081:8081 mongo-express
    
### git
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com
    
### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
    $ sudo apt install -f

### vs code
    # download .deb from https://code.visualstudio.com/
    $ sudo dpkg -i code_

### snaps
    $ sudo apt install -y snapd
    $ sudo snap install spotify rpi-imager postman discord

### mariadb without docker
    $ sudo apt install -y mariadb-server
    $ sudo mysql_secure_installation
    $ sudo mysql -u root -p
    $ CREATE DATABASE laravel;
    $ CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'laravel'; GRANT ALL PRIVILEGES ON * . * TO 'laravel'@'localhost'; update mysql.user set plugin='' where user='laravel'; FLUSH PRIVILEGES;

### if notebook
    $ sudo apt install tlp
    $ sudo systemctl status tlp
    $ sudo tlp start
    $ sudo tlp-stat


## helpful

###### copy host folder x over ssh with user@ip to home folder of remote
    $ rsync -v -r foldername user@12.34.56.78:.
###### find a file with a name
    $ find / -name testfile
###### curl simple web requests
    $ curl 'http://localhost/test'
    $ curl -A "test user agent" 'http://localhost/api/helloworld?name=ek&lang=de'
    $ curl -A "test user agent" -d '{"data1": "0","data2": "0"}' -H "Content-Type: application/json" -X POST http://localhost/api/test
###### change root password
    $ passwd
###### create user
    $ useradd -m user
    $ passwd user
###### add user to groups
    $ usermod -aG sudo,audio,video user
###### change shell to bash
    $ sudo chsh -s /bin/bash user
###### switch user
    $ su user
###### ssh authorized_keys
    $ cd && mkdir .ssh && touch .ssh/authorized_keys
    ### ADD YOUR MAIN MACHINE SSH KEY INTO THAT FILE
###### verify sha example
    $ echo "3ef833828009fb69d5c584f3701d6946f89fa304757b7947e792f9491caa270e *ubuntu-20.10-desktop-amd64.iso" | shasum -a 256 --check
    # you should get: ubuntu-20.10-desktop-amd64.iso: OK
###### lines of code basic laravel project
    $ cloc app database resources routes
###### run gui over ssh on remote computer
    $ DISPLAY=:0 lxterminal
###### run gui oder ssh local
    $ ssh pi@192.168.7.109 -Y 'lxterminal'
###### install ssh server
    $ sudo apt install openssh-server -y
    $ sudo systemctl start ssh && sudo systemctl enable ssh

## macOS (install xcode via appstore)

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
    
    export PATH=/opt/homebrew/bin:$PATH
    export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
    export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
    export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
    
### homebrew
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    $ brew install bash
    $ brew install php@7.4
    $ brew install composer
    $ brew install node@14
    $ brew install docker docker-compose

    $ brew install --cask docker
    $ brew install --cask visual-studio-code
    $ brew install --cask microsoft-teams
    $ brew install --cask spotify
    $ brew install --cask postman
    $ brew install --cask cyberduck
    $ brew install --cask discord
    $ brew install --cask google-chrome
    $ brew install --cask firefox
    $ brew install --cask sequel-pro

## windows terminal
### software
    - chrome
    - spotify
    - discord
    - teams
    - steam
    - filezilla
    - vs code
    - vs studio
    - windows terminal
    - 7zip
    - xampp
    - composer
    - docker
    - firefox
    - office
    - git for windows
    - python
    - nodejs
    - postman
### settings.json
    {
        "$schema": "https://aka.ms/terminal-profiles-schema",
        // Add custom actions and keybindings to this array.
        // To unbind a key combination from your defaults.json, set the command to "unbound".
        // To learn more about actions and keybindings, visit https://aka.ms/terminal-keybindings
        "actions": 
        [
            // Copy and paste are bound to Ctrl+Shift+C and Ctrl+Shift+V in your defaults.json.
            // These two lines additionally bind them to Ctrl+C and Ctrl+V.
            // To learn more about selection, visit https://aka.ms/terminal-selection
            {
                "command": 
                {
                    "action": "copy",
                    "singleLine": false
                },
                "keys": "ctrl+c"
            },
            {
                "command": "paste",
                "keys": "ctrl+v"
            },
            // Press Ctrl+Shift+F to open the search box
            {
                "command": "find",
                "keys": "ctrl+shift+f"
            },
            // Press Alt+Shift+D to open a new pane.
            // - "split": "auto" makes this pane open in the direction that provides the most surface area.
            // - "splitMode": "duplicate" makes the new pane use the focused pane's profile.
            // To learn more about panes, visit https://aka.ms/terminal-panes
            {
                "command": 
                {
                    "action": "splitPane",
                    "split": "auto",
                    "splitMode": "duplicate"
                },
                "keys": "alt+shift+d"
            }
        ],
        "copyFormatting": "none",
        "copyOnSelect": false,
        "defaultProfile": "{58ad8b0c-3ef8-5f4d-bc6f-13e4c00f2530}",
        "profiles": 
        {
            "defaults": 
            {
                "fontFace": "Droid Sans Mono"
            },
            "list": 
            [
                {
                    "commandline": "powershell.exe",
                    "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                    "hidden": true,
                    "name": "Windows PowerShell",
                },
                {
                    "commandline": "cmd.exe",
                    "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                    "hidden": true,
                    "name": "Eingabeaufforderung"
                },
                {
                    "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
                    "hidden": true,
                    "name": "Azure Cloud Shell",
                    "source": "Windows.Terminal.Azure"
                },
                {
                    "colorScheme": "One Half Light",
                    "commandline": "%PROGRAMFILES%/git/usr/bin/bash.exe -i -l",
                    "fontSize": 12,
                    "fontFace": "Droid Sans Mono",
                    "guid": "{58ad8b0c-3ef8-5f4d-bc6f-13e4c00f2530}",
                    "hidden": false,
                    "icon": "%PROGRAMFILES%/Git/mingw64/share/git/git-for-windows.ico",
                    "name": "Bash",
                    "scrollbarState": "hidden",
                    "startingDirectory": "%USERPROFILE%/Projekte"
                }
            ]
        },
        "schemes": 
        [
            {
                "background": "#0C0C0C",
                "black": "#0C0C0C",
                "blue": "#0037DA",
                "brightBlack": "#767676",
                "brightBlue": "#3B78FF",
                "brightCyan": "#61D6D6",
                "brightGreen": "#16C60C",
                "brightPurple": "#B4009E",
                "brightRed": "#E74856",
                "brightWhite": "#F2F2F2",
                "brightYellow": "#F9F1A5",
                "cursorColor": "#FFFFFF",
                "cyan": "#3A96DD",
                "foreground": "#CCCCCC",
                "green": "#13A10E",
                "name": "Campbell",
                "purple": "#881798",
                "red": "#C50F1F",
                "selectionBackground": "#FFFFFF",
                "white": "#CCCCCC",
                "yellow": "#C19C00"
            },
            {
                "background": "#012456",
                "black": "#0C0C0C",
                "blue": "#0037DA",
                "brightBlack": "#767676",
                "brightBlue": "#3B78FF",
                "brightCyan": "#61D6D6",
                "brightGreen": "#16C60C",
                "brightPurple": "#B4009E",
                "brightRed": "#E74856",
                "brightWhite": "#F2F2F2",
                "brightYellow": "#F9F1A5",
                "cursorColor": "#FFFFFF",
                "cyan": "#3A96DD",
                "foreground": "#CCCCCC",
                "green": "#13A10E",
                "name": "Campbell Powershell",
                "purple": "#881798",
                "red": "#C50F1F",
                "selectionBackground": "#FFFFFF",
                "white": "#CCCCCC",
                "yellow": "#C19C00"
            },
            {
                "background": "#282C34",
                "black": "#282C34",
                "blue": "#61AFEF",
                "brightBlack": "#5A6374",
                "brightBlue": "#61AFEF",
                "brightCyan": "#56B6C2",
                "brightGreen": "#98C379",
                "brightPurple": "#C678DD",
                "brightRed": "#E06C75",
                "brightWhite": "#DCDFE4",
                "brightYellow": "#E5C07B",
                "cursorColor": "#FFFFFF",
                "cyan": "#56B6C2",
                "foreground": "#DCDFE4",
                "green": "#98C379",
                "name": "One Half Dark",
                "purple": "#C678DD",
                "red": "#E06C75",
                "selectionBackground": "#FFFFFF",
                "white": "#DCDFE4",
                "yellow": "#E5C07B"
            },
            {
                "background": "#FAFAFA",
                "black": "#383A42",
                "blue": "#0184BC",
                "brightBlack": "#4F525D",
                "brightBlue": "#61AFEF",
                "brightCyan": "#56B5C1",
                "brightGreen": "#98C379",
                "brightPurple": "#C577DD",
                "brightRed": "#DF6C75",
                "brightWhite": "#FFFFFF",
                "brightYellow": "#E4C07A",
                "cursorColor": "#4F525D",
                "cyan": "#0997B3",
                "foreground": "#383A42",
                "green": "#50A14F",
                "name": "One Half Light",
                "purple": "#A626A4",
                "red": "#E45649",
                "selectionBackground": "#FFFFFF",
                "white": "#FAFAFA",
                "yellow": "#C18301"
            },
            {
                "background": "#002B36",
                "black": "#002B36",
                "blue": "#268BD2",
                "brightBlack": "#073642",
                "brightBlue": "#839496",
                "brightCyan": "#93A1A1",
                "brightGreen": "#586E75",
                "brightPurple": "#6C71C4",
                "brightRed": "#CB4B16",
                "brightWhite": "#FDF6E3",
                "brightYellow": "#657B83",
                "cursorColor": "#FFFFFF",
                "cyan": "#2AA198",
                "foreground": "#839496",
                "green": "#859900",
                "name": "Solarized Dark",
                "purple": "#D33682",
                "red": "#DC322F",
                "selectionBackground": "#FFFFFF",
                "white": "#EEE8D5",
                "yellow": "#B58900"
            },
            {
                "background": "#FDF6E3",
                "black": "#002B36",
                "blue": "#268BD2",
                "brightBlack": "#073642",
                "brightBlue": "#839496",
                "brightCyan": "#93A1A1",
                "brightGreen": "#586E75",
                "brightPurple": "#6C71C4",
                "brightRed": "#CB4B16",
                "brightWhite": "#FDF6E3",
                "brightYellow": "#657B83",
                "cursorColor": "#002B36",
                "cyan": "#2AA198",
                "foreground": "#657B83",
                "green": "#859900",
                "name": "Solarized Light",
                "purple": "#D33682",
                "red": "#DC322F",
                "selectionBackground": "#FFFFFF",
                "white": "#EEE8D5",
                "yellow": "#B58900"
            },
            {
                "background": "#000000",
                "black": "#000000",
                "blue": "#3465A4",
                "brightBlack": "#555753",
                "brightBlue": "#729FCF",
                "brightCyan": "#34E2E2",
                "brightGreen": "#8AE234",
                "brightPurple": "#AD7FA8",
                "brightRed": "#EF2929",
                "brightWhite": "#EEEEEC",
                "brightYellow": "#FCE94F",
                "cursorColor": "#FFFFFF",
                "cyan": "#06989A",
                "foreground": "#D3D7CF",
                "green": "#4E9A06",
                "name": "Tango Dark",
                "purple": "#75507B",
                "red": "#CC0000",
                "selectionBackground": "#FFFFFF",
                "white": "#D3D7CF",
                "yellow": "#C4A000"
            },
            {
                "background": "#FFFFFF",
                "black": "#000000",
                "blue": "#3465A4",
                "brightBlack": "#555753",
                "brightBlue": "#729FCF",
                "brightCyan": "#34E2E2",
                "brightGreen": "#8AE234",
                "brightPurple": "#AD7FA8",
                "brightRed": "#EF2929",
                "brightWhite": "#EEEEEC",
                "brightYellow": "#FCE94F",
                "cursorColor": "#000000",
                "cyan": "#06989A",
                "foreground": "#555753",
                "green": "#4E9A06",
                "name": "Tango Light",
                "purple": "#75507B",
                "red": "#CC0000",
                "selectionBackground": "#FFFFFF",
                "white": "#D3D7CF",
                "yellow": "#C4A000"
            },
            {
                "background": "#000000",
                "black": "#000000",
                "blue": "#000080",
                "brightBlack": "#808080",
                "brightBlue": "#0000FF",
                "brightCyan": "#00FFFF",
                "brightGreen": "#00FF00",
                "brightPurple": "#FF00FF",
                "brightRed": "#FF0000",
                "brightWhite": "#FFFFFF",
                "brightYellow": "#FFFF00",
                "cursorColor": "#FFFFFF",
                "cyan": "#008080",
                "foreground": "#C0C0C0",
                "green": "#008000",
                "name": "Vintage",
                "purple": "#800080",
                "red": "#800000",
                "selectionBackground": "#FFFFFF",
                "white": "#C0C0C0",
                "yellow": "#808000"
            }
        ]
    }

