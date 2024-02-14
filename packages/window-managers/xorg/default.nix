{config , pkgs , ...}:
{

  
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    # change this to if "nvidia" then 
    #videoDrivers = ["nvidia"];
    
  };
  

  environment.systemPackages = with pkgs;[
    #xorg clipboard manager
    xclip



  ];
  

}
