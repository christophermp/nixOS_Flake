{ config, pkgs, inputs, lib, ... }:

{

    imports = 
    [

      #programs
      ./modules/programs/git.nix
      ./modules/programs/bash.nix
      ./modules/programs/nixvim.nix

      # Theming
      ./modules/theming/cursor_icons.nix

      # Config
      ./modules/config/hyprland/hyprland_config.nix
      ./modules/config/alacritty/alacritty_config.nix
      ./modules/config/waybar/waybar_config.nix
      #./modules/config/citrix/citrix-conf.nix
      

    ];


    home.username = "christophermp";
    home.homeDirectory = "/home/christophermp";
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
      brave
      spotify
      blender
      firefox
      slurp
      grim
      swappy
      pureref
      pamixer
      vscode
      pkgs.termius
      gh
      neofetch
      pkgs.dotnet-sdk_8
      pkgs.mono5
      pkgs.nodejs_21

     #Work (Testing)
     wpsoffice
     libreoffice-fresh
     planner
     todoist
     projectlibre
     teams-for-linux
    ];

    # Manage dotfiles
    home.file = {
      #".config/hyprland/hyprland.conf".source = ./hyprland.conf;
    };

    # Manage Environment variables
    home.sessionVariables = {
      Editor = "vim";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

     nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";
	};

}
