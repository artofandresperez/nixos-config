{config, pkgs , ...}:
{
  imports = [
    ./hardware-configuration.nix
    ../global
    ../../packages/audio/pipewire.nix
    ../../packages/input/bluetooth.nix
    ../../packages/graphics/nvidia-optimus.nix
    ../../packages/input/graphics-tablets
    ../../packages/cli/default.nix
    ../../packages/gui/default.nix
    ../../packages/gui/gaming.nix
    ../../packages/virtualization/default.nix
    ../../packages/window-managers/i3
    ../../packages/dev

  ];

  networking.hostName = "amoeba-laptop-01"; # Define your hostname.

  # try to fix laptop lid power off thing
  
  services.upower.ignoreLid = true;
  services.logind.lidSwitch = "ignore";


}
