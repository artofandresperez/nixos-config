{config , lib , pkgs , ...}:
{

  programs.firefox = {
    enable = true;

  };



  home.file."./.config/input-remapper-2" = {
    source  = ../../dotfiles/input-remapper-2; 
    recursive  = true;

  };
  home.file."./.config/Vieb/viebrc" = {
    source  = ../../dotfiles/viebrc; 
  };

}
