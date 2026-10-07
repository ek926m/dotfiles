### .bashrc on linux / .bash_profile on mac
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
    . ~/.asdf/plugins/java/set-java-home.bash
    export PATH="$(asdf where php)/.composer/vendor/bin:$PATH"

### you may need to install some system libs for the next steps
    $ asdf plugin add nodejs
    $ asdf plugin add ruby
    $ asdf plugin add php
    $ asdf plugin add python
    $ asdf plugin add java
    $ asdf plugin add dotnet
    
    $ asdf plugin list --urls
    $ asdf install nodejs latest
    $ asdf install ruby latest
    $ asdf install php latest
    $ asdf install python latest
    $ asdf install dotnet latest
    $ asdf list all java
    $ asdf latest java openjdk
    $ asdf install java openjdk-27
    
    $ asdf set nodejs latest
    $ asdf set ruby latest
    $ asdf set php latest
    $ asdf set python latest
    $ asdf set dotnet latest
    $ asdf set java openjdk-27
    
    $ asdf plugin update --all

### create a .tool-versions file in home path
    java openjdk-27
    python 3.14.7t
    php 8.5.10
    ruby 4.0.7
    nodejs 26.8.2
    dotnet 10.0.400

### rails, laravel
    $ gem install rails
    $ composer global require laravel/installer
