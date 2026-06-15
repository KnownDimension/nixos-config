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
#    "org.prismlauncher.PrismLauncher"
    "net.lutris.Lutris"
#    "net.rpcs3.RPCS3"
    "com.usebottles.bottles"
    "org.chromium.Chromium"
    "com.github.tchx84.Flatseal"
    "one.ablaze.floorp"



  ];


};

xdg.systemDirs.data = [
  "/var/lib/flatpak/exports/share"
  "$HOME/.local/share/flatpak/exports/share"
];




}