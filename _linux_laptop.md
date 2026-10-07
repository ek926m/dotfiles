# specific setup (for example thinkpads)

## increase swap size to match ram
    $ sudo nano /usr/lib/systemd/zram-generator.conf
    # 8192 / 16384 / 32768 / 65536 / 131072

    [zram0]
    zram-size = 16384

    $ sudo systemctl daemon-reload
    $ sudo systemctl restart systemd-zram-setup@zram0.service

    # verify with the DISKSIZE column
    $ zramctl


## bios settings
    - Security > Secure Boot: Enabled
    - Security > Security Chip: Enabled (TPM2)
    - Startup > UEFI/Legacy Boot: UEFI only
    - Config > Power > Sleep State: Linux S3
    - Security > Virtualization: Enabled (incl. VT-d)
    - Config > Thunderbolt 4 > Security Level: User
    - Config > Network > Wake on LAN: Disabled

## verify sleep state in linux
    $ cat /sys/power/mem_sleep
    s2idle [deep]

## firmware updates
    $ sudo nano /etc/fwupd/fwupd.conf

    [fwupd]
    # use `man 5 fwupd.conf` for documentation
    EnumerateAllDevices=false

    $ fwupdmgr refresh
    $ fwupdmgr update
    $ fwupdmgr get-upgrades

### if fwupd makes discover error out, remove cache
    $ sudo systemctl stop fwupd
    $ sudo rm -rf /var/cache/fwupd/*
    $ sudo systemctl start fwupd

### if it still does not work, remove integration in discover
    $ sudo dnf remove plasma-discover-fwupd

## tpm2 setup
    $ sudo cat /etc/crypttab
    # note your UUID= part without UUID=
    $ sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=7 /dev/disk/by-uuid/<your_uuid>
    $ sudo nano /etc/crypttab
    # and add: ,tpm2-device=auto
    $ sudo dracut -f
    $ reboot

## check battery health
    $ upower -i $(upower -e | grep 'BAT')
