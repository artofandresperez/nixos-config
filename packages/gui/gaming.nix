{config , pkgs , ...}:
{
  imports = [ 

  ];

  environment.systemPackages  = with pkgs;[   
    discord
  ];

programs.steam = {
  enable = true;
  package = pkgs.steam.override {
    extraPkgs = pkgs: [pkgs.steamPackages.steamcmd pkgs.libxcrypt pkgs.libxcrypt-legacy pkgs.krb5 pkgs.xml2 pkgs.python311Packages.libxml2 pkgs.xorg.libxcb pkgs.xorg.libXinerama pkgs.qt5.qtbase];
  };
};

}
