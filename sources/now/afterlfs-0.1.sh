# Copyright 2009-2016 Victor Boyko, Tashkent, Uzbekistan <bvoid(at)yandex.ru>
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#  THIS SOFTWARE FOR NON COMMERCIAL USING ONLY.

time (

cat > /etc/profile << "EOF"
# Begin /etc/profile
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# modifications by Dagmar d\'Surreal <rivyqntzne@pbzpnfg.arg>

# System wide environment variables and startup programs.

# System wide aliases and functions should go in /etc/bashrc.  Personal
# environment variables and startup programs should go into
# ~/.bash_profile.  Personal aliases and functions should go into
# ~/.bashrc.

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
#pathremove () {
#  local IFS=':'
#  local NEWPATH
#  local DIR
#  local PATHVARIABLE=${2:-PATH}
#  for DIR in ${!PATHVARIABLE} ; do
#    if [ "$DIR" != "$1" ] ; then
#      NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
#    fi
#  done
#  export $PATHVARIABLE="$NEWPATH"
#}
#pathprepend () {
#  pathremove $1 $2
#  local PATHVARIABLE=${2:-PATH}
#  export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
#}
#pathappend () {
#  pathremove $1 $2
#  local PATHVARIABLE=${2:-PATH}
#  export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
#}
#export -f pathremove pathprepend pathappend

# Set the initial path
PATH=/bin:/usr/bin

if [ $EUID -eq 0 ] ; then
  PATH=${PATH}:/sbin:/usr/sbin
  #pathappend /sbin:/usr/sbin
  #unset HISTFILE
fi

# Setup some environment variables.
export VISUAL="vim"
export EDITOR="vim"
export PAGER="less"
export HISTSIZE=50000
export HISTIGNORE="&:[bf]g:exit"

# Set some defaults for graphical systems
export XDG_DATA_DIRS=/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg/

# FLAGGGggZzzz
### echo "int main() { return 0; }" | gcc -march=native -v -Q -x c -
#vendor_id       : AuthenticAMD
#cpu family      : 16
#model           : 6
#model name      : AMD Athlon(tm) II Neo K325 Dual-Core Processor
#cache size      : 1024 KB
#cpuid level     : 5
#wp              : yes
#flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx
#fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc nonstop_tsc
#extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a 3dnowprefetch
#osvw ibs skinit wdt nodeid_msr hw_pstate npt lbrv svm_lock nrip_save
###
#export CFLAGS="-O2 -march=amdfam10 -mtune=amdfam10 -mcx16 -msahf -mpopcnt -mabm --param l1-cache-line-
#size=64 --param l2-cache-size=1024 -mmmx -mno-sse4 -msse -msse2 -msse3 -msse4a"
export MAKEFLAGS="-j2"
export CFLAGS="-O2 -march=pentium4 -mtune=pentium4 -pipe -fomit-frame-pointer"
export CXXFLAGS="${CFLAGS}"
#export LDFLAGS="-Wl,-O1 -Wl,--as-needed"

# Setup a red prompt for root and a green one for users.
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [[ $EUID == 0 ]] ; then
  PS1="$RED\u@\h($NORMAL\j$RED)\W # $NORMAL"
else
  PS1="$GREEN\u@\h($NORMAL\j$GREEN)\W # $NORMAL"
fi

for script in /etc/profile.d/*.sh ; do
  if [ -x $script ] ; then
    . $script
  fi
done

export PATH
unset script RED GREEN NORMAL

# End /etc/profile
EOF

install --directory --mode=0755 --owner=root --group=root /etc/profile.d

cat > /etc/profile.d/dircolors.sh << "EOF"
# Setup for /bin/ls and /bin/grep to support color, the alias is in /etc/bashrc.
if [ -f "/etc/dircolors" ] ; then
  eval $(dircolors -b /etc/dircolors)

  if [ -f "$HOME/.dircolors" ] ; then
    eval $(dircolors -b $HOME/.dircolors)
  fi
fi
alias ls='ls --color=auto'
alias grep='grep --color=auto'
EOF

cat > /etc/profile.d/extrapaths.sh << "EOF"
if [ -d /usr/local/lib/pkgconfig ] ; then
  PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig
  #pathappend /usr/local/lib/pkgconfig PKG_CONFIG_PATH
fi
if [ -d /usr/local/bin ]; then
  PATH=/usr/local/bin:${PATH}
  #pathprepend /usr/local/bin
fi
if [ -d /usr/local/sbin -a $EUID -eq 0 ]; then
  PATH=/usr/local/sbin:${PATH}
  #pathprepend /usr/local/sbin
fi
if [ -d ~/bin ]; then
  PATH=~/bin:${PATH}
fi
EOF

cat > /etc/profile.d/readline.sh << "EOF"
# Setup the INPUTRC environment variable.
if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ] ; then
  INPUTRC=/etc/inputrc
fi
export INPUTRC
EOF

cat > /etc/profile.d/umask.sh << "EOF"
# By default, the umask should be set.
if [ "$(id -gn)" = "$(id -un)" -a $EUID -gt 99 ] ; then
  umask 002
else
  umask 022
fi
EOF

cat > /etc/profile.d/i18n.sh << "EOF"
# Set up i18n variables
export LANG=en_US.utf8
EOF

chmod -v +x /etc/profile.d/*

cat > /etc/bashrc << "EOF"
# Begin /etc/bashrc
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# updated by Bruce Dubbs <bdubbs@linuxfromscratch.org>

# System wide aliases and functions.

# System wide environment variables and startup programs should go into
# /etc/profile.  Personal environment variables and startup programs
# should go into ~/.bash_profile.  Personal aliases and functions should
# go into ~/.bashrc

# Provides colored /bin/ls and /bin/grep commands.  Used in conjunction
# with code in /etc/profile.

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Provides prompt for non-login shells, specifically shells started
# in the X environment. Review the LFS archive thread titled
# PS1 Environment Variable for a great \case study behind this script
# addendum

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [[ $EUID == 0 ]] ; then
  PS1="$RED\u@\h($NORMAL\j$RED)\W # $NORMAL"
else
  PS1="$GREEN\u@\h($NORMAL\j$GREEN)\W # $NORMAL"
fi

unset RED GREEN NORMAL

# End /etc/bashrc
EOF

mkdir -pv /etc/skel

cat > /etc/skel/.bash_profile << "EOF"
# Begin ~/.bash_profile
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# updated by Bruce Dubbs <bdubbs@linuxfromscratch.org>

# Personal environment variables and startup programs.

# Personal aliases and functions should go in ~/.bashrc.  System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.

if [ -f "$HOME/.bashrc" ] ; then
  source $HOME/.bashrc
fi

#if [ -d "$HOME/bin" ] ; then
#  pathprepend $HOME/bin
#fi

# Having . in the PATH is dangerous
#if [ $EUID -gt 99 ]; then
#  pathappend .
#fi

# End ~/.bash_profile
EOF

cat > /etc/skel/.bashrc << "EOF"
# Begin ~/.bashrc
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>

# Personal aliases and functions.

# Personal environment variables and startup programs should go in
# ~/.bash_profile.  System wide environment variables and startup
# programs are in /etc/profile.  System wide aliases and functions are
# in /etc/bashrc.

if [ -f "/etc/bashrc" ] ; then
  source /etc/bashrc
fi

#if [ -f "$HOME/.bash_aliases" ] ; then
#  source $HOME/.bash_aliases
#fi

alias j='jobs'

shopt -s autocd checkwinsize cdspell extglob no_empty_cmd_completion dotglob
shopt -s cmdhist histreedit histappend histverify expand_aliases
shopt -s globstar dirspell checkhash shift_verbose

export MPD_HOST="127.0.0.1"
export MPD_PORT="7700"
#export GREP_COLORS="always"

export LFS=/mnt/lfs
export HLFS=/mnt/hlfs

complete -c man
complete -c sudo
complete -c whereis
complete -c which
complete -a alias
complete -a unalias
complete -j fg
complete -c killall
complete -g gpasswd
complete -g groupmod
complete -u userdel
complete -u usermod

#_completion_loader() {
#  . "/etc/bash_completion.d/$1.sh" >/dev/null 2>&1 && return 124
#}
#complete -D -F _completion_loader

#if [ -f "$HOME/.bash_login" ] ; then
#  source $HOME/.bash_login
#fi

# End ~/.bashrc
EOF

cat > /etc/skel/.bash_logout << "EOF"
# Begin ~/.bash_logout
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>

# Personal items to perform on logout.

# End ~/.bash_logout
EOF

cp -av /etc/skel/.[!.]* ~
dircolors -p > /etc/dircolors

cat > /etc/issue << "EOF"
        _\\\\/_
 _oOo__( [1;31mO O[0;0m )_oOo_
\l @\n: \s, \U, \d \t

EOF

ln -sv issue /etc/issue.net

cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

) &> $0.log
xz -f $0.log

