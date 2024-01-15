{config , lib , pkgs , ...}:
{

  programs.firefox = {
    enable = true;

  };


  services.flameshot = {
    enable = true;
  };

  home.file."./.config/input-remapper-2" = {
    source  = ../../dotfiles/input-remapper-2; 
    recursive  = true;

  };

}
