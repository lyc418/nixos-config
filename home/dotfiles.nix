{ config, ... }:

let
  configDir = "${config.home.homeDirectory}/nixos-config/config";
in
{
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/hypr";
  home.file.".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/starship.toml";
  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/alacritty";
  home.file.".config/zellij".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/zellij";
  home.file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/vim/vimrc";
  home.file.".config/doom".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/doom";
  home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/niri";
  home.file.".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/tmux";
  home.file.".config/zed".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/zed";
}
