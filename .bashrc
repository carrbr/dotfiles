#
# ~/.bashrc
#

# allow autoconf to do it's job by telling everyone else it exists
export AUTOCONF=autoconf

# path for Haskell programs installed with cabal
export PATH=$PATH:~/.cabal/bin

# make sure ruby gems work properly
export PATH=$PATH:/home/brian/.gem/ruby/2.1.0/bin

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

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS. Try to use the external file
# first to take advantage of user additions. Use internal bash
# globbing instead of external grep binary.

# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] \
        && type -P dircolors >/dev/null \
            && match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] ; then
        
    # we have colors :-)

    # Enable colors for ls, etc. Prefer ~/.dir_colors
    if type -P dircolors >/dev/null ; then
        if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
        fi
    fi

    PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;38m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

    # Use this other PS1 string if you want \W for root and \w for all other users:
    # PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h\[\033[01;34m\] \W'; else echo '\[\033[01;32m\]\u@\h\[\033[01;34m\] \w'; fi) \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

    alias ls="ls --color=auto"
    alias dir="dir --color=auto"
    alias grep="grep --color=auto"
    alias dmesg='dmesg --color'

    # Uncomment the "Color" line in /etc/pacman.conf instead of uncommenting the following line...!

    # alias pacman="pacman --color=auto"

else

    # show root@ when we do not have colors

    PS1="\u@\h \w \$([[ \$? != 0 ]] && echo \":( \")\$ "

    # Use this other PS1 string if you want \W for root and \w for all other users:
    # PS1="\u@\h $(if [[ ${EUID} == 0 ]]; then echo '\W'; else echo '\w'; fi) \$([[ \$? != 0 ]] && echo \":( \")\$ "

fi

PS2="> "
PS3="> "
PS4="+ "

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
