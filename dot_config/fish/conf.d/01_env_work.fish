set -gx NODE_TLS_REJECT_UNAUTHORIZED 0
set -gx HEX_UNSAFE_HTTPS 1

set -gx TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
set -gx DOCKER_HOST "unix://$HOME/.colima/default/docker.sock"
if type -q colima; and type -q jq
    set -gx TESTCONTAINERS_HOST_OVERRIDE (colima ls -j | jq -r '.address')
end

set -gx GPG_TTY (tty)
