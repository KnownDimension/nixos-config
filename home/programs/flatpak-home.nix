{ config, pkgs, inputs, ... }:

{
services.flatpak.enable = true;

services.flatpak = {
  update = {
    onActivation = true;
    auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };


  packages = [
    "org.vinegarhq.Sober"
    "org.prismlauncher.PrismLauncher"
    "net.lutris.Lutris"



  ];


};


}