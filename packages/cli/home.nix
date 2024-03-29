{config , lib , pkgs , ...}:
{



  home.file."./.config/btop/btop.conf" = {
    source  = ../../dotfiles/btop.conf; 
  };

}
