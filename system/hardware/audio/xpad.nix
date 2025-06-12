{ config, pkgs, ... }:

{

  hardware.xpadneo.enable = true;
  hardware.enableAllFirmware = true;
  environment.systemPackages = with pkgs; [
    joystick
  ];


}