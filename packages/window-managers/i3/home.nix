{config , lib , pkgs , ...}:

let 
mod = "Mod4";
scripts = "~/.config/i3blocks/scripts";
left = "h";
down = "j";
up = "k";
right = "l";
resizeAmount = "30px";

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
        "${mod}+d" = "exec dmenu_run -nb '#222222' -sf '#eeeeee' -sb '#6d6d6d' -nf '#bbbbbb'";
        "Mod4+Return" = "exec kitty";
	      "Mod4+Shift+P" = "exec flameshot gui";
        "Mod4+Shift+S" = "exec firefox";
        "Mod4+Shift+O" = "sticky toggle";
        ## Move your focus around
        "${mod}+${left}" = "focus left";
        "${mod}+${down}" = "focus down";
        "${mod}+${up}" = "focus up";
        "${mod}+${right}" = "focus right";
        ## Move the focused window with the same, but add Shift
        "${mod}+Shift+${left}" = "focus left";
        "${mod}+Shift+${down}" = "focus down";
        "${mod}+Shift+${up}" = "focus up";
        "${mod}+Shift+${right}" = "focus right";

        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        ## Switch the current container between different layout styles
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        ## Make the current focus fullscreen
        "${mod}+f" = "fullscreen";
        ## Toggle the current focus between tiling and floating mode
        "${mod}+Shift+space" = "floating toggle";
        ## Swap focus between the tiling area and the floating area
        "${mod}+space" = "focus mode_toggle";
        ## Move focus to the parent container
        "${mod}+a" = "focus parent";
        # Scratchpad
        ## Sway has a "scratchpad", which is a bag of holding for windows. You can send windows there and get them back later.
        ## Move the currently focused window to the scratchpad
        "${mod}+Shift+minus" = "move scratchpad";
        ## Show the next scratchpad window or hide the focused scratchpad window. If there are multiple scratchpad windows, this command cycles through them.
        "${mod}+minus" = "scratchpad show";
        # Resizing containers
        # Mode "resize"
        #"${mod}+r" = "mode 'resize'";

      };
      modes = {
        resize = {
          # left will shrink the containers width
          # right will grow the containers width
          # up will shrink the containers height
          # down will grow the containers height
          "${mod}+${left}" = "resize shrink width ${resizeAmount}";
          "${mod}+${down}" = "resize grow height ${resizeAmount}";
          "${mod}+${up}" = "resize shrink height ${resizeAmount}";
          "${mod}+${right}" = "resize grow width ${resizeAmount}";
          ## With arrow keys
          "${mod}+Left" = "resize shrink width ${resizeAmount}";
          "${mod}+Down" = "resize grow height ${resizeAmount}";
          "${mod}+Up" = "resize shrink height ${resizeAmount}";
          "${mod}+Right" = "resize grow width ${resizeAmount}";
          # Return to default mode
          "Return" = "mode default";
          "Escape" = "mode default";
        };
      };

      colors = {
        focused = {
              background = "#8a8a8a";
              border = "#262626";
              text = "#262626";
              indicator = "#8a8a8a";
              childBorder = "#8a8a8a";



        };

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
        DATE  = {
          interval = "24H";
          command  = "date \"+%D\"";
        };
        GREYSCALE = {
          full_text = "";
          command = "xrandr --output DP-1 --set CTM \"1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0,1431655765,0\"";
        };
        NORMAL-COLOR = {
          full_text = "";
          command = "xrandr --output DP-1 --set CTM '0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1'";
        };
        /*
        BATTERY = {
          interval = "60";
          command = "python ${scripts}/battery.py";
        };
        */
        BRIGHTNESS = {
          full_text = "BRIGHT";
          command = "python ${scripts}/bright-down.py";

        };
      };
  };

  };




  home.file."./.config/i3blocks/scripts" = {
    source  = ../../../dotfiles/i3blocks-scripts;
    recursive = true;
  };


}
