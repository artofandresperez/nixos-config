{ config , lib , pkgs, inputs , ...}:
{

  # Home Manager needs a bit of information about you and the paths it should manage.

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/amoeba/etc/profile.d/hm-session-vars.sh
  #





  home.sessionVariables = {
    EDITOR = "nvim";
    DEFAULT_BROWSER = "vieb";
    GIT_EDITOR = "nvim";
  };


  home.username = "amoeba";
  home.homeDirectory = "/home/amoeba";



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

/*

  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

*/


  
  programs.alacritty = {
    enable = true;
    settings = {
      Font = {
        normal = {
          family = "JetBrainsMono";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono";
          style = "Regular";
        };
        italic = {
          family = "JetBrainsMono";
          style = "Regular";
        };
      };
      WINIT_X11_SCALE_FACTOR = "1";
    };

  };


  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerdfonts;
      name = "JetBrainsMono";
      size = 10;
    };
    theme = "Galaxy" ;

  };

  


  programs.neovim = {
    enable = true;
    extraConfig = ":luafile ../../nvim-config/init.lua";


  };
  home.file."./.config/nvim" = {
    source = ../../nvim-config;
    recursive = true;

  };
  home.file."./.vifm" = {
    source = ../../dotfiles/.vifm;
    recursive = true;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };

  };


  programs.tmux = {
    enable = true;
    extraConfig = "
    set -g focus-events on

    ";

  };

  programs.taskwarrior = {
    enable = true;


  };
  programs.watson = {
    enable = true;
  };
  programs.git = {
    enable = true;
    extraConfig = {
      core = {
        editor = "nvim";
      };
    lfs.enable = true;


    };

  };

}
