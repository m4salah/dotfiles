abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a e nvim
abbr -a m make
abbr -a o xdg-open

abbr -a g git

abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'
abbr -a ct 'cargo t'
abbr -a amz 'env AWS_SECRET_ACCESS_KEY=(pass www/aws-secret-key | head -n1)'

abbr -a ais "aws ec2 describe-instances | jq '.Reservations[] | .Instances[] | {iid: .InstanceId, type: .InstanceType, key:.KeyName, state:.State.Name, host:.PublicDnsName}'"
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a ks 'keybase chat send'
abbr -a kr 'keybase chat read'

abbr -a kl 'keybase chat list'
abbr -a pr 'gh pr create -t (git rev-parse --abbrev-ref HEAD) --base {} -T pull_request_template.md'

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

# fzf
set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
fzf --fish | source

# enable vi keybinding
fish_vi_key_bindings

# path
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/go/bin
fish_add_path -g /usr/local/go/bin
fish_add_path -g ~/.local/bin
fish_add_path -g /usr/local/bin/

# alias
alias v=nvim
alias ll="exa -lh"
# alias pomo="porsmo"
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
zoxide init fish | source

