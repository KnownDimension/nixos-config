{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "unknowndimension";
  home.homeDirectory = "/home/unknowndimension";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
 # home.packages = [

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
 # ];

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
  imports = [
    ./programs/communication.nix
    ./programs/essentials.nix
    ./programs/extraapps.nix
    ./programs/files.nix
    ./programs/firefox.nix
    ./programs/gaming.nix
    ./programs/terminal-goofs.nix
    ./programs/vscode.nix
    ./programs/work.nix
  #  ./programs/unity.nix not in use rn
  #  ./programs/ollama.nix
    ./programs/git.nix
    ./desktop/gtkandqt.nix
    ./desktop/waylandpackages.nix
    ./desktop/hyprland/hyprland.nix
    ./desktop/mako/mako.nix
    ./desktop/rofi/rofi.nix
    ./desktop/waybar/waybar.nix
    
    
   # ./desktop/stylix/stylixmove.nix
    ./desktop/stylix/stylix.nix
  ];

  home.sessionVariables = {
    EDITOR = "nano";
  };

  
}
