{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    # Open source cg toolset
    blender
    libsForQt5.kdenlive
    krita
    davinci-resolve
    inkscape-with-extensions
    digikam
    darktable
    nomacs
    freecad

  ];


}
