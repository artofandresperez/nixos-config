{config , pkgs , ...}:
{
  imports = [ 
    ./2d.nix
    ./video.nix

  ];

  environment.systemPackages  = with pkgs;[   
    # Open source cg toolset
    blender
    freecad

  ];


}
