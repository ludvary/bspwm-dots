if status is-interactive
    # Commands to run in interactive sessions can go here

# history
set -U fish_history default
set -gx HISTSIZE 20000
set -gx SAVEHIST 20000

# aliases
alias ls "eza --icons"
alias ll "eza --long --no-filesize --no-user --time-style=long-iso --icons"

alias nvim "$HOME/.local/bin/lvim"
alias rip "rip --graveyard $HOME/graveyard"

alias Code "cd $HOME/hause/significant\ things/code/"

alias minecraft "java -jar $HOME/Downloads/apps/SKlauncher-3.2.18.jar"
alias silksong "wine $HOME/.wine/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/Hollow\ Knight\ Silksong/Hollow\ Knight\ Silksong.exe"
alias hollow_knight "wine $HOME/.wine/drive_c/Program\ Files\ \(x86\)/DODI-Repacks/Hollow\ Knight/hollow_knight.exe"

alias hib "systemctl hibernate"
alias sus "systemctl suspend"

# ssh
alias ssh_lab "ssh admin3@192.168.8.31"
alias ssh_main_lab "ssh admin3@192.168.8.26"
alias cluster_beta "ssh -X krishna@192.168.35.162"
alias my_pc "ssh -X krishna@192.168.33.174"

alias one_nine_three "ssh -X krishna@172.16.23.193"
alias one_nine_two "ssh -X krishna@172.16.23.192"
alias one_nine_one "ssh -X krishna@172.16.23.191"
alias one_nine_zero "ssh -X krishna@172.16.23.190"

alias one_eight_six "ssh -X krishna@172.16.23.186"
alias one_eight_seven "ssh -X krishna@172.16.23.187"
alias one_eight_eight "ssh -X krishna@172.16.23.188"
alias one_eight_nine "ssh -X krishna@172.16.23.189"

alias amd_225 "ssh -X krishna@172.16.21.225"

alias adj_lab_i9_243 "ssh -X krishna@192.168.32.243"

alias storage_server "ssh -X krishna@172.16.23.180"

# fastfetch
fastfetch --config $HOME/.config/fastfetch/13.jsonc

# PATH additions
set -gx PATH $HOME/.config/emacs/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/scripts/bin $PATH
set -gx PATH $HOME/.local/bin $PATH

    # vim bindings
    fish_vi_key_bindings

end


# Added by Antigravity CLI installer
set -gx PATH "/home/ludvary/.local/bin" $PATH
