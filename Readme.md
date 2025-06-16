# Nix home configuration

To setup **nix** use:

```bash
make setup
```

To stow configuration use:

```bash
make stow
```

## Switch

To switch to the latest version of **nix** use:

```bash
home-manager switch --impure
```

`--impure` is necessary because of `nixGL` [see](https://github.com/nix-community/nixGL/issues/117)
