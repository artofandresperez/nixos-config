{config , pkgs , ...}:
{
  imports = 
  [
   ./nvidia-global.nix
  ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };


}
