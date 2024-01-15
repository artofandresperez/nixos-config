{config, pkgs , ...}:
{
  imports = 
  [
    ../../packages/cli/default.nix
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };


  # FONTS

  fonts.packages = with pkgs; [
  (nerdfonts.override {fonts = ["JetBrainsMono"];})

  ];

  # ENV Vars
  
  environment.variables = {
    EDITOR = "nvim";

  };
 
  #enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # setup NUR
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball {
        url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
        sha256 = "0w5vvx765q746lyyy44xbyd1jqabk1aqfaq8pvf9h8k7f712yf87"   ;

    }){
    inherit pkgs;
    };

  };



  # Define a user account. 
  users.users.amoeba = {
    isNormalUser = true;
    description = "amoeba";
    extraGroups = [ "networkmanager" "wheel" "audio" "libvirtd" "tss"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
