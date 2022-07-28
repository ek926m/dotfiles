## mac based setup (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ sudo scutil --set HostName mac
    $ defaults write com.apple.screencapture type jpg
    $ defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock

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

### git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    ### https://github.com/settings/keys
    $ ssh -T git@github.com

#### git config
    $ git config --global init.defaultBranch master
    $ git config --global user.email "ek926m@gmail.com"
    $ git config --global user.name "Eugen Kaiser"
    $ git config --global color.branch auto
    $ git config --global color.diff auto
    $ git config --global color.interactive auto
    $ git config --global color.status auto
    $ git config --global color.ui auto
    $ git config --global pull.ff only
    
#### create new project from folder
    $ git init -b master
    $ git add .
    $ git commit -am "initial"
    $ git remote add origin git@github.com:ek926m/test.git
    $ git remote -v
    $ git push -u -f origin master
 
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
    $ armbrew install --cask tableplus
    $ armbrew install --cask discord
    $ armbrew install --cask vlc
    
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
    
### docker
#### mariadb + phpmyadmin
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin

#### redis + rediscommander (search for ip like 172.17.0.3)
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest
    $ docker inspect some-redis
    $ docker run --name some-rediscommander --platform linux/x86_64 -p 8081:8081 -e REDIS_HOSTS=local:172.17.0.3:6379 --restart always -d rediscommander/redis-commander:latest

#### mongodb
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo

#### mysql + phpmyadmin
    $ docker run --name some-mysql --platform linux/x86_64 --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mysql:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin
    
#### mssql (if you really need it)
    $ docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=root" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest

### vscode extensions
    $ code --list-extensions | xargs -L 1 echo code --install-extension
    $ code --install-extension 2gua.rainbow-brackets
    $ code --install-extension amiralizadeh9480.laravel-extra-intellisense
    $ code --install-extension bradlc.vscode-tailwindcss
    $ code --install-extension bung87.vscode-gemfile
    $ code --install-extension castwide.solargraph
    $ code --install-extension codingyu.laravel-goto-view
    $ code --install-extension EditorConfig.EditorConfig
    $ code --install-extension Gaulomatic.vscode-icontheme-nomo-dark-macos
    $ code --install-extension glitchbl.laravel-create-view
    $ code --install-extension IHunte.laravel-blade-wrapper
    $ code --install-extension miguelsolorio.min-theme
    $ code --install-extension mikestead.dotenv
    $ code --install-extension misogi.ruby-rubocop
    $ code --install-extension ms-azuretools.vscode-docker
    $ code --install-extension ms-vscode-remote.remote-containers
    $ code --install-extension ms-vscode-remote.remote-ssh
    $ code --install-extension ms-vscode-remote.remote-ssh-edit
    $ code --install-extension naoray.laravel-goto-components
    $ code --install-extension octref.vetur
    $ code --install-extension onecentlin.laravel-blade
    $ code --install-extension onecentlin.laravel-extension-pack
    $ code --install-extension onecentlin.laravel5-snippets
    $ code --install-extension rangav.vscode-thunder-client
    $ code --install-extension rebornix.ruby
    $ code --install-extension ryannaddy.laravel-artisan
    $ code --install-extension sainnhe.gruvbox-material
    $ code --install-extension shufo.vscode-blade-formatter
    $ code --install-extension sianglim.slim
    $ code --install-extension wingrunr21.vscode-ruby  
  

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
        }
    ]

## system settings
- Apple-ID
    - alles UNCHECK außer 'Meinen Mac suchen'
- Allgemein
    - Standard-Webbrowser: Google Chrome
    - Handoff zwischen diesem Mac und deinen iCloud-Geräten erlauben UNCHECK
- Schreibtisch & Bildschirmschoner
    - Schreibtisch
        - Hintergrund aussuchen
    - Bildschirmschoner
        - Verwehen auswählen
        - Bildschirmschoner anzeigen nach x Minuten UNCHECK
        - Aktive Ecken
            oben links: Bildschirmschoner ein
            oben rechts: -
            unten links: -
            unten rechts: -
- Dock & Menüleiste
    - Effekt beim Ablegen: Linear
    - CHECK Fenster hinter Programmsymbol im Dock ablegen 
    - UNCHECK Öffnen von Programmen animieren 
    - CHECK Dock automatisch ein und ausblenden 
    - CHECK Anzeige für geöffnete Programme einblenden 
    - UNCHECK Zuletzt verwendete Programme im Dock anzeigen 
    - Kontrollzentrum
        - CHECK WLAN in Menüleiste anzeigen 
        - UNCHECK Bluetooth in Menüleiste anzeigen 
        - UNCHECK AirDrop in Menüleiste anzeigen 
        - CHECK Fokus in Menüleiste WENN AKTIV anzeigen 
        - UNCHECK Tastaturhelligkeit in Menüleiste anzeigen 
        - CHECK Bildschirmsynchronisierung in Menüleiste WENN AKTIV anzeigen 
        - CHECK Display in Menüleiste WENN AKTIV anzeigen 
        - CHECK Ton in Menüleiste IMMER anzeigen 
        - UNCHECK Jetzt läuft in Menüleiste anzeigen 
        - UNCHECK Bedienungshilfen in Menüleiste anzeigen 
        - CHECK Batterie in Menüleiste anzeigen
        - UNCHECK Im Kontrollzentrum anzeigen
        - UNCHECK In Prozent anzeigen 
        - UNCHECK Schneller Benutzerwechsel in Menüleiste anzeigen
        - UNCHECK Im Kontrollzentrum anzeigen 
        - CHECK Uhr Wochentag anzeigen
        - CHECK Datum anzeigen 
        - UNCHECK Spotlight in Menüleiste anzeigen 
        - UNCHECK Siri in Menüleiste anzeigen 
        - UNCHECK Time Machine in Menüleiste anzeigen 
