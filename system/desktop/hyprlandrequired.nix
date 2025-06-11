# used as a backup in the event hyprland becomes goofy

{ config, lib, pkgs, modulesPath, ... }:

{
  # "(Required) NixOS Module: enables critical components needed to run Hyprland properly"
  # i honestly think that this is pretty stupid and id much rather have it fully configured in home manager, but i dont make the rules
  programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        withUWSM  = true;
  };


}