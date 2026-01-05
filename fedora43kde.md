# fedora 43 kde (wayland)

    $ sudo dnf update
    $ sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

    # enable flatpak in software center ui (button)
    # enable google-chrome in software center ui (checkbox)
    $ sudo dnf install google-chrome-stable vlc kdenlive obs-studio ffmpeg steam gnome-disk-utility
    # install flatpaks with software center ui: discord, parsec
    $ sudo dnf -y copr enable faugus/faugus-launcher
    $ sudo dnf -y install faugus-launcher
    
    $ sudo dnf remove kmahjongg kmines kpat
    $ sudo dnf autoremove

## optional: disable swap
    $ sudo swapoff /dev/zram0
    $ sudo zramctl --reset /dev/zram0
    $ sudo touch /etc/systemd/zram-generator.conf
    $ sudo dnf remove zram-generator-defaults

## optional: tweak energy profile
    $ tuned-adm active
    $ tuned-adm list
    $ sudo tuned-adm profile throughput-performance
    $ sudo tuned-adm verify

## vscode
    $ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    $ echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    $ dnf check-update
    $ sudo dnf install code

## dbeaver
    $ wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
    $ sudo dnf install ./dbeaver-ce-latest-stable.x86_64.rpm

## ALFRED ALTERNATIVE
    
    $ sudo dnf install kdotool

Create a file named run-or-raise in your ~/.local/bin/ folder (create the folder if it doesn't exist):

    mkdir -p ~/.local/bin
    nano ~/.local/bin/run-or-raise

this is the files content:

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

    chmod +x ~/.local/bin/run-or-raise
    
    run-or-raise firefox firefox
    
    kdotool search --class "name"

## my commands (keyboard -> shortcuts)

### add command or script
    META + W = run-or-raise google-chrome google-chrome-stable
    META + F = run-or-raise dolphin dolphin
    META + T = run-or-raise konsole konsole
    META + E = run-or-raise Code code
    META + D = run-or-raise DBeaver dbeaver
    META + C = run-or-raise com.discordapp.Discord "flatpak run com.discordapp.Discord"    

### window management
    ALT + ^ = Walk Through Windows of Current Application
    SHIFT + ALT + ^ = Walk Through Windows of Current Application (Reverse)
    ALT + TAB = Walk Through Windows
    SHIFT + ALT + TAB = Walk Through Windows (Reverse)
    META + ARROW_LEFT = Quick Tile Window to the Left
    META + ARROW_RIGHT = Quick Tile Window to the Right
    META + ARROW_TOP =  Quick Tile Window to the Top
    META + ARROW_BOTTOM = Quick Tile Window to the Bottom
    META + ENTER = Maximize Window
    META + Q = Close Window
    META + ??? = Move Window to the Center

# custom notices    
    ek@fedora:~$ setxkbmap de nodeadkeys
    WARNING: Running setxkbmap against an Xwayland server
    ek@fedora:~$ setxkbmap -v
    
    set 105 generic instead of 104 in keyboard settings
    set german no dead keys in keyboard settings
    
    nano keyboard_layout.sh
    
    #!/bin/bash
    setxkbmap de nodeadkeys
    
    go to the kde autostart settings and use this script
    and make it runnable
    
    verify it:
    
    ek@fedora:~$ setxkbmap -v
    WARNING: Running setxkbmap against an Xwayland server
    Trying to build keymap using the following components:
    keycodes:   evdev+aliases(qwertz)
    types:      complete
    compat:     complete
    symbols:    pc+de(nodeadkeys)+inet(evdev)
    geometry:   pc(pc105)
    
    
    wow midnight beta:
    
    add following flag in settings:
    -d3d11
    
    then it will launch and not crash



