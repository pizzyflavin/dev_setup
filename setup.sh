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

    # Functions
    # Check if a package is installed, if not install it.
    brew_check_package () {
        brew list $1 || brew install $1
    }

    # Check if a cask app is installed, if not install it.
    brew_check_caskapp () {
        brew cask list $1 || brew cask install $1
    }
    
    # Install Homebrew Package Manager
    if ! command -v brew 1> /dev/null 2>&1 ; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/\
                   install/master/install)"

        # Make sure install was successful
        brew doctor
    fi

    # Install with brew cask: google-chrome, iterm2
    CASK_APPS="google-chrome iterm2"
    brew_check_caskapp "$CASK_APPS"
    #brew cask list "$CASK_APPS" || brew cask install "$CASK_APPS"

    # Install necessities:
    ESSENTIAL_PACKAGES="git bash bash-completion"
    brew_check_package "$ESSENTIAL_PACKAGES"

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
        
    # Install MacVim with system override option
    brew install macvim --with-override-system-vim
    
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

