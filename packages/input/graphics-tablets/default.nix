{config , pkgs , ...}:
{

  services.xserver.wacom.enable = true;

  hardware.opentabletdriver.enable = true;

}
