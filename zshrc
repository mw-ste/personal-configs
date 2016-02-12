# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/michi/.zshrc'

autoload -U compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt completeinword

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U promptinit
promptinit

autoload -U colors && colors

PROMPT="%{$fg[cyan]%}[%n %T %~]%{$reset_color%}"

alias ls='ls --color=auto'
#PS1='\[\e[0;36m\][\u \A \w]\$ \[\e[m\]'
archey3
acpi -V | grep Battery | grep Discharging
acpi -V | grep Battery | grep Charging
echo
fortune

export EDITOR=nano visudo
export PULSE_LATENCY_MSEC=60
export PATH=$PATH:/home/michi/.gem/ruby/2.2.0/bin

# include shell aliases
source $HOME/.shell-aliases

# include shell functions
source $HOME/.shell-functions
