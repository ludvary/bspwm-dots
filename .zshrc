export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnosterzak"
ZSH_THEME="arrow"

plugins=( 
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -


# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory

# # Set-up icons for files/directories in terminal using lsd
# alias ls='lsd'
# alias l='ls -l'
# alias la='ls -a' alias lla='ls -la'
# alias lt='ls --tree'

alias ls="eza --icons"
alias ll="eza --long --no-filesize --no-user --time-style=long-iso --icons"
alias yz=yazi


alias nvim="$HOME/.local/bin/lvim"
alias rip="rip --graveyard $HOME/graveyard"

alias Code="cd $HOME/hause/significant\ things/code/"
alias Books="cd $HOME/hause/significant\ things/books/"

# alias minecraft="java -jar $HOME/Downloads/apps/SKlauncher-3.2.12.jar"
alias minecraft="java -jar $HOME/Downloads/apps/SKlauncher-3.2.18.jar"
alias silksong="wine $HOME/.wine/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/Hollow\ Knight\ Silksong/Hollow\ Knight\ Silksong.exe"
alias hollow_knight="wine $HOME/.wine/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/Hollow\ Knight/hollow_knight.exe"
alias skyrim="wine $HOME/.wine/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/The\ Elder\ Scrolls\ V\ Skyrim\ Anniversary\ Edition/SkyrimSELauncher.exe"
alias ets2="$HOME/.wine/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/Euro\ Truck\ Simulator\ 2/bin/win_x64/eurotrucks2.exe"

alias hib="systemctl hibernate && $HOME/.config/eww/scripts/i3lock-widgets"
# alias hib="$HOME/.config/eww/scripts/i3lock-widgets && sleep 5 && systemctl hibernate"
alias screen_off="xset dpms force off"
# alias sus="systemctl suspend"
alias sus="systemctl suspend && $HOME/.config/eww/scripts/i3lock-widgets"

emacs_nano() {
    emacs -l ~/.emacs.d/init.el "$@" & disown
}
alias emacs_doom="~/.config/emacs/bin/doom run & disown"


# ssh
alias ssh_lab="ssh admin3@192.168.8.31" 
alias ssh_main_lab="ssh admin3@192.168.8.26"
alias cluster_beta="ssh -X krishna@192.168.35.162"
alias my_pc="ssh -X krishna@192.168.33.174"

alias one_nine_three="ssh -X krishna@172.16.23.193"
alias one_nine_two="ssh -X krishna@172.16.23.192"
alias one_nine_one="ssh -X krishna@172.16.23.191"
alias one_nine_zero="ssh -X krishna@172.16.23.190"

alias one_eight_six="ssh -X krishna@172.16.23.186"
alias one_eight_seven="ssh -X krishna@172.16.23.187"
alias one_eight_eight="ssh -X krishna@172.16.23.188"
alias one_eight_nine="ssh -X krishna@172.16.23.189"

alias amd_225="ssh -X krishna@172.16.21.225"

alias adj_lab_i9_243="ssh -X krishna@192.168.32.243"

alias storage_server="ssh -X krishna@172.16.23.180"

alias crr="cargo run --release"

# to enable some vim goodness in terminal
set -o vi

fastfetch --config $HOME/.config/fastfetch/13.jsonc

# add paths
export PATH="$HOME/.config/emacs/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/scripts/bin/:$PATH"
export PATH=$HOME/.local/bin:$PATH



# source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ludvary/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ludvary/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ludvary/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ludvary/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export SAL_USE_VCLPLUGIN=gen
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=31:cd=31:su=31:sg=31:tw=31:ow=31"
export EZA_COLORS="di=1;34"
zstyle ':completion:*' list-colors 'di=1;34'

export MANPAGER='/home/ludvary/.local/bin/lvim +Man!'


# Added by Antigravity CLI installer
export PATH="/home/ludvary/.local/bin:$PATH"
