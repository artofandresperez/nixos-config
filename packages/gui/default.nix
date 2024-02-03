

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
    obs-studio
    # x2goclient # need to firgure this out at some point
    wezterm
    #browsers
    vieb

  ];

  # services.x2goserver.enable = true; # same goes for this




}
