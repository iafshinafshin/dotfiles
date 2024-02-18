if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -g GHQ_DIR ~/ghq/github.com


alias ll="exa --icons -lrh -t=changed"
alias la="exa --icons -lrh -a -t=changed"
alias l="exa --icons"
alias nv="nvim"
alias cp="cp -rf"
alias rm="rm -rf"
# alias img="feh --fullscreen"
alias img="feh -F"
alias tree="ll --tree --level=2"
alias g="git"
alias dghq="cd $GHQ_DIR"
alias thus="cd /run/media/afshin"
alias ughq='cd ~/ghq & ghq get -u ./*/*/* & cd -'
alias ide="~/.config/fish/ide"

set -gx EDITOR nvim

set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0
