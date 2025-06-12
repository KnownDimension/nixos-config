{ config, pkgs, ... }:

{

  imports =
    [ 
      ./xpad.nix
    ];
  hardware.bluetooth.enable = true;

  services.blueman.enable = true;

}