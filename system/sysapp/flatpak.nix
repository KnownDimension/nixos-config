#flatpak and xdgportal config


{ config, lib, pkgs, modulesPath, ... }:

{

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  services.flatpak.enable = true;
  xdg.portal.xdgOpenUsePortal = true;

}