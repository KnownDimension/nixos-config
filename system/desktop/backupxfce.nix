# used as a backup in the event hyprland becomes goofy

{ config, lib, pkgs, modulesPath, ... }:

{
  services.xserver.desktopManager.xfce.enable = true; 

  environment.systemPackages = with pkgs; [   
    pkgs.xfce.xfce4-panel-profiles
    xfce.xfce4-volumed-pulse
    dunst
    pkgs.libnotify
  ];

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];


}