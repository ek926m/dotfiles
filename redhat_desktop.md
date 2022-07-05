## redhat (fedora) based setup

### ~/.bashrc
    alias ll='ls -lah --color=auto'
    alias cp='cp -v'
    alias mv='mv -v'
    alias rm='rm -v'
    git_branch() {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\n\[\e[00;32m\]\u\[\e[00;32m\]@\[\e[00;32m\]\h\[\e[00;38m\] \[\e[0;33m\]\w\[\e[00;37m\] \[\033[00;35m\]\$(git_branch):\n$ \[\e[0m\]"
    export PATH=~/.config/composer/vendor/bin:$PATH

### system packages
    $ sudo dnf update -y
    $ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    $ sudo dnf group install 'Development Tools' -y && sudo dnf install -y gcc-c++ nano autoconf automake bison libffi-devel libtool readline-devel sqlite-devel php-mysqlnd libyaml-devel python3 python3-pip exfat-utils fuse-exfat ncdu tmux htop neofetch
     
### optional gui packages
    $ sudo dnf install -y gnome-tweak-tool gnome-extensions-app dnfdragora obs-studio mediawriter gimp transmission youtube-dl firewall-config filezilla

    # spotify
    $ sudo dnf install -y lpf-spotify-client 
    $ lpf-gui
    $ sudo dnf remove -y lpf-spotify-client
       
### nodejs
    $ sudo dnf install -y nodejs
    $ sudo npm install -g eslint nodemon pm2 @vue/cli lodash

### laravel
    $ sudo dnf install -y composer
    $ composer global require laravel/installer

### docker
    $ sudo dnf install -y docker docker-compose
    $ sudo systemctl start docker && sudo systemctl enable docker
    $ sudo groupadd docker
    $ sudo usermod -aG docker ${USER}
            
### chrome
    $ cd && cd Downloads && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && sudo dnf install google-chrome-stable_current_x86_64.rpm -y

### robo mongo
    $ cd && cd Downloads && wget https://download.studio3t.com/studio-3t/linux/2022.3.0/studio-3t-linux-x64.tar.gz
    $ tar -xvzf studio-3t-linux-x64.tar.gz
    $ sh ./studio-3t-linux-x64.sh

### vs code
    $ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    $ sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    $ dnf check-update
    $ sudo dnf install code

### vscode keybindings.json
    // Place your key bindings in this file to override the defaults
    [
        {
            "key": "ctrl+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.toggleTerminal"
        },
        {
            "key": "shift+ctrl+[SEMICOLON]", //ö
            "command": "workbench.action.terminal.new"
        },
        {
            "key": "ctrl+1",
            "command": "workbench.action.openEditorAtIndex1"
        },
        {
            "key": "ctrl+2",
            "command": "workbench.action.openEditorAtIndex2"
        },
        {
            "key": "ctrl+3",
            "command": "workbench.action.openEditorAtIndex3"
        },
        {
            "key": "ctrl+4",
            "command": "workbench.action.openEditorAtIndex4"
        },
        {
            "key": "ctrl+5",
            "command": "workbench.action.openEditorAtIndex5"
        },
        {
            "key": "ctrl+6",
            "command": "workbench.action.openEditorAtIndex6"
        },
        {
            "key": "ctrl+7",
            "command": "workbench.action.openEditorAtIndex7"
        },
        {
            "key": "ctrl+8",
            "command": "workbench.action.openEditorAtIndex8"
        },
        {
            "key": "ctrl+9",
            "command": "workbench.action.openEditorAtIndex9"
        }
    ]

## nvidia

### find gpu model
    $ /sbin/lspci | grep -e VGA

### current renderer
    $ glxinfo | egrep "OpenGL vendor|OpenGL renderer"

### testing performance
#### intel
    $ vblank_mode=0 glxgears
#### nvidia
    $ __GL_SYNC_TO_VBLANK=0 glxgears

### installation
disable secureboot and make sure after installation to use x11 instead of wayland

    $ sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
    $ sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support

    $ sudo cp -p /usr/share/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf
    $ sudo nano /etc/X11/xorg.conf.d/nvidia.conf

add to file Option "PrimaryGPU" "yes" that it looks like:

    #This file is provided by xorg-x11-drv-nvidia
    #Do not edit

    Section "OutputClass"
            Identifier "nvidia"
            MatchDriver "nvidia-drm"
            Driver "nvidia"
            Option "AllowEmptyInitialConfiguration"
            Option "SLI" "Auto"
            Option "BaseMosaic" "on"
            Option "PrimaryGPU" "yes"
    EndSection

    Section "ServerLayout"
            Identifier "layout"
            Option "AllowNVIDIAGPUScreens"
    EndSection

### sources
    https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla
    https://docs.fedoraproject.org/en-US/quick-docs/how-to-set-nvidia-as-primary-gpu-on-optimus-based-laptops/