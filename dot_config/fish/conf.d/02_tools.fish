if test -x ~/.local/bin/mise
    ~/.local/bin/mise activate fish | source
end

if test -f /opt/homebrew/opt/fzf/shell/key-bindings.fish
    source /opt/homebrew/opt/fzf/shell/key-bindings.fish
    fzf_key_bindings
end
