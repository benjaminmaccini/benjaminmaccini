OS := $(shell uname -s)

CONFIG_ALL := .ctags .vimrc .sqliterc .config/nvim/init.lua
CONFIG_FREEBSD := .shrc
CONFIG_LINUX := .bashrc
CONFIG_MAC := .zshrc

INSTALL_FREEBSD := pkg install -f -y -q
INSTALL_LINUX := apt --reinstall -qq install -y
INSTALL_MAC := brew install

# Default
INSTALL_CMD := $(INSTALL_MAC)

PACKAGES := fzf ripgrep jq gh sqlite3 neovim go

# These are generic installations and commands
SETUP_ALL := \
	mkdir -p $(HOME)/.config; \
	mkdir -p $(HOME)/.config/nvim;

SETUP_MAC := \
	xcode-select --install; \
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \

SETUP_LINUX := \
	sudo add-apt-repository ppa:neovim-ppa/stable -y; \
	sudo add-apt-repository ppa:neovim-ppa/unstable -y; \
	sudo apt update;

ifeq ($(OS), FreeBSD)
	INSTALL_CMD := $(INSTALL_FREEBSD)
	PACKAGES += ctags git
	CONFIG_ALL += $(CONFIG_FREEBSD)
endif 
ifeq ($(OS), Linux)
	INSTALL_CMD := $(INSTALL_LINUX)
	PACKAGES += curl
	CONFIG_ALL += $(CONFIG_LINUX)
	SETUP_ALL += $(SETUP_LINUX)
endif
ifeq ($(OS), Darwin)
	INSTALL_CMD := $(INSTALL_MAC)
	PACKAGES += ctags pgcli
	CONFIG_ALL += $(CONFIG_MAC)
endif

all: setup install init/config

setup:
	@echo "Executing generic setup..."
	$(SETUP_ALL)

install:
	@echo "Installing packages on $(OS)..."
	@for pkg in $(PACKAGES); do \
		echo "Installing $$pkg..."; \
		$(INSTALL_CMD) $$pkg; \
	done

# This will create a symbolic link
init/config:
	@echo "Copying configuration files on $(OS)..."
	@for f in $(CONFIG_ALL); do \
		echo "Initializing $$f..."; \
		ln -srf $$f $(HOME)/$$f; \
	done

.PHONY: all install init/config
