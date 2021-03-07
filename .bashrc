#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

screen() {
    brightnessctl set $1%
}
gac() {
    git add . && git commit
}
v() {
    nvim $@
}
z() {
    zathura $@ & disown
}
s() {
    ls $@
}
c() {
    clear
}
r() {
    source ranger $@
}
e() {
    exit $@
}
a() {
    alsamixer
}
p() {
    python3
}

m() {
    ~/cp/make_prob.py $@
}

x() {
    sxiv $@ &disown
}

mkcd() {
    mkdir $1 && cd $1
}
alias sudo='doas'

reset-cursor() {
  printf '\033]50;CursorShape=1\x7'
}
export PS1="$(reset-cursor)$PS1"




export EDITOR=nvim
export QT_STYLE_OVERRIDE=Fusion
export PATH=/home/junikim/programming/yacoh:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/home/junikim/programming/yacoh:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=/home/junikim/programming/yacoh:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/home/junikim/programming/yacoh:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=/home/junikim/programming/yacoh:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/home/junikim/programming/yacoh:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/home/junikim/scripts:/home/junikim/.emacs.d/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
