#!/bin/bash
is_darwin() {
    [ "$(uname)" == 'Darwin' ]
}

if is_darwin; then
    echo "install ruby"
    sudo port install rbenv ruby-build
    eval "$(rbenv init -)"
    if [ ! -d ~/.rbenv/plugins/rbenv-communal-gems ]; then
        mkdir -p ~/.rbenv/plugins
        git clone git://github.com/tpope/rbenv-communal-gems.git \
            ~/.rbenv/plugins/rbenv-communal-gems
    fi
    rbenv communize --all
    echo "=============================="
    echo "rbenv version: $(rbenv -v)"
    echo "=============================="
    rbenv install 2.6.1
    rbenv global 2.6.1
    echo "=============================="
    echo "ruby version: $(ruby -v)"
else
    echo "TODO: $(uname)"
fi
