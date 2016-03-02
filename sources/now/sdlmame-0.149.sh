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

#!/bin/sh

# Create a variable equal to $HOME that will be used later in the ini creation
home=('$HOME')

if [ "$1" != "" ] && [ "$1" = "--newini" ]; then
  echo "Rebuilding the ini file at $HOME/.mame/mame.ini"
  echo "Modify this file for permanent changes to your SDLMAME"
  echo "options and paths before running SDLMAME again."
  cd $HOME/.mame
  if [ -e mame.ini ]; then
    echo "Your old ini file has been renamed to mameini.bak"
    mv mame.ini mameini.bak
  fi
  /usr/share/sdlmame/sdlmame \
    -artpath "$home/.mame/artwork;artwork" \
    -ctrlrpath "$home/.mame/ctrlr;ctrlr" \
    -inipath $home/.mame/ini \
    -rompath $home/.mame/roms \
    -samplepath $home/.mame/samples \
    -cfg_directory $home/.mame/cfg \
    -comment_directory $home/.mame/comments \
    -diff_directory $home/.mame/diff \
    -input_directory $home/.mame/inp \
    -memcard_directory $home/.mame/memcard \
    -nvram_directory $home/.mame/nvram \
    -snapshot_directory $home/.mame/snap \
    -state_directory $home/.mame/sta \
    -video opengl \
    -createconfig
elif [ ! -e $HOME/.mame ]; then
  echo "Running SDLMAME for the first time..."
  echo "Creating an ini file for SDLMAME at $HOME/.mame/mame.ini"
  echo "Modify this file for permanent changes to your SDLMAME"
  echo "options and paths before running SDLMAME again."
  mkdir $HOME/.mame
  mkdir $HOME/.mame/{artwork,cfg,comments,ctrlr,diff,ini,inp,memcard,nvram,samples,snap,sta}
  cd $HOME/.mame
  /usr/share/sdlmame/sdlmame \
    -artpath "$home/.mame/artwork;artwork" \
    -ctrlrpath "$home/.mame/ctrlr;ctrlr" \
    -inipath $home/.mame/ini \
    -rompath $home/.mame/roms \
    -samplepath $home/.mame/samples \
    -cfg_directory $home/.mame/cfg \
    -comment_directory $home/.mame/comments \
    -diff_directory $home/.mame/diff \
    -input_directory $home/.mame/inp \
    -memcard_directory $home/.mame/memcard \
    -nvram_directory $home/.mame/nvram \
    -snapshot_directory $home/.mame/snap \
    -state_directory $home/.mame/sta \
    -video opengl \
    -createconfig
else
  cd /usr/share/sdlmame
  ./sdlmame "$@"
fi
