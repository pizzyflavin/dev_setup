#!/usr/bin/env bash

#  Get name of OS
OS="$(uname -s)"


case "$OS" in
  "Darwin") # Mac OS/OSX
    #==========================================================================
    #
    #                         Operating System: macOS 
    #
    #==========================================================================
    
    # Install Homebrew Package Manager (and Cask)
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/\
                        install/master/install)"
    # Make sure that was successful
    brew doctor

    # Tap some stuff
    brew tap caskroom/cask # for GUI applications
    brew tap homebrew/dupes # for GNU tools
    brew tap homebrew/completions
    brew tap homebrew/versions

    brew update

    # Install with brew cask: google-chrome, iterm2
    brew cask install google-chrome iterm2

    # Install necessities:
    brew install git
    brew install bash bash-completion

    # Install ruby, perl, and python
    brew install ruby perl
    brew install python python3
    
    # Install GCC
    # gcc is NOT linked here by brew. you must link or use 'gcc-6'
    brew install gcc
    brew install gdb 
    brew install make --with-default-names
    brew install automake autoconf

    # Install GNU versions of general tools with Homebrew (with default names)
    brew install coreutils binutils diffutils findutils --with-default-names 
    brew install gnu-indent --with-default-names
    brew install gnu-sed --with-default-names
    brew install gnu-tar  --with-default-names
    brew install gnu-which --with-default-names
    brew install ed --with-default-names
    brew install grep --with-default-names
    brew install wdiff --with-gettext
    brew install gawk gzip screen watch wget 
        

    
    # Install other cool tools
    brew install graphviz --with-app doxygen --with=graphviz
    brew install tree 

    # Install with PIP: numpy, scipy, matplotlib, ipython, jupyter, pySerial,
    # nose, PEP8, 
    pip install numpy scipy matplotlib 
    pip install ipython[all] jupyter 
    pip install pyserial nose

    # Set up dot files from github repo
    ;;
  "Linux") # Linux
    ;;
esac

