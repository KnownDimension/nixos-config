# sddm config

{ config, lib, pkgs, modulesPath, ... }:

{
  services = {
    displayManager = {
      sddm.enable = true;
      sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
  };
}

#{
#  services.xserver = {
#    displayManager = {
#      gdm.enable = true;
#    };
#  };
#}