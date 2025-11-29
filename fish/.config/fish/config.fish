abbr -a yr 'cal -y'
abbr -a e nvim
abbr -a m make
abbr -a o xdg-open

abbr -a g git

abbr -a vimdiff 'nvim -d'

abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git rev-parse --abbrev-ref HEAD) -T pull_request_template.md -a ZiadKenzz -a ahmedgaber9 -a abdullah-alrefaey-k -a esmail-kenzz -a Abd3lwahab -r ZiadKenzz -r ahmedgaber9 -r abdullah-alrefaey-k -r esmail-kenzz -r Abd3lwahab --base main'

set -l os (uname)
if test "$os" = Darwin
	eval "$(/opt/homebrew/bin/brew shellenv)"
end

if status is-interactive
	# Commands to run in interactive sessions can go here
    if ! set -q TMUX
		tmux attach || tmux new
	end
end

# set ediro to nvim
set -Ux EDITOR nvim

# fzf
set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

fzf --fish | source

# enable vi keybinding
fish_vi_key_bindings

# Setup java and android.
set --export ANDROID_HOME $HOME/Library/Android/sdk;
set --export JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home;

# Postgresql 17
set -gx LDFLAGS "-L/opt/homebrew/opt/postgresql@17/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/postgresql@17/include"

# path
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/go/bin
fish_add_path -g /usr/local/go/bin
fish_add_path -g ~/.local/bin
fish_add_path -g /usr/local/bin/
fish_add_path -g ~/qmk_toolchains_macosARM64/bin
fish_add_path /opt/homebrew/opt/postgresql@17/bin

# Android paths
fish_add_path -g $JAVA_HOME/bin
fish_add_path -g $ANDROID_HOME/emulator
fish_add_path -g $ANDROID_HOME/tools
fish_add_path -g $ANDROID_HOME/tools/bin
fish_add_path -g $ANDROID_HOME/platform-tools

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

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

# set --export GEMINI_API_KEY "AIzaSyD3Tp4AF3OrZ37qkbcHbulNw3oTw_NQX3k"
set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

/Users/mohamed-kenzz/.local/bin/mise activate fish | source # added by https://mise.run/fish


# pnpm
set -gx PNPM_HOME "/Users/mohamed-kenzz/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# opencode
fish_add_path /Users/mohamed-kenzz/.opencode/bin

# Added by Antigravity
fish_add_path /Users/mohamed-kenzz/.antigravity/antigravity/bin
