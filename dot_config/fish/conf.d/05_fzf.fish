fzf --fish | source

# Detailed process table for `kill <Shift-Tab>` (port of fzf's bash/zsh _fzf_complete_kill)
function _fzf_complete_kill
    command ps -eo user,pid,ppid,start,time,command | _fzf_complete --multi --header-lines=1 --no-preview --wrap -- $argv
end

function _fzf_complete_kill_post
    awk '{print $2}'
end
