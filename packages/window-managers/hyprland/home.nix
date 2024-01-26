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
        "$mod,d,exec,rofi -show run"
        "$mod_SHIFT,S,exec,firefox"
        "$mod,RETURN,exec,alacritty"
        "$mod_SHIFT,Q,killactive"


        "$mod_SHIFT,P, exec,  grim -g \"$(slurp -d)\" - | wl-copy"
        "$mod,Z,exec,makoctl dismiss -a"


          #setup workspaces

        "$mod,1,workspace,1"
        "$mod,2,workspace,2"
        "$mod,3,workspace,3"
        "$mod,4,workspace,4"
        "$mod,5,workspace,5"
        "$mod,6,workspace,6"
        "$mod,7,workspace,7"
        "$mod,8,workspace,8"
        "$mod,9,workspace,9"
        "$mod,0,workspace,0"
        

        "$mod_SHIFT,1,movetoworkspace,1"
        "$mod_SHIFT,2,movetoworkspace,2"
        "$mod_SHIFT,3,movetoworkspace,3"
        "$mod_SHIFT,4,movetoworkspace,4"
        "$mod_SHIFT,5,movetoworkspace,5"
        "$mod_SHIFT,6,movetoworkspace,6"
        "$mod_SHIFT,7,movetoworkspace,7"
        "$mod_SHIFT,8,movetoworkspace,8"
        "$mod_SHIFT,9,movetoworkspace,9"
        "$mod_SHIFT,0,movetoworkspace,0"
      ];
      
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      "animation" = "global,0";


      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
      };

      misc = {
        force_default_wallpaper = 0;
      };


      

    };

  };


  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.file."./.config/waybar" = {
    source = ../../../dotfiles/waybar;
  };



}
