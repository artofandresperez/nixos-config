{pkgs, ...}: {
  home.username = "amoeba";
  home.homeDirectory = "/home/amoeba";
  home.stateVersion = "25.11";


  # Qutebrowser Config 


  xdg = {
    mimeApps ={
    enable = true;
    defaultApplications = {
      "text/markdown" = "nvim.desktop";
    };
    };

  };

  programs.qutebrowser = {
    enable = true;
    searchEngines = {
      DEFAULT = "https://kagi.com/search?q={}";
      ai = "https://kagi.com/assistant{}";
      nx = "https://mynixos.com/search?q={}";
    };
  }; 

  # Fuzzel App Launcher

  programs.fuzzel = {
    enable = true;
    settings = {
    colors = {
      background = "282a36dd";
      text = "f8f8f2ff";
      selection-match = "8be9fdff";
      selection = "44475add";
      selection-text = "f8f8f2ff";
      border = "bd93f9ff";
    };
    };

  };
  programs.gh ={
    enable = true;
    gitCredentialHelper.enable = true;

  };



  # Cursor Theme
  gtk.cursorTheme.name = "latteDark";
  home.pointerCursor.name = "latteDark";
  home.pointerCursor.enable = true;
  home.pointerCursor.package = pkgs.catppuccin-cursors.latteDark;
  home.pointerCursor.hyprcursor.enable = true;






}
