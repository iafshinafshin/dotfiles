if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias ls="exa --icons -lrh -t=changed "
alias la="exa --icons -lrh -a -t=changed "
alias l="exa --icons "
alias nv="nvim "
alias cp="cp -rf "
alias rm="rm -rf "
# alias img="feh --fullscreen"
alias img="feh -F "
alias tree="ll --tree --level=2"
alias g="git"
alias lg="lazygit"
alias thus="cd /run/media/afshin "
alias ughq='cd ~/.ghq ; ghq get -u ./*/*/* & cd - ; echo "Update repositores successful"'
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
set -gx EDITOR nvim

set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0
