# fedora 44 kde

## rename and update pc
    $ sudo hostnamectl set-hostname --static tux
    $ sudo dnf update -y
    $ sudo dnf autoremove


## enable rpm fusion free and nonfree repo
    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    $ sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## system packages
    $ sudo dnf install steam firefox jetbrains-mono-fonts-all gnome-disks keepassxc vlc elisa
    $ sudo dnf install ncdu tmux btop htop nano git gcc ruby-devel libxml2-devel sqlite sqlite3 sqlite-devel bzip2 bzip2-devel libcurl libcurl-devel libpng libpng-devel libjpeg libjpeg-devel libicu libicu-devel oniguruma oniguruma-devel libtidy libtidy-devel libxslt libxslt-devel libzip libzip-devel php-cli composer java-latest-openjdk gcc-c++ autoconf automake bison libffi-devel libtool readline-devel php-mysqlnd libyaml-devel re2c gd gd-devel libpq libpq-devel patch

## if needed: google chrome
    $ sudo dnf install fedora-workstation-repositories
    $ sudo dnf config-manager setopt google-chrome.enabled=1
    $ sudo dnf install google-chrome-stable

## flatpak
    $ sudo dnf install flatpak
    $ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    $ flatpak install io.dbeaver.DBeaverCommunity
    $ flatpak install com.visualstudio.code

    $ flatpak install flathub com.discordapp.Discord
    $ flatpak install flathub com.spotify.Client
    $ flatpak install md.obsidian.Obsidian
    $ flatpak install com.redis.RedisInsight
    $ flatpak install com.mongodb.Compass
    $ flatpak install com.getpostman.Postman
    $ flatpak install ai.lmstudio.lm-studio
    $ flatpak install com.moonlight_stream.Moonlight

## vs code specific addition due to flatpak
    $ mkdir -p ~/.local/bin

    cat << 'EOF' > ~/.local/bin/code
    #!/bin/bash
    flatpak run com.visualstudio.code "$@"
    EOF

    $ chmod +x ~/.local/bin/code

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

### you may need to install some system libs for the next steps
    $ asdf plugin add nodejs
    $ asdf plugin add ruby
    $ asdf plugin add php
    $ asdf plugin add python
    $ asdf plugin add java
    
    $ asdf plugin list --urls
    $ asdf install nodejs latest
    $ asdf install ruby latest
    $ asdf install php latest
    $ asdf install python latest
    $ asdf list all java
    $ asdf latest java openjdk
    $ asdf install java openjdk-27
    
    $ asdf set nodejs latest
    $ asdf set ruby latest
    $ asdf set php latest
    $ asdf set python latest
    $ asdf set java openjdk-27
    
    $ asdf plugin update --all

### create a .tool-versions file in home path
    java openjdk-27
    python 3.14.7t
    php 8.5.10
    ruby 4.0.7
    nodejs 26.8.2

### test if it works: rails, npm libs, laravel
    $ gem install rails
    $ composer global require laravel/installer

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

### spin up a container
    $ docker run --name some-mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
    $ docker run --name some-postgres --restart=always -p 5432:5432 -e POSTGRES_PASSWORD=root -d postgres:latest
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest

## increase swap size to match ram
    $ sudo nano /usr/lib/systemd/zram-generator.conf
    # use a multiply of 1024, ideal your ram size

    [zram0]
    zram-size = 16384

    $ sudo systemctl daemon-reload
    $ sudo systemctl restart systemd-zram-setup@zram0.service

    # verify with the DISKSIZE column
    $ zramctl

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
    ALT + E = run-or-raise Code "flatpak run com.visualstudio.code"
    ALT + D = run-or-raise DBeaver "flatpak run io.dbeaver.DBeaverCommunity"
    ALT + C = run-or-raise Discord "flatpak run com.discordapp.Discord"
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

# tpm specific setup (for example thinkpads)

## bios settings

    - Security > Secure Boot: Enabled
    - Security > Security Chip: Enabled (TPM2)
    - Startup > UEFI/Legacy Boot: UEFI only
    - Config > Power > Sleep State: Windows 10 and Linux
    - Security > Virtualization: Enabled (incl. VT-d)
    - Config > Thunderbolt 4 > Security Level: User
    - Config > Network > Wake on LAN: Disabled

## firmware updates

    $ sudo nano /etc/fwupd/fwupd.conf

    [fwupd]
    # use `man 5 fwupd.conf` for documentation
    EnumerateAllDevices=false

    $ fwupdmgr refresh
    $ fwupdmgr update

## tpm2 setup

    $ sudo cat /etc/crypttab
    # note your UUID= part without UUID=
    $ sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=7 /dev/disk/by-uuid/<your_uuid>
    $ sudo nano /etc/crypttab
    # and add: ,tpm2-device=auto
    $ sudo dracut -f
    $ reboot

## if you need to change password encrypted ssd

    $ sudo cat /etc/crypttab
    # note your UUID= part without UUID=
    $ sudo cryptsetup luksChangeKey /dev/disk/by-uuid/<your_uuid>
    $ sudo cryptsetup luksOpen --test-passphrase /dev/disk/by-uuid/<your_uuid>

## register fingerprint in kde

    - Systemsettings > User > Register Fingerprint

## if you need external ssd encryption

    - use KDE Partition Tools GUI

## wwan module

    $ mmcli -L
    /org/freedesktop/ModemManager1/Modem/0 [quectel] EM120R_GL

    $ lspci -nn | grep -i modem
    08:00.0 Unassigned class [ff00]: Quectel Wireless Solutions Co., Ltd. EM120R-GL LTE Modem [1eac:1001]


    $ sudo mkdir -p /etc/ModemManager/fcc-unlock.d

    $ sudo ln -sfn /usr/share/ModemManager/fcc-unlock.available.d/1eac:1001 /etc/ModemManager/fcc-unlock.d/1eac:1001

    $ sudo systemctl restart ModemManager

    $ systemctl status ModemManager.service 

    $ sudo mmcli -m 0 -e
    error: couldn't enable the modem: 'GDBus.Error:org.freedesktop.ModemManager1.Error.Core.WrongState: Wrong state: modem in failed state'

    switch to physical sim: 1=sim 2=esim
    $ sudo mmcli -m 0 --set-primary-sim-slot=1

    $ sudo mmcli -m 0 -e

    Once it shows registered, you can open your Fedora KDE network settings, add a new Mobile Broadband connection, and enter the APN provided by your carrier to get online.

### setup apn

    For Telekom Deutschland (Deutsche Telekom), the standard modern APN for mobile internet is internet.v6.telekom.  Here are the exact settings you need to enter in Fedora:

    APN: internet.v6.telekom
    Username: telekom
    Password: tm

    use kde ui for that or nmcli

    $ nmcli connection add type gsm ifname wwan0 con-name "Telekom" apn "internet.v6.telekom" user "telekom" password "tm"
