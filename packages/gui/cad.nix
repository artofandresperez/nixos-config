{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    # Open source cg toolset
    freecad
    plasticity
  ];


}
