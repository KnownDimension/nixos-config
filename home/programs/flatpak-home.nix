{ config, pkgs, inputs, ... }:

{


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



  ];


};


}