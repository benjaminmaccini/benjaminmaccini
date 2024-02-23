OS := $(shell uname -s)

CONFIG_ALL := .ctags .vimrc .sqliterc .config/nvim/init.lua
CONFIG_FREEBSD := .shrc
CONFIG_LINUX := .bashrc
CONFIG_MAC := .zshrc

INSTALL_FREEBSD := pkg install -f -y -q
INSTALL_LINUX := apt-get -q install -y
INSTALL_MAC := brew install

PACKAGES := fzf ripgrep jq gh sqlite3 neovim go

# These are generic installations and commands
SETUP_ALL := \
	mkdir -p $HOME/.config; \
	mkdir -p $HOME/.config/nvim;

SETUP_MAC := \
	xcode-select --install; \
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \

# Default
INSTALL_CMD := $(INSTALL_MAC)

ifeq ($(OS), FreeBSD)
	INSTALL_CMD := $(INSTALL_FREEBSD)
	PACKAGES += ctags git
	CONFIG_ALL += $(CONFIG_FREEBSD)
endif 
ifeq ($(OS), Linux)
	INSTALL_CMD := $(INSTALL_LINUX)
	PACKAGES += curl
	CONFIG_ALL += $(CONFIG_LINUX)
endif
ifeq ($(OS), Darwin)
	INSTALL_CMD := $(INSTALL_MAC)
	PACKAGES += ctags pgcli
	CONFIG_ALL += $(CONFIG_MAC)
endif

all: install init/config

install:
	@echo "Installing packages on $(OS)..."
	@for pkg in $(PACKAGES); do \
		echo "Installing $$pkg..."; \
		$(INSTALL_CMD) $$pkg; \
	done
	@echo "Executing generic setup..."
	$(SETUP_ALL)

# This will create a symbolic link
init/config:
	@echo "Copying configuration files on $(OS)..."
	@for f in $(CONFIG_ALL); do \
		echo "Initializing $$f..."; \
		ln -f $$f $(HOME)/$$f; \
	done

.PHONY: all install init/config
