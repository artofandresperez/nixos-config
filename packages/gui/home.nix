{config , lib , pkgs , ...}:
{

  programs.firefox = {
    enable = true;

  };


  services.flameshot = {
    enable = true;
  };

}
