{config , pkgs , ...}:

{

  imports = 
  [
    ../../graphics/xorg.nix

  ];

  services.xserver = {

    desktopManager = {
      xterm.enable = false;
    };
    displayManager ={
      startx.enable = true;

    };
    
  };
  environment.systemPackages = with pkgs;[
    dmenu

  ];
}  
