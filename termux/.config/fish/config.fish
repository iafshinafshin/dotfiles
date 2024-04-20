if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias le="eza --icons -lrh -t=changed "
alias la="eza --icons -lrh -a -t=changed "
alias l="eza --icons "
alias nv="nvim "
alias cp="cp -rf "
alias rm="rm -rf "
alias img="feh -F "
alias g="git"
alias lg="lazygit"
# alias thus="cd /run/media/afshin "
alias ughq='cd ~/.ghq ; ghq get -u ./*/*/* & cd - ; clear ; echo "Update repositores successful"'
alias ide="~/.config/fish/ide "
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias grep='grep --color=auto '
alias egrep='egrep --color=auto '
alias fgrep='fgrep --color=auto '
alias rmpl='sudo rm /var/lib/pacman/db.lck '
alias nv-su='sudo -e nv '
alias curl-tor='curl --socks5-hostname localhost:9050 '
alias myip='wget -qO - https://api.ipify.org; echo'
alias kd='vncserver -kill :1'
alias sd='kd ; vncserver -localhost'
set -gx EDITOR nvim

set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0
