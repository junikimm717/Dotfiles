# If you come from bash you might have to change your $PATH.
export PATH=$HOME/mktex:$HOME/scripts/bin:$HOME/.emacs.d/bin:$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/junikim/.oh-my-zsh"
export HISTSIZE=500

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="edvardm"

# Set list of themes to pick from when loading at random Setting this variable when ZSH_THEME=random will cause zsh to load a theme from this variable instead of looking in $ZSH/themes/ If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias gac='git add . && git commit'
alias v='nvim'
alias s='ls'
alias sy='systemctl'
alias j='journalctl'
alias r='source ranger'
alias c='clear'
alias e='exit'
alias a='alacritty & disown'
alias o='xdg-open'
alias caps='setxkbmap -option caps:escape'
alias ec='emacsclient'
alias cp='cp -r'
alias vc='nvim ~/.config/nvim/init.vim'
z() {
    zathura $@ & disown
}
mkcd() {
    mkdir $1 && cd $1
}
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
export EDITOR=nvim
export PF_INFO="ascii title os kernel wm shell pkgs"
export TERM=alacritty
export BROWSER=brave
set -o vi
# for changing neovim cursor after finishing
eval "$(starship init zsh)"

pfetch

reset-cursor() {
  printf '\033]50;CursorShape=1\x7'
}
export PS1="$(reset-cursor)$PS1"
source ~/perl5/perlbrew/etc/bashrc
source "/home/junikim/programming/jpk/pkgs/rems/env/env.sh"
source "/home/junikim/programming/jpk/pkgs/gradecalc/env/env.sh"
source "/home/junikim/programming/jpk/pkgs/vrepl-v1/env/env.sh"

#rems l --show cr
export PATH=/home/junikim/.local/share/gem/ruby/3.0.0/bin:$PATH
eval $(thefuck --alias)
alias skype='brave https://web.skype.com'
export MT_EDITOR=/usr/bin/nvim

alias mp='/usr/bin/ncmpcpp'
