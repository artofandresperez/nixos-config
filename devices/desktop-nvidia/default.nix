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
    ../../packages/gui/gaming.nix
    ../../packages/dev
    
        # Pick a window manager

    ../../packages/window-managers/i3
    #../../packages/window-managers/hyprland
    #../../packages/window-managers/dwm
    #../../packages/window-managers/dwl
    #../../packages/window-managers/sway

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
