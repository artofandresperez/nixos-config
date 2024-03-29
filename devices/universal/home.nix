{ config, lib , pkgs, ... }:
{


  imports = [
  ../global/home.nix
  ../../packages/gui/home.nix

    # Pick a window manager
  ../../packages/window-managers/i3/home.nix
  #../../packages/window-managers/hyprland/home.nix #../../packages/window-managers/dwm/home.nix
  ../../packages/window-managers/sway/home.nix
  ../../packages/cli/home.nix
  

  ];


  home.file."./.xinitrc" = {
    source = ../../dotfiles/.xinitrc-i3-uv;
  };
  
}
