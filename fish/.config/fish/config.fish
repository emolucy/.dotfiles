if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2023-04-28 20:28:17
set PATH $PATH /home/lucy/.local/bin

# opam configuration
source /home/lucy/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/lucy/.ghcup/bin # ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/lucy/.ghcup/bin # ghcup-env