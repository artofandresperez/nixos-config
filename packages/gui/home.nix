{config , lib , pkgs , ...}:
{

  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "layout.css.devPixelsPerPx" = .8;
        "full-screen-api.ignore-widgets" = true;
        "Default zoom" = 200;
        "full-screen-api.warning.timeout" = 0;
        "ull-screen-api.transition.timeout" = 0;
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


  services.screen-locker = {
    enable = true;
    inactiveInterval = 1;
    lockCmd = "\${pkgs.i3lock}/bin/i3lock -n -c 000000";

  };

}
