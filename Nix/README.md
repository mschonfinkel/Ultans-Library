## Learning Nix

My setup for learning the Nix programming language

### Buildint the Dockefile

```
docker build --rm -it nixos:nix-learning .
```
### Running a file

```
docker container run --rm -it nixos:nix-learning
```

```
nix-instantiate --eval file.nix
```

