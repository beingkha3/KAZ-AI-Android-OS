# if [ -z "$PROOT_DISTRO" ]; then
#  proot-distro login ubuntu
# fi
alias phone='cd /sdcard/'
alias cls='clear'
alias ls='eza --icons --color=always'
alias ll='ls -alF'
alias la='ls -A'
alias linux='proot-distro login ubuntu'


PS1='\[\e[38;5;39m\]⚡ \[\e[38;5;196m\]\u\[\e[0m\]@\[\e[38;5;220m\]\h\[\e[0m\]:\[\e[38;5;45m\]\w\[\e[0m\] ❯ '
eval "$(starship init bash)"
