 # has qmk and xkb config
{ config, pkgs, ... }:

{
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [ via ];
  services.udev.packages = with pkgs; [ via ];

  services.xserver.xkb = { 
    extraLayouts.dvorak-alt-60 = {
      description = "dvorak modded to suit my nonstandard 60% layout";
      languages = [ "eng" ];
      symbolsFile = ./us;
    };

    layout = "us";
    variant = "dvorak-alt-60";
  };


}