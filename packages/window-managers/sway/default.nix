{config,pkgs,...}:

let





in{
  imports = [];


  environment.systemPackages = with pkgs;[
    dbus
    wayland
    grim
    slurp
    wl-clipboard
    mako
    wdisplays
    xdg-utils 
    rofi-wayland
    libnotify
    wlr-randr
    bemenu
    xdg-desktop-portal-wlr
    ];


  security.polkit.enable = true;


  environment.variables = {
    XDG_CURRENT_DESKTOP = "sway";

  };
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    } ;
  };

  # enable sway window manager
  programs.sway = {
    wrapperFeatures.gtk = true;
  };
}

