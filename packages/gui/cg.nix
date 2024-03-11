{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    # Open source cg toolset
    blender
    krita
    davinci-resolve
    inkscape-with-extensions
    digikam
    darktable
    nomacs
    freecad
    olive-editor

  ];


}
