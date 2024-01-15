{config , pkgs , ...}:
{

  # AUDIO
  services.blueman.enable = true;

  # Enable Bluetooth

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;




}
