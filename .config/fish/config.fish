if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias l="eza --icons "
alias c='clear'
alias ll="l -lrh "
alias la="ll -a "
alias nv="nvim "
alias cp="cp -rf "
alias rm="rm -rf "
alias img="feh -F "
alias g="git"
alias lg="lazygit"
alias thus="cd /run/user/1000/gvfs/"
alias ughq='cd ~/.ghq ; ghq get -u ./*/*/* & cd - ; clear ; echo "Update repositores successful"'
alias n='nvm use v20.14.0'
alias ide="~/.config/fish/ide "
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias grep='grep --color=auto '
alias egrep='egrep --color=auto '
alias fgrep='fgrep --color=auto '
# alias rmpl='sudo rm /var/lib/pacman/db.lck '
alias nv-su='sudo -e nv '
alias mpl='mplayer -fs '
alias curl-tor='curl --socks5-hostname localhost:9050 '
alias curl-warp='curl --socks5-hostname localhost:8086 '
alias myip='wget -qO - https://api.ipify.org; echo'
alias mytorip='torsocks wget -qO - https://api.ipify.org; echo'
alias mywarpip='proxychains wget -qO - https://api.ipify.org; echo'
alias warprox='cd ~/warp-plus_linux-amd64 && ./warp-plus'
alias tpw='tmux new -s Proxy ; tmux new -s "Dailly Work"'
set -gx EDITOR nvim
set -gx MY_PROJECT ~/.ghq/github.com/iafshinafshin/seevideo/
set -gx NVIM_CONF ~/.ghq/github.com/iafshinafshin/dotfiles/.config/nvim/lua/
set -gx DEV ~/Development/
set -gx DOT_CONF ~/.ghq/github.com/iafshinafshin/dotfiles/

set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0
export BAT_THEME=tokyonight_night
