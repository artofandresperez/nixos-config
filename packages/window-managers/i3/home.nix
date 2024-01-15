{config , lib , pkgs , ...}:

let 
mod = "Mod4";

in 
{


  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec dmenu_run";
        "Mod4+Return" = "exec alacritty";
	"Mod4+Shift+P" = "exec flameshot gui";
        "Mod4+Shift+S" = "exec firefox";


      };

    };

  };


}
