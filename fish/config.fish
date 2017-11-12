# Export environment variables
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache
set -x XDG_DATA_HOME ~/.data
set -x TERMINAL urxvt
set -x HISTFILE $XDG_DATA_HOME/bash/bash_history
set -x GNUPGHOME $XDG_CONFIG_HOME/gnupg
set -x LESSHISTFILE /dev/null

# Set aliases
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias vim="nvim"
alias scrot="scrot -d 1 ~/Pictures/Screenshots/screenshot-%Y-%m-%d-%T.png"
alias startx="startx $XDG_CONFIG_HOME/xorg/Xinitrc"

# Other settings
set theme_color_scheme solarized-light
set -g theme_powerline_fonts no
