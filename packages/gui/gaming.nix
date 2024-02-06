{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    discord
  ];


  # Setup Steam
  programs.steam = {
    enable = true;

  };


}
