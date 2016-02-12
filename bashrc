#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Export variables
export EDITOR=nano visudo
export PULSE_LATENCY_MSEC=60
export PATH=$PATH:/home/michi/.gem/ruby/2.3.0/bin

# Adapt to Window Size
shopt -s checkwinsize

# Prompt design
PS1='\[\e[0;36m\][\u \A \w]\$ \[\e[m\]'
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion


# Print to new Terminal Window
archey3
acpi -V | grep Battery | grep Discharging
acpi -V | grep Battery | grep Charging
echo
fortune

# include shell aliases
source $HOME/.shell-aliases

# include shell functions
source $HOME/.shell-functions
