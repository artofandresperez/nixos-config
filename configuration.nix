#this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
#af

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;



  #boot 

  networking.hostName = "amoeba-laptop-01"; # Define your hostname.
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
 
  # AUDIO

  #sound.enable = true;
  #hardware.pulseaudio.enable = true;
  #hardware.pulseaudio.support32Bit = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.blueman.enable = true;

  #enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];


  # Enable Bluetooth

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;




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
  nixpkgs.config.nvidia.acceptLicense = true;

  #set up virtualisation


  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;


# Fix electron dependecy for Balena Etcher
 nixpkgs.config.permittedInsecurePackages = [
  "electron-19.1.9"
 ];




  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # CLI browser
    lynx
    # its dmenu
    dmenu
    # messaging client 
    telegram-desktop
    # Information about hardware config
    lshw
    # audio controll cli
    pulsemixer
    # File Browser
    vifm
    # GPU system process monitor
    nvtop
    # Open source cg toolset
    blender
    # Virtual Desktop
    parsec-bin
    # GUI for XRandR
    arandr
    # GPU things
    cudatoolkit
    linuxPackages.nvidia_x11
    libGLU
    libGL
    # wine stuff 
    lutris
    wine
    winetricks
    # virtualisation software
    qemu
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
    virtiofsd
    # Work apps
    slack
    zoom-us
    # control display Brightness
    brightnessctl
    # Grep stuff
    ripgrep
    # email client
    mutt
    # its cmake
    cmake
    # clion Cpp ide
    pkgs.jetbrains.clion
    # Calculator
    kalker
    # video player
    mpv
    # file usage manager
    du-dust
    # file difference viewer
    diff-so-fancy
    # time tracking
    fdupes
    # file transfer cli
    croc 
    # email client
    mutt
    # Journaling Cli
    jrnl
    # Cli benchmarking tool
    hyperfine
    # accounting 
    hledger
    # bookmarks manager
    buku
    # System Monitor 
    btop
    # fuzzy finder
    fzf
    #downloads 
    wget
    #github
    gh
    #markdown render
    glow
  ];

  # Setup Steam

  programs.steam = {
    enable = true;

  };

 
 # Graphics Tablet Setup

  services.xserver = {
    enable = true;
    exportConfiguration = true;

    desktopManager = {
      xterm.enable = false;
    };
    displayManager ={
      startx.enable = true;

    };
    videoDrivers = ["nvidia"];
    
    wacom.enable = true;
  };
  hardware.opentabletdriver.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with  pkgs; [
    	intel-media-driver
      vaapiIntel
	    vaapiVdpau
	    libvdpau-va-gl

    ];

  };


  # Nvidia Setup

  
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;

      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
