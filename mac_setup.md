## mac based setup (apple silicon)

### system
    $ sudo softwareupdate --install-rosetta --agree-to-license
    $ xcode-select –-install
    $ sudo scutil --set HostName mac
    $ defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
    
### from zsh to bash
    $ chsh -s /bin/bash
    $ cd && touch .hushlogin

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
    
