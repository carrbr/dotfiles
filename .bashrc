#
# ~/.bashrc
#

# allow autoconf to do it's job by telling everyone else it exists
export AUTOCONF=autoconf

# path for Haskell programs installed with cabal
export PATH=$PATH:~/.cabal/bin

# make sure ruby gems work properly
export PATH=$PATH:/home/brian/.gem/ruby/2.1.0/bin

# add intel compiler software to path
export PATH=$PATH:/opt/intel/bin

# CCACHE environment vars
export CCACHE_DIR=~/.ccache
export CCACHE_HARDLINK=1

# allow adb to be used without full path
alias adb="/opt/android-sdk/platform-tools/adb"

# allow arm cross compiler to be used without full path
alias gcc-arm="/home/brian/storage/programming/kernel/gcc-arm-none-eabi-4_8-2014q2/arm-none-eabi/bin/gcc"

# Mozilla build directory
#export MOZBUILD_STATE_PATH=~/Documents/Programming/OpenSource/firefox/mozilla-central/obj-testBuild

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'

PS1='\[\e[1;37m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;34m\]\$\[\e[m\] '
