{ ... }:

{
  imports = [
    ./git.nix
    ./fish.nix
    ./user-software.nix
    ./dotfiles.nix
    ./nixvim.nix
  ];

  home.username = "ethan";
  home.homeDirectory = "/home/ethan";
  home.stateVersion = "25.05";
}
