# fedora 43 kde notes

    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    
    sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
    
    sudo dnf install google-chrome-stable vlc kdenlive  obs-studio ffmpeg steam
    flatpaks: discord, parsec
    other: alderon launcher
    
    sudo dnf swap ffmpeg-free ffmpeg --allowerasing
    sudo dnf swap obs-studio obs-studio --allowerasing
    
    sudo dnf remove kmahjongg kmines kpat
    
    sudo dnf autoremove

## disable swap
      sudo swapoff /dev/zram0
      sudo zramctl --reset /dev/zram0
      sudo touch /etc/systemd/zram-generator.conf
      sudo dnf remove zram-generator-defaults
      
      tuned-adm active
      tuned-adm list
      sudo tuned-adm profile throughput-performance
      sudo tuned-adm verify


## revert gpu
      sudo dnf swap mesa-va-drivers-freeworld mesa-va-drivers 
      sudo dnf swap mesa-vdpau-drivers-freeworld mesa-vdpau-drivers


## vscode
      sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
      echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
      
      dnf check-update
      sudo dnf install code



## dbeaver
      wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
      sudo dnf install ./dbeaver-ce-latest-stable.x86_64.rpm

## ALFRED ALTERNATIVE

      sudo dnf install kdotool

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

## my commands

      run-or-raise google-chrome google-chrome-stable
      run-or-raise dolphin dolphin
      run-or-raise konsole konsole
      run-or-raise Code code
      run-or-raise DBeaver dbeaver
      run-or-raise com.discordapp.Discord "flatpak run com.discordapp.Discord"

### use mac keyboard mode on mx keys mini
### befehl oder script:
      CMD + OPTION + W = run-or-raise google-chrome google-chrome-stable
      CMD + OPTION + F = run-or-raise dolphin dolphin
      CMD + OPTION + T = run-or-raise konsole konsole
      CMD + OPTION + E = run-or-raise Code code
      CMD + OPTION + D = run-or-raise DBeaver dbeaver
      CMD + OPTION + C = run-or-raise com.discordapp.Discord "flatpak run com.discordapp.Discord"
      
      Kurzbefehle -> Fensterverwaltung:
      CTRL + ALT + LEFT = Fenster am linken Bildschirmrand
      CTRL + ALT + RIGHT = Fenster am rechten Bildschirmrand
      CTRL + ALT + TOP = Fenster am oberen Bildschirmrand
      CTRL + ALT + BOTTOM = Fenster am unteren Bildschirmrand
      CTRL + ALT + ENTER = Fenster maximieren
      CMD + Q = Fenster schließen
      CTRL + ALT + C = Fenster zentrieren
      CMD + ^ = Zwischen Fenstern der aktuellen Anwendung wechseln
      ALT (META) + TAB = Zwischen Fenstern wechseln
      SHIFT + ALT (META) + TAB = Zwischen Fenstern wechseln (reverse)
      CMD + C = Kopieren
      CMD + V = Einfügen
      CMD + X = Ausschneiden






