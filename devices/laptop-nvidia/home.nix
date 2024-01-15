{ config, lib , pkgs, ... }:
{


  imports = [
  ../global/home.nix
  ../../packages/window-managers/i3/home.nix
  ../../packages/gui/home.nix
  

  ];


  home.file."./xinitrc" = {
    source = ../../dotfiles/.xinitrc;
  };
  
}
