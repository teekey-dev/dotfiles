if status is-interactive; and type -q gpg-connect-agent
    if not gpg-connect-agent /bye >/dev/null 2>&1
        gpg-agent --daemon >/dev/null 2>&1
    end
end
