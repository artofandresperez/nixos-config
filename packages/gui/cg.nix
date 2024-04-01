{config , pkgs , ...}:
{
  imports = [ 
    ./2d.nix
    ./video.nix
    ./cad.nix
  ];

  environment.systemPackages  = with pkgs;[   
    # Open source cg toolset
    blender

  ];


}
