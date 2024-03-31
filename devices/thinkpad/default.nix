{config, inputs , pkgs , ...}:
{
  imports = [
    ./hardware-configuration.nix
    ../global
    ../../packages/audio/pipewire.nix
    #../../packages/audio/pulse.nix
    ../../packages/input/bluetooth.nix
    ../../packages/input/graphics-tablets
    ../../packages/cli/default.nix
    ../../packages/gui/default.nix
    ../../packages/gui/gaming.nix
    ../../packages/dev
    
        # Pick a window manager

    ../../packages/window-managers/i3
    ../../packages/window-managers/sway
    ../../packages/graphics/nvidia-optimus-thinkpad.nix

    inputs.xremap-flake.nixosModules.default
  ];

  networking.hostName = "amoeba-thinkpad"; # Define your hostname.

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


  #services.xserver.videoDrivers = ["intel"];
  services.xserver.videoDrivers = ["nvidia"];

  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = ".5";
  };
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback.out
  ];
  boot.kernelModules = [
    "v4l2loopback"
  ];



}
