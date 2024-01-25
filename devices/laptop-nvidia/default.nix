{config, inputs , pkgs , ...}:
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
    ../../packages/dev
    ../../packages/gui/cg.nix
    
        # Pick a window manager

    #../../packages/window-managers/i3
    ../../packages/window-managers/hyprland
    #../../packages/window-managers/dwm

    inputs.xremap-flake.nixosModules.default
  ];

  networking.hostName = "amoeba-laptop-01"; # Define your hostname.

  # try to fix laptop lid power off thing
  
  services.upower.ignoreLid = true;
  services.logind.lidSwitch = "ignore";

  services.input-remapper = {

    enable = true;
  };


  services.xremap = {
    withHypr = true;
    userName = "amoeba";
    config = {
      modmap = [
      {
        name = "laptop-remap";
        #device.only = ["event1"];
        remap  = {
          "KEY_CAPSLOCK" = "KEY_LEFTSHIFT";
          "KEY_LEFTSHIFT" = "KEY_LEFTCTRL";
        };
      }
      ];
      keymap = [

      {
        name = "mouse-remap";
        remap = {
          "BTN_SIDE" = "BTN_MIDDLE";
        };

      }
      ];
      
    };
  };



}
