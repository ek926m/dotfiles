# fedora 44 kde

## rename and update pc
    $ sudo hostnamectl set-hostname --static tux
    $ sudo dnf update -y
    $ sudo dnf autoremove

## enable rpm fusion free and nonfree repo
    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    $ sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## system packages
    $ sudo dnf install steam jetbrains-mono-fonts-all firefox keepassxc vlc elisa kate
    $ sudo dnf install ncdu tmux btop htop nano git gcc ruby-devel libxml2-devel sqlite sqlite3 sqlite-devel bzip2 bzip2-devel libcurl libcurl-devel libpng libpng-devel libjpeg libjpeg-devel libicu libicu-devel oniguruma oniguruma-devel libtidy libtidy-devel libxslt libxslt-devel libzip libzip-devel php-cli composer java-latest-openjdk gcc-c++ autoconf automake bison libffi-devel libtool readline-devel php-mysqlnd libyaml-devel re2c gd gd-devel libpq libpq-devel patch

### dbeaver
    $ cd && cd Downloads && wget https://dbeaver.io/files/dbeaver-ce-latest-linux-x86_64.rpm && sudo dnf install ./dbeaver-ce-latest-linux-x86_64.rpm

### vscodium
    $ cd && cd Downloads && wget https://github.com/VSCodium/vscodium/releases/download/1.135.06055/codium-1.135.06055-el8.x86_64.rpm && sudo dnf install ./codium-1.135.06055-el8.x86_64.rpm

## edit .bashrc
    export CLICOLOR=1
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias grep='grep --color=auto'

    git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"

## git
    $ ssh-keygen -t rsa -b 4096
    $ cat ~/.ssh/id_rsa.pub
    $ ssh -T git@github.com

### git config
    $ git config --global color.ui true
    $ git config --global user.email "your@mail.com"
    $ git config --global user.name "Your Name"

## asdf installation
    # https://asdf-vm.com/guide/getting-started.html
    # https://github.com/asdf-vm/asdf/releases
    $ cd && cd Downloads && wget https://github.com/asdf-vm/asdf/releases/download/v0.20.0/asdf-v0.20.0-linux-amd64.tar.gz && tar -xvzf asdf-v0.20.0-linux-amd64.tar.gz && sudo mv asdf /usr/bin/asdf

### add to .bashrc
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
    . ~/.asdf/plugins/java/set-java-home.bash
    export PATH="$(asdf where php)/.composer/vendor/bin:$PATH"

## docker installation

### remove conflicting packages
    $ sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine docker-cli docker-compose

### docker community edition installation
    $ sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
    $ sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    $ sudo systemctl enable --now docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker $USER
    # restart for docker commands to work without sudo

## mac alfred alternative (for KDE)
    $ sudo dnf install kdotool

### Create a file named run-or-raise in your ~/.local/bin/ folder (create the folder if it doesn't exist):
    $ mkdir -p ~/.local/bin
    $ nano ~/.local/bin/run-or-raise

### run-or-raise:
    #!/bin/bash
    ## Usage: run-or-raise <window-class> <command-to-launch>
    
    CLASS=$1
    CMD=$2
    
    ## Search for the window by class name
    PID=$(kdotool search --class "$CLASS" | head -n 1)
    
    if [ -n "$PID" ]; then
      # If found, activate (focus) it
      kdotool windowactivate "$PID"
    else
      # If not found, launch it
      # detach the process so it doesn't close with the script
      nohup $CMD >/dev/null 2>&1 &
    fi

### make it runnable and test it
    $ chmod +x ~/.local/bin/run-or-raise
    $ run-or-raise firefox firefox

### usage to find names:
    $ kdotool search --class "steam"
    {ddff72a0-f13f-4eb5-b404-4f77947abda2}

    $ kdotool getwindowclassname {ddff72a0-f13f-4eb5-b404-4f77947abda2}
    steam

### key commands

#### make ALTGR function like ALT
    - Systemeinstellungen > Tastatur > Tastenzuordnungen > Taste zum Wechsel in die dritte Tastaturebene > Rechte Alt-Taste wählt niemals die dritte Tastaturebene: check!
#### make RIGHT CTRL function like ALTGR
    - Systemeinstellungen > Tastatur > Tastenzuordnungen > Taste zum Wechsel in die dritte Tastaturebene > Rechte Strg-Taste: check!

#### setup key commands
    - Systemeinstellungen > Tastatur > Kurzbfehle > Neu hinzufügen > Befehl oder Script...

#### commands
    ALT + V = run-or-raise okular okular
    ALT + T = run-or-raise konsole konsole
    ALT + F = run-or-raise dolphin dolphin
    ALT + X = run-or-raise keepassxc keepassxc
    ALT + W = run-or-raise firefox firefox
    ALT + E = run-or-raise codium codium
    ALT + D = run-or-raise dbeaver-ce dbeaver-ce
    ALT + S = run-or-raise elisa elisa

### window management
    ALT + TAB 
        = Walk Through Windows
        = Zwischen Fenstern wechseln
    SHIFT + ALT + TAB
        = Walk Through Windows (Reverse)
        = Zwischen Fenstern wechseln (Gegenrichtung)
    META + ARROW_LEFT
        = Quick Tile Window to the Left
        = Fenster am linken Bildschirmrand anordnen
    META + ARROW_RIGHT
        = Quick Tile Window to the Right
        = Fenster am rechten Bildschirmrand anordnen
    META + ARROW_TOP
        = Quick Tile Window to the Top
        = Fenster am oberen Bildschirmrand anordnen
    META + ARROW_BOTTOM
        = Quick Tile Window to the Bottom
        = Fenster am unteren Bildschirmrand anordnen
    META + ENTER 
        = Maximize Window
        = Fenster maximieren
    META + Q 
        = Close Window
        = Fenster schließen
    META + C 
        = Move Window to the Center
        = Fenster zentrieren
    ALT + ^ 
        = Walk Through Windows of Current Application
        = Zwischen Fenstern der aktuellen Anwendung wechseln
    SHIFT + ALT + ^ 
        = Walk Through Windows of Current Application (Reverse)
        = Zwischen Fenstern der aktuellen Anwendung wechseln (Gegenrichtung)
    STRG + UP
        = Fenster aller Arbeitsflächen anzeigen

## system settings:
    - Animationen: Globale Animationsgeschwindigkeit: Sofort
    - Maus: Zeigerbeschleunigung deaktivieren
    - Energieverwaltung: Alles auf niemals
    - Bildschirmsperre:
        = Bildschirm automatisch sperren: Niemals
        = Sofort
    - Anzeige & Bildschirm: 
        = Nachtlicht, immer an, 3.000K
        = Bildschirmränder: alle deaktivieren
    - Anwendungsumschalter: 
        = uncheck: Ausgewähltes Fenster anzeigen
        = Große Symbole
        = 0ms

## firewall
    remember to block everything in the native firewall app

## if you need to change password encrypted ssd
    $ sudo cat /etc/crypttab
    # note your UUID= part without UUID=
    $ sudo cryptsetup luksChangeKey /dev/disk/by-uuid/<your_uuid>
    $ sudo cryptsetup luksOpen --test-passphrase /dev/disk/by-uuid/<your_uuid>
