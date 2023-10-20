## mac based setup (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ xcode-select –-install
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
    

### import terminal theme
    $ wget https://raw.githubusercontent.com/ek926m/dotfiles/main/gruvbox.terminal
    
    $ wget https://raw.githubusercontent.com/ek926m/dotfiles/main/gruvbox.jpg
    or
    $ wget https://raw.githubusercontent.com/ek926m/dotfiles/main/000000.jpg
 
#### install and setup tooling
##### php xdebug
    $ arch -x86_64 sudo pecl install xdebug
##### add at top (/usr/local/Homebrew/etc/php/8.0/php.ini)
    zend_extension=xdebug.so
    xdebug.idekey=PHPSTORM
    xdebug.mode=debug
    xdebug.client_host=127.0.0.1
    xdebug.client_port=9003
    xdebug.start_with_request=yes
    xdebug.discover_client_host = 1
##### phpstorm
    - Run/Debug Configurations
        - set IDE Key (PHPSTORM)
        - Host: 127.0.0.1
        - Port: 8000
        - Debugger: Xdebug
    - CLI Interpreters:
        - Check if Debugger is: Xdebug 3.x.x
    - Additional:
        - Debugger extension: /usr/local/Homebrew/lib/php/pecl/20200930/xdebug.so
##### phpstorm fix
    # https://laracasts.com/series/how-to-be-awesome-in-phpstorm/episodes/15
    $ composer require --dev barryvdh/laravel-ide-helper
    $ php artisan ide-helper:generate
    $ php artisan ide-helper:models
    $ php artisan ide-helper:meta
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
    
#### encrypt and zip a file
    $ zip -er project.zip ./folder_to_zip/



## homebrew (arm only)

### edit ~/.bash_profile and add
    export PATH=/opt/homebrew/bin:$PATH
    
    export PATH="/usr/local/homebrew/opt/php/bin:$PATH"
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="/usr/local/homebrew/opt/openjdk/bin:$PATH"
    export JAVA_HOME="/usr/local/homebrew/opt/openjdk"
    
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(rbenv init -)"
    eval "$(nodenv init -)"
    eval "$(pyenv init -)"

### packages
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




## homebrew (old, everything supported way)

### edit ~/.bash_profile and add
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

### remove old installations
    brew remove --force $(brew list --formula)
    brew remove --cask --force $(brew list)

### fix permissions for x86_64 homebrew install
    $ sudo chown -R $(whoami) $(brew --prefix)/* 
    $ sudo chown -R $(whoami) /usr/local/Homebrew/completions/zsh/_brew


### intel homebrew
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    arch -x86_64 /usr/local/homebrew/bin/brew
    # alias intelbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

### arm homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /opt/homebrew/bin/brew
    # alias armbrew='/opt/homebrew/bin/brew'
  
### packages
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

## system settings (pre ventura)
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
    - Kurzbefehle
        - Mission Control: (ändern indem man auf den shortcut selber klickt)
            - Zu Schreibtisch 1 wechseln: alt+0
            - Zu Schreibtisch 2 wechseln: alt+1
            - Zu Schreibtisch 3 wechseln: alt+2
            - Zu Schreibtisch 4 wechseln: alt+3
            - Zu Schreibtisch 5 wechseln: alt+4
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
    - Schrift: SF Mono Regular 12
- Chrome
    - Entwicklertools
        - Network
            - CHECK disable Cache
