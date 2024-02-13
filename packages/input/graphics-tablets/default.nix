{config , pkgs , ...}:
{

  services.xserver.wacom.enable = true;

  #hardware.opentabletdriver.enable = true;
  environment.systemPackages = with pkgs;[
    wacomtablet
    
  ];
}
