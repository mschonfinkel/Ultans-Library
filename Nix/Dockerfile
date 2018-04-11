FROM nixos/nix:1.11.14

ENV SRC=/home/src

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs \
    && nix-channel --update \
    && nix-env -i nix-repl

COPY . SRC

WORKDIR SRC
