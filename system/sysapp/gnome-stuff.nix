

{ config, lib, pkgs, modulesPath, ... }:

{

# keyring and evolution + gnome stuffs
  services.accounts-daemon.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  services.gnome.evolution-data-server.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.gnome-keyring
    pkgs.seahorse
    pkgs.evolution-data-server-gtk4
    pkgs.gnome-disk-utility
  ];


}