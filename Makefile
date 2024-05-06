CONFIG_TARGET_DIR := ~/.config/home-manager
CONFIG_TARGET := $(CONFIG_TARGET_DIR)/home.nix

all: help

stow: $(CONFIG_TARGET)

$(CONFIG_TARGET):
	stow . -t $(CONFIG_TARGET_DIR) -R

help:
	@echo "Run \`make stow\` to copy all needed files"
	
