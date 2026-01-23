{ config, pkgs, ... }:

{

  hardware.xpadneo.enable = true;
#  hardware.enableAllFirmware = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';


}