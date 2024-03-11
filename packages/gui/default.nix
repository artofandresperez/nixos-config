
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
    # x2goclient # need to firgure this out at some point
    # password manager
    _1password-gui
    #chrome
    google-chrome
    # pdf
    okular
    # Email
    thunderbird
    # wireshark
    wireshark

  ];

  # services.x2goserver.enable = true; # same goes for this





}
