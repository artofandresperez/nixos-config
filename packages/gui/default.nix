
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
    # password manager
    _1password-gui
    #chrome
    google-chrome
    # Project libre
    projectlibre
    # project manager cli
    taskjuggler
    # vieb
    vieb
    # download manager
    varia

  ];


}
