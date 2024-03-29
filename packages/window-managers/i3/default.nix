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
    xautolock = {
      enable = true;


    };
    
  };
  environment.systemPackages = with pkgs;[
    dmenu
    i3lock
    xautolock
  ];


}  
