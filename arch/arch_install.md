
### BASIC INSTALL

    loadkeys de
    lsblk
    gdisk /dev/nvme0n1
    # delete all partitions
    d 

    # create efi partition
    n
    enter
    enter
    +500M
    ef00

    n
    enter
    enter
    enter
    8300

    w
    Y

    lsblk

    mkfs.fat -F 32 -n EFIBOOT /dev/nvme0n1p1
    mkfs.ext4 -L p_arch /dev/nvme0n1p2


    mount -L p_arch /mnt
    mkdir -p /mnt/boot
    mount -L EFIBOOT /mnt/boot

    timedatectl set-ntp true

    ip link

    iwctl
    device list
    station wlan0 scan
    station wlan0 get-networks
    station wlan0 connect Ultron

    ip addr

    ping -c3 www.archlinux.de

    pacstrap /mnt base base-devel linux linux-firmware

    genfstab -U /mnt >> /mnt/etc/fstab

    arch-chroot /mnt
    pacman -S nano sudo vim efibootmgr dosfstools gptfdisk netctl iw iwd dialog dhcp wpa_supplicant

    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
    hwclock --systohc

    nano /etc/locale.gen # uncomment de_DE.UTF-8 UTF-8
    nano /etc/vconsole.conf # KEYMAP=de

    locale-gen

    nano /etc/hostname #tux

    nano /etc/hosts
        127.0.0.1 localhost
        ::1 localhost
        127.0.1.1 tux.localdomain tux

    mkinitcpio -P

    bootctl install
    nano /boot/loader/entries/arch-uefi.conf
        title    Arch Linux
        linux    /vmlinuz-linux
        initrd   /initramfs-linux.img
        options  root=LABEL=p_arch rw

    nano /boot/loader/entries/arch-uefi-fallback.conf
        title    Arch Linux Fallback
        linux    /vmlinuz-linux
        initrd   /initramfs-linux-fallback.img
        options  root=LABEL=p_arch rw

    nano /boot/loader/entries/arch-uefi-lts.conf
        title    Arch Linux LTS
        linux    /vmlinuz-linux-lts
        initrd   /initramfs-linux.img
        options  root=LABEL=p_arch rw

    nano /boot/loader/loader.conf
        default   arch-uefi-lts.conf
        timeout   1

    passwd
    useradd -m user
    passwd user
    usermod -aG wheel,audio,video,optical,storage user
    visudo #uncomment %wheel ALL=(ALL)ALL (i INSERT MODE, esc, :wq)

    exit 
    umount -R /mnt
    reboot

### AFTER REBOOT

    sudo systemctl start iwd #if wlan
    sudo systemctl enable iwd

    sudo systemctl start dhcpd #if cable
    sudo systemctl enable dhcpd

    sudo systemctl enable sshd.service

    iwctl
    device list
    station wlan0 scan
    station wlan0 get-networks
    station wlan0 connect Ultron

    /etc/iwd/main.conf
        [General]
        EnableNetworkConfiguration=true
        [Network]
        NameResolvingService=resolvconf

    sudo systemctl enable systemd-resolved --now
    sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

    sudo pacman -S i3-wm i3blocks i3lock i3status dmenu xorg xorg-xinit xterm mesa xorg-server xorg-apps xorg-twm xorg.xclock lightdm lightdm-gtk-greeter xorg-xrandr arandr lightdm-gtk-greeter-settings alsa-utils volumeicon linux-lts ttf-droid openssh

    sudo nano /etc/pacman.conf
    # remove comments from color totaldownload 
    sudo pacman -Syy

    sudo systemctl enable lightdm.service

    sudo pacman -S networkmanager network-manager-applet acpi acpilight
    sudo systemctl enable NetworkManager

    sudo systemctl disable iwd

    ntfs-3g

    cp /etc/i3status.conf ~/.config/i3status/config

    nano ~/.Xresources
        Xft.dpi: 120

    sudo nano /etc/systemd/logind.conf
        HandleLidSwitch=ignore



    $ sudo pacman -S firefox nano tmux gcc cmake python python-pip git ffmpeg php neofetch cowsay fortune-mod nodejs composer docker docker-compose polkit-gnome

    $ sudo pacman -S gimp vlc obs-studio remmina libreoffice-still code discord chromium

    $ sudo pacman -S ntp
    $ sudo timedatectl set-ntp true

    #bindsym $mod+f exec terminal -e ranger
    bindsym $mod+w exec firefox
    bindsym $mod+e exec mousepad
    bindsym $mod+f exec nemo


    sudo localectl set-locale LANG=de_DE.UTF-8
    sudo localectl set-locale LANGUAGE=de_DE
    sudo localectl set-locale LC_TIME=de_DE.UTF-8
    sudo localectl set-locale LC_MONETARY=de_DE.UTF-8
    sudo localectl set-locale  LC_NUMERIC=de_DE.UTF-8
    sudo localectl set-locale LC_CTYPE=de_DE.UTF-8
    sudo localectl set-locale LC_MESSAGES=de_DE.UTF-8
    sudo localectl set-locale LC_PAPER=de_DE.UTF-8
    sudo localectl set-locale LC_MEASUREMENT=de_DE.UTF-8
    sudo localectl set-locale  LC_NAME=de_DE.UTF-8
    sudo localectl set-locale  LC_ADDRESS=de_DE.UTF-8
    sudo localectl set-locale  LC_TELEPHONE=de_DE.UTF-8
    sudo localectl set-locale  LC_IDENTIFICATION=de_DE.UTF-8

    sudo locale-gen


    git clone https://aur.archlinux.org/pamac-aur.git
    cd pamac-aur
    makepkg -si
    sudo pamac-manager
    # install i3-scrot
    (if auth fails /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1)