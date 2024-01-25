{config,pkgs,...}:
{
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
    bemenu


  ];



}
