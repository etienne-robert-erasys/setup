# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

PATH=/usr/local/bin:$PATH
PATH="/usr/local/opt/python/libexec/bin:$PATH"

if [ "$(uname)" == "Darwin" ] ; then
  # MAMP mysql Path
  if [ -d "$HOME/MAMP/mysql/bin" ] ; then
    PATH="$PATH:$HOME/MAMP/mysql/bin"
  fi
  # Visual Studio Code Path
  if [ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ] ; then
    PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Searches for brew libs/binaries before system ones
if [ -d "$HOME/bin" ] ; then
    PATH=~/.brew/bin:$PATH
fi

# Enables Rust
if [ -d "$HOME/.cargo/bin" ] ; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Sets the terminal emulator to be launched by i3. Non-standard.
export TERMINAL=st

export EDITOR=vim
export BROWSER=firefox
export MAIL=etienne.robert@erasys.de

# Activate touch support in firefox
export MOZ_USE_XINPUT2=1

# Starts i3 on login
if [ "$(tty)" = "/dev/tty1" ]; then
  pgrep -x i3 || exec startx
fi

# opam configuration
test -r /home/etienne/.opam/opam-init/init.sh && . /home/etienne/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
