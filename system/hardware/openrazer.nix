# for the razer viper used in genesis


{ config, lib, pkgs, modulesPath, ... }:

{
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
}