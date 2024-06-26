{config, inputs , pkgs , ...}:
{
  imports = [
    ./hardware-configuration.nix
    ../global
    ../../packages/graphics/nvidia-desktop.nix
    ../../packages/audio/pipewire.nix
    ../../packages/input/bluetooth.nix
    ../../packages/input/graphics-tablets
    ../../packages/cli/default.nix
    ../../packages/gui/default.nix
    ../../packages/gui/cg.nix
    ../../packages/gui/hou.nix
    ../../packages/gui/gaming.nix
    ../../packages/dev
    ../../packages/virtualization
    ../../packages/cli/ssh.nix
    
        # Pick a window manager

    ../../packages/window-managers/i3
    ../../packages/window-managers/sway
    #../../packages/gui/pureref.nix

  ];

  networking.hostName = "amoeba-desktop-01"; # Define your hostname.
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

  services.xserver.videoDrivers = ["nvidia"];



}
