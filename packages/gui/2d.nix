{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    # Open source cg toolset
    krita
    inkscape-with-extensions
    digikam
    darktable
    nomacs
  ];


}
