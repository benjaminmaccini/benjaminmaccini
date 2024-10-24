{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in
{
  home.username = "badmin";
  home.homeDirectory = "/home/badmin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    curl
    dbmate
    elixir
    entr
    fish
    fzf
    gh
    git
    go
    golangci-lint
    helix
    hledger
    hurl
    jq
    kitty
    litecli
    neofetch
    nodejs
    pgcli
    ripgrep
    rustc
    signal-desktop
    silver-searcher
    sqlite
    syncthing
    thunderbird
    uv
    vim
    wget
    unstable.zed-editor
    zig
    zotero
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    ".bashrc".source = dotfiles/bashrc;
    ".fishrc".source = dotfiles/fishrc;
    ".shrc".source = dotfiles/shrc;
    ".sqliterc".source = dotfiles/sqliterc;
    ".vimrc".source = dotfiles/vimrc;
    ".zshrc".source = dotfiles/zshrc;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Set defaults
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
