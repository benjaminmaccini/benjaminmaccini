{ ... }:
let
  language = name: text: text;
in
{
  imports = [
    ../../shared/home.nix
  ];

  home.homeDirectory = "/Users/badmin";
}
