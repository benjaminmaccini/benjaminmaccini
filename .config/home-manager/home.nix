{ config, pkgs, services, home-manager, users, lib, ... }:

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

  nixpkgs.config.allowUnfree = true;

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
    litecli
    neofetch
    nodejs
    pgcli
    ripgrep
    R
    rstudio
    rustc
    rye
    signal-desktop
    silver-searcher
    sqlite
    syncthing
    thunderbird
    uv
    vim
    wget
    zig
    zotero
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    ".bashrc".source = dotfiles/.bashrc;
    ".fishrc".source = dotfiles/.fishrc;
    ".shrc".source = dotfiles/.shrc;
    ".sqliterc".source = dotfiles/.sqliterc;
    ".vimrc".source = dotfiles/.vimrc;
    ".zshrc".source = dotfiles/.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    userName  = "Benjamin Maccini";
    userEmail = "benjaminmaccini@gmail.com";
  };

  services.syncthing = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
