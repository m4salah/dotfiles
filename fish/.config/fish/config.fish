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
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'

# for pulsestudio
export HOST_IP=(ip route |awk '/^default/{print $3}')
export PULSE_SERVER="tcp:$HOST_IP"

if status is-interactive
	# Commands to run in interactive sessions can go here
    if ! set -q TMUX
		tmux attach || tmux new
	end
end

fish_vi_key_bindings

# path
fish_add_path -g /home/msalah/.cargo/bin
fish_add_path -g /home/msalah/go/bin
fish_add_path -g /usr/local/go/bin
fish_add_path -g /home/msalah/.local/bin

# alias
alias v=nvim
alias ll="exa -lh"
# alias pomo="porsmo"
alias lg="lazygit"

function fish_prompt


	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostnamectl hostname)
	if [ $PWD != $HOME ]

		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)

	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red

	echo -n 'Λ '
	set_color normal
end

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
