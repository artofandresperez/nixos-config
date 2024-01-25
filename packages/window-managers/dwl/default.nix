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
    wlr-randr



  ];
  
 	  nixpkgs.overlays = [
	    (
	      final: prev:
	        {
	          dwl = prev.dwl.override { 
              conf = ./config.h; 
              #src = ./dwl-scr;

              };
	        }
	    )
	  ];


}
