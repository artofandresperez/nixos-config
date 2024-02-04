

{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    remmina

  ];

  services.xrdp = {
    enable = true;
    defaultWindowManager = "startx";
    openFirewall = true;
    
  };



}