- Mission Control
    - UNCHECK Spaces automatisch anhand der letzten Verwendung ausrichten 
    - CHECK Beim Programmwechsel Space auswählen, der geöffnete Fenster des Programms enthält 
    - CHECK Fenster nach Programm gruppieren 
    - CHECK Monitore verwenden verschiedene Spaces 
- Siri
    - UNCHECK
- Mitteilungen
    - CHECK oder UNCHECK bzw. ANPASSEN nach Bedarf alle Apps links 
- Benutzer & Gruppen
    - UNCHECK Gastbenutzer 
- Erweiterungen
    - Menü Teilen
        - CHECK oder UNCHECK nach Bedarf alle Einträge 
- Sicherheit & Datenschutz
    - Allgemein: CHECK Passwort erforderlich SOFORT nach Beginn des Ruhezustands oder Bildschirmschoners 
    - FileVault: CHECK
- Tastatur
    - Tastatur
        - UNCHECK Tastaturhelligkeit bei schwacher Beleuchtung anpassen 
        - UNCHECK Ausschalten der Hintergrundbeleuchtung für die Tastatur nach 5 SEK Inaktivität 
        - WENN TOUCHBAR: Touchbar zeigt ERWEITERTEN CONTROL STRIP
    - Text
        - UNCHECK Automatische Korrektur 
        - UNCHECK Wörter automatisch groß schreiben 
        - UNCHECK Punkt mit doppeltem Leerzeichen hinzufügen 
        - UNCHECK WENN TOUCHBAR: Touch Bar Schreibvorschläge 
        - UNCHECK Typografische Interpunktion 
- Trackpad
    - Zeigen und Klicken
        - UNCHECK Nachschlagen & Datenerkennung 
        - CHECK Sekundärklick mit zwei Fingern klicken 
        - UNCHECK Klicken durch Tippen 
        - UNCHECK Kräftiger Klick und haptisches Feedback 
    - Scrollen und Zoomen
        - CHECK Scrollrichtung: Natürlich 
        - CHECK Ein oder Auszoomen 
        - UNCHECK Intelligentes Zoomen 
        - CHECK Drehen 
    - Weitere Gesten
        - UNCHECK Mit Streichen Seiten blättern 
        - CHECK Mit Streichen Vollbild-Apps wechseln 
        - CHECK Mitteilungszentrale 
        - CHECK Mission Control 
        - UNCHECK App Expose 
        - CHECK Launchpad 
        - UNCHECK Schreibtisch anzeigen 
- Displays
    - Nightshift
        - EIGENE von 6:00 bis 5:59 bei 75% WÄRMER
- Batterie
    - Batterie
        - Monitor ausschalten nach NIE
        - UNCHECK Bei Batteriebetrieb den Monitor leicht abdunkeln 
        - UNCHECK Video Streaming bei Batteriebetrieb 
        - CHECK Optimiertes Laden der Batterie 
        - CHECK Batteriestatus in der Menüleiste anzeigen 
        - UNCHECK Stromsparmodus 
    - Netzteil
        - Monitor ausschalten nach NIE
- Freigaben
    - Gerätename EINGEBEN
- Finder
    - Einstellungen
        - Allgemein
            - UNCHECK Festplatten
            - UNCHECK Externe Festplatten
            - UNCHECK CDs, DVDs und iPods
            - UNCHECK Verbundene Server
            - Neue Finder Fenster zeigen: Home Folder
        - Seitenleiste
            - Favoriten
                - UNCHECK Zuletzt benutzt
                - UNCHECK Airdrop
                - CHECK Programme
                - CHECK Schreibtisch
                - CHECK Dokumente
                - CHECK Downloads
                - CHECK Filme
                - CHECK Musik
                - CHECK Bilder
                - CHECK Home Folder
            - iCloud
                - UNCHECK iCloud
                - UNCHECK Geteilt
            - Orte
                - UNCHECK Mac
                - UNCHECK Festplatten
                - CHECK Externe Festplatten
                - CHECK CDs, DVDs und iOS-Geräte
                - UNCHECK iCloud Speicher
                - UNCHECK Bonjour-Computer
                - CHECK Verbundene Server
            - Tags
                - UNCHECK Benutzte Tags
        - Erweitert
            - CHECK Alle Dateinamensuffixe einblenden
            - CHECK Vor dem Ändern eines Suffixes nachfragen
            - CHECK Vor dem Entfernen von iCloud Drive nachfragen
            - CHECK Vor dem Entleeren des Papierkorbs nachfragen
    - Darstellung
        - CHECK Als Liste
        - CHECK Seitenleiste
        - UNCHECK Vorschau
        - CHECK Symbolleiste
        - UNCHECK Alle Tabs
        - UNCHECK Tableiste
        - CHECK Pfadleiste
        - CHECK Statusleiste
- Terminal
    - Schrift: SF Mono Regular 14
- Chrome
    - Entwicklertools
        - Network
            - CHECK disable Cache
