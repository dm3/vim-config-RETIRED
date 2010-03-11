#!/bin/bash
# Assumption: on Cygwin _vimrc/_gvimrc/vimfiles is in $VIMRUNTIME/../
#             on Unix there is no .gvimrc and .vimrc is in ~, while vimfiles/* is in ~/.vim

if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    case "$1" in
        IN)
            if [[ -n "$CYGWIN_HOME" ]]; then
                cp "$VIMRUNTIME/../_vimrc" .
                cp "$VIMRUNTIME/../_gvimrc" .
                cp -r "$VIMRUNTIME/../vimfiles" .
            else
                cp ~/.vimrc _vimrc
                rsync --exclude 'tmp' --exclude 'backup' -av ~/.vim/ vimfiles/
            fi
        ;;
        OUT)
            if [[ -n "$CYGWIN_HOME" ]]; then
                echo "lala"
            else
                echo "trololo"
            fi
        ;;
    esac
fi
