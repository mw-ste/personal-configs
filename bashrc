#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

export EDITOR=nano visudo
export PULSE_LATENCY_MSEC=60
export PATH=$PATH:/home/michi/.gem/ruby/2.3.0/bin

# Command Line Shortcuts
alias ls='ls --color=auto'
alias ll='ls -lA'
alias cl='clear'
alias grep='grep --color=auto'

# Package Manager Aliases
alias update='yaourt -Syua'
alias install='yaourt'
alias installed='yaourt -Qe'
alias remove='yaourt -R'
alias cleanup='yaourt -Qdt'

# Power Aliases
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'

# Git Aliases
alias pull='git pull'
alias push='git push origin master'
alias add='git add -A'
alias commit='git commit -am'

# Program Aliases
alias facebook='firefox -private-window www.facebook.com 2> /dev/null &'
alias raspi='ssh pi@192.168.178.53'
alias nas-connect='sudo mount -t cifs //192.168.178.53/michi-nas /mnt -o user=pi,domain=WORKGROUP'
alias aventail='startctui &'
alias scilab='~/.scilab_bin/bin/scilab'
alias battery='acpi -V | grep Battery | grep Discharging || acpi -V | grep Battery | grep Charging'
alias stopx='xfce4-session-logout --logout'
alias pdf-to-img='/home/michi/.scripts/pdf-to-img.sh'


