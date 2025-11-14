CONFIG_TARGET_DIR := ~/.config/home-manager
CONFIG_TARGET := $(CONFIG_TARGET_DIR)/home.nix

all: help

stow: $(CONFIG_TARGET_DIR)
	@stow . -t $(CONFIG_TARGET_DIR) -R

$(CONFIG_TARGET_DIR):
	@mkdir -p $@

install:
	@nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	@nix-channel --update
	@nix-shell '<home-manager>' -A install
	@nix-env -i nixGL

FEATURES_FLAGS := --extra-experimental-features nix-command --extra-experimental-features flakes
EXPORTS := NIXPKGS_ALLOW_UNFREE=1


upgrade:
	@nix-channel --update
	@nix-env --upgrade
	@nix flake update $(FEATURES_FLAGS)
	@$(EXPORTS) home-manager switch --impure $(FEATURES_FLAGS)

help:
	@echo "Run \`make stow\` to copy all needed files"
	@echo "\`install\` to install nix and home-manager"
	@echo "\`upgrade\` to upgrade home-manager"
	@echo "\`gc\` to clear all orphans"
	@echo "\`help\` to clear all orphans"

gc: 
	@home-manager expire-generations -1minutes
	@nix-env --delete-generations 2d
	@nix-store --gc	
