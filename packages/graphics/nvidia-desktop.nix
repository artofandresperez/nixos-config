{config , pkgs , ...}:
{
  imports = 
  [
   ./nvidia-global.nix
  ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
    open = false;
    nvidiaSettings = true;
  };


}
