abbr -a yr 'cal -y'
abbr -a e nvim
abbr -a m make
abbr -a o open

abbr -a g git

abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'

abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git rev-parse --abbrev-ref HEAD) --base main'

abbr -a cc 'claude'

set -l os (uname)
if test "$os" = Darwin
	eval "$(/opt/homebrew/bin/brew shellenv)"
end

# if status is-interactive
# 	# Commands to run in interactive sessions can go here
#     if ! set -q TMUX
# 		tmux attach || tmux new
# 	end
# end

# set ediro to nvim
set -Ux EDITOR nvim

# fzf
set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

# enable vi keybinding
fish_vi_key_bindings

# path
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/go/bin
fish_add_path -g /usr/local/go/bin
fish_add_path -g ~/.local/bin
fish_add_path -g /usr/local/bin/

set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $PATH $ANDROID_HOME/emulator
set -gx PATH $PATH $ANDROID_HOME/platform-tools

# alias
alias v=nvim
alias ls="eza --icons=always"
alias lg="lazygit"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias .....="cd ../../../../"

function fish_greeting
	echo -e "              ▄ ▄                   "
	echo -e "          ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     "
	echo -e "          █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     "
	echo -e "       ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     "
	echo -e "     ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  "
	echo -e "     █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄"
	echo -e "   ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █"
	echo -e "   █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █"
	echo -e "       █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    "
	echo
	set_color normal
end

starship init fish | source

# zoxide 
zoxide init fish | source


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# ZVM
set -gx ZVM_INSTALL "$HOME/.zvm/self"
set -gx PATH $PATH "$HOME/.zvm/bin"
set -gx PATH $PATH "$ZVM_INSTALL/"

# opencode
fish_add_path /home/msalah/.opencode/bin

# Pi
fish_add_path "/Users/mohamed-kenzz/.local/share/mise/installs/node/24.18.1/bin"

# Added by Radicle.
export PATH="$PATH:/Users/mohamed-kenzz/.radicle/bin"
