{config , pkgs , ...}:
{


  environment.systemPackages = with pkgs; [
    # wine stuff 
    lutris
    wine
    winetricks
  ];



}
