{ config, pkgs, ... }:

{

  hardware.xone.enable = true;
#  hardware.enableAllFirmware = true;
 # boot = {
  #  kernelModules = [ "hid_xpadneo" ];
  #  extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];
  #  extraModprobeConfig = '' options bluetooth disable_ertm=y '';
 # };
  
  

}