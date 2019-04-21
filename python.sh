#!/bin/bash
is_darwin() {
    [ "$(uname)" == 'Darwin' ]
}

if is_darwin; then
    echo "install python"
    sudo port install \
        python_select python2_select python3_select \
        python27 python37 \
        py27-pip py37-pip \
        py27-virtualenv
    sudo port select python2 python27
    sudo port select python3 python37
    sudo port select python python37
    echo "=============================="
    echo "python2 version: $(python2 -V 2>&1)"
    echo "python3 version: $(python3 -V 2>&1)"
    echo "python  version: $(python -V 2>&1)"
else
    echo "TODO: $(uname)"
fi
