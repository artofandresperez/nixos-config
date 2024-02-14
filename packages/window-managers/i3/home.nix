{config , lib , pkgs , ...}:

let 
mod = "Mod4";
scripts = "~/.config/i3blocks/scripts";

in 
{

  imports = [
    ../xorg/home.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      
      modifier = "Mod4";
      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec dmenu_run";
        "Mod4+Return" = "exec alacritty";
	      "Mod4+Shift+P" = "exec flameshot gui";
        "Mod4+Shift+S" = "exec firefox";
        "Mod4+Shift+O" = "sticky toggle";
        /*
        "XF86AudioRaiseVolume" = "exec 'pamixer -i 5'";
        "XF86AudioLowerVolume" = "exec amixer -d 5";
        "XF86MonBrightnessDown" = "exec brightnessctl set - 50";
        "XF86MonBrightnessUp" = "exec brightnessctl set + 50";
        "Mod4+XF86MonBrightnessDown" = "exec xrandr --output eDP-1 --set CTM 1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0";
        "Mod4+XF86MonBrightnessUp" = "exec CTM: 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1";
        "Shift+Mod4+minus" = "exec brightnessctl set 0";
        "Shift+Mod4+plus" = "exec brightnessctl set 800";
        */
      };
      bars =  [
        {
          statusCommand = "i3blocks";
          colors = {
            focusedWorkspace  = {
              background = "#8a8a8a";
              border = "#262626";
              text = "#262626";

            };

          };
          fonts = {
            names = ["JetBrainsMono-NF-Regular"];
            style = "Regular";
          };

        }
      
      ];


    };

    extraConfig = "
      default_border pixel 1 \n
      default_floating_border pixel 1 \n
    ";

  };

  programs.i3blocks = {

    enable = true;
    bars = {
      config = {
        TIME  = {
          interval = "60";
          command  = "date \"+%r\"";
        };
      };
  };

  };

  home.file."./.config/i3blocks/scripts" = {
    source  = ../../../dotfiles/i3blocks-scripts;
    recursive = true;
  };


}
