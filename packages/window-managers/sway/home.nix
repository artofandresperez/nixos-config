{config , lib , pkgs , ...}:
let 
  mod= "Mod4";
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  resizeAmount = "30px";

in 
{

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
      ];
      keybindings = lib.mkDefault {
        "${mod}+Return" = "exec alacritty";
        "${mod}+Shift+q" = "kill";
        "${mod}+d" = "exec bemenu-run";
        "${mod}+Shift+s" = "exec vieb";


        "${mod}+Shift+p" = "exec grim -g \"$(slurp -d)\" - | wl-copy";
        "${mod}+z" = "exec makoctl dismiss -a";



        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        ## Move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

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
        "${mod}+r" = "mode 'resize'";

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
          "Return" = "mode 'default'";
          "Escape" = "mode 'default'";
        };

 };

};
};
}
