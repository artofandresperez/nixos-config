
{config , lib , pkgs , ...}:

let 
mod = "Mod4";

in 
{


  imports = [
  ];


  services.polybar = {
    enable = true;
    script = "
      polybar bar & \n

    ";
    config = {
      "bar/top" = {
        "bottom" = true;
        font-0 = "JetBrainsMono-Regular:size=8;2";
        modules-right = "date";
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%m/%d/%y";
        time = "%H:%M";
        label = "%time% %date%";


      };

    };

  };

}

