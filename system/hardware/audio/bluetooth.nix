{ config, pkgs, lib, ... }:

{

  imports =
    [ 
      ./xpad.nix
    ];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        JustWorksRepairing = "always";
        FastConnectable = lib.mkForce "true";
        Privacy = "device";
        Class = "0x000100";
      };
      Policy = {
        AutoEnable = true;
      };
    };

    package = pkgs.bluez-experimental;

  };
    


  services.blueman.enable = true;

}