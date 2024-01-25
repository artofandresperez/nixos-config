{config , pkgs , ...}:

{

  imports = 
  [
    ../xorg

  ];

  services.xserver = {

    desktopManager = {
      xterm.enable = false;
    };
    displayManager ={
      startx.enable = true;

    };

    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./dwm;
      };

    };
    
  };
  environment.systemPackages = with pkgs;[
    dmenu
  ];


}  
