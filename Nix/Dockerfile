FROM nixos/nix:1.11.14

RUN nix-env -iA $(nix-channel --list | awk '{print $1}').nix-repl
