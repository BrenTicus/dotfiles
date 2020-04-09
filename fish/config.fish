# Export environment variables
set -g -x XDG_CONFIG_HOME ~/.config
set -g -x XDG_CACHE_HOME ~/.cache
set -g -x XDG_DATA_HOME ~/.data
set -g -x TERMINAL urxvt
set -g -x HISTFILE $XDG_DATA_HOME/bash/bash_history
set -g -x GNUPGHOME $XDG_CONFIG_HOME/gnupg
set -g -x LESSHISTFILE /dev/null
set -g -x PRIMARY_MONITOR (xrandr --query | grep " primary" | cut -d" " -f1)
set -g -x EDITOR nvim

# Set aliases
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias vim="nvim"
alias du="du -sh"
alias scrot="scrot -d 1 ~/Pictures/Screenshots/screenshot-%Y-%m-%d-%T.png"
alias startx="startx $XDG_CONFIG_HOME/xorg/Xinitrc"

# Other settings
set theme_color_scheme solarized-light
set -g theme_powerline_fonts no

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx $XDG_CONFIG_HOME/xorg/Xinitrc -keeptty
    end
end
