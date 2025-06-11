{ config, pkgs, inputs, ... }:

{
  #qt
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;


  #gtk
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.nordzy-cursor-theme;
  gtk.cursorTheme.name = "Nordzy-cursors";
  
  #gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";
 
  gtk.iconTheme.package = pkgs.nordzy-icon-theme;
  gtk.iconTheme.name = "Nordzy-dark";

}