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
