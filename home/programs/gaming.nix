# launchers will be installed via flathub, that said, there are some nix packages useful for gaming ( + osu )

{ config, pkgs, inputs, ... }:

{



home.packages = with pkgs; [
    pkgs.protonup-qt
    pkgs.wineWowPackages.stagingFull
    pkgs.osu-lazer-bin
    pkgs.rpcs3
   # pkgs.mame
   # (retroarch.override {
   #   cores = with libretro; [
   #     genesis-plus-gx
   #     snes9x
   #     beetle-psx-hw
   #   ];
   # })

   ];

}