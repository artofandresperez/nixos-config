

{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    nomachine-client

  ];

  # services.x2goserver.enable = true; # same goes for this




}
