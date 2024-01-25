{config , lib , pkgs , ...}:
let 

in 
{
  wayland.windowManager.hyprland = {
    enable = true;

    package = pkgs.hyprland;
    enableNvidiaPatches = true;

    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      
      monitor = [
        ",preferred,auto,1"

      ];

      "$mod" = "SUPER";
      bind = [
        "SUPER,d,exec,bemenu-run"
        "SUPER_SHIFT,S,exec,firefox"
        "SUPER,RETURN,exec,alacritty"

      ];
      
      bindm = [
      ];


      

    };

  };
  programs.waybar = {
    enable = true;
    systemd.enable = true;


  };



}
