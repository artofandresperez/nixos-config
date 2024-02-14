{config , lib , pkgs , ...}:
{

  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "layout.css.devPixelsPerPx" = .8;
        "full-screen-api.ignore-widgets" = true;
        "Default zoom" = 200;
      };
      
      

    };


  };



  home.file."./.config/input-remapper-2" = {
    source  = ../../dotfiles/input-remapper-2; 
    recursive  = true;

  };
  home.file."./.config/Vieb/viebrc" = {
    source  = ../../dotfiles/viebrc; 
  };


  programs.obs-studio = {
    enable = true;
    plugins = [

    ];

  };

}
