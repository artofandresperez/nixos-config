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
    tofi
    xdg-utils 
    dwl


  ];
  nixpkgs.overlays = [ ( final: prev: { dwl = prev.dwl.overrideAttrs { 
    patches = [ ]; 
    configFile = ./config.h;
  }; }) ];


}
