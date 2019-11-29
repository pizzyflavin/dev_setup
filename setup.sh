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
    brew_check_packages () {
        echo "Checking "$#" packages..."
        for package in $@
        do
            brew list "$package" || brew install "$package"
        done
    }

    # Check if a cask app is installed, if not install it.
    brew_check_caskapps () {
        echo "Checking "$#" cask apps..."
        for app in $@
        do
            brew cask list "$app" || brew cask install "$app"
        done
    }

    # Install Homebrew Package Manager
    if ! command -v brew 1> /dev/null 2>&1 ; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/\
                   install/master/install)"

        # Make sure install was successful
        brew doctor
    fi

    # INSTALL OPTIONS
    WITH_OVERRIDE_SYSTEM_VIM="-- --with-override-system-vim"

    # Install with brew cask: google-chrome, iterm2
    CASK_APPS="google-chrome iterm2"
    brew_check_caskapp "$CASK_APPS"
    #brew cask list "$CASK_APPS" || brew cask install "$CASK_APPS"

    # Install necessities:
    ESSENTIAL_PACKAGES="git bash bash-completion"
    brew_check_packages "$ESSENTIAL_PACKAGES"

    # Install ruby, perl, and python
    SCRIPTING_LANGUAGES="ruby perl python python3"
    brew_check_packages "$SCRIPTING_LANGUAGES"

    # Install GCC
    # Note: gcc is NOT linked here by brew. you must link or use 'gcc-6'
    GCC_PACKAGES="gcc gdb make cmake automake autoconf"
    brew_check_packages "$GCC_PACKAGES"

    # Install GNU versions of general tools with Homebrew
    # NOTE: Add PATH=/usr/local/opt/<package>/libexec/gnubin:$PATH
    UTILS_PACKAGES="coreutils binutils diffutils findutils \
                    gnu-indent gnu-sed gnu-tar gnu-which \
                    gawk gzip screen watch wget ed grep wdiff tree"
    brew_check_packages "$UTILS_PACKAGES"

    # Install MacVim with system override option
    brew list macvim || brew install macvim "$WITH_OVERRIDE_SYSTEM_VIM"

    # Install other cool tools
    MISC_TOOLS="graphviz doxygen"
    brew_check_packages "$MISC_TOOLS"

    # Install with PIP: numpy, scipy, matplotlib, ipython, jupyter, pySerial,
    # nose, PEP8,
    pip install numpy scipy matplotlib
    pip install ipython[all] jupyter
    pip install pyserial nose

    # TODO: Set up dot files from github repo


    ;;
  "Linux") # Linux
    ;;
esac

