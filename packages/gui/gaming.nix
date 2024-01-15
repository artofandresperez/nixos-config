{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
  ];


  # Setup Steam
  programs.steam = {
    enable = true;

  };


}
