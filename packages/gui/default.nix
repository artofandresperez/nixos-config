

{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    # messaging client 
    telegram-desktop
    # Virtual Desktop
    parsec-bin
    # GUI for XRandR
    arandr
    # Work apps
    slack
    zoom-us
  ];




}
