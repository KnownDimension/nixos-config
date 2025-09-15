# rofi

{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
  };
  home.file = {
    ".config/rofi/launcher.sh".source = ./launcher.sh;
    ".config/rofi/nord.rasi".source = ./nord.rasi;
    ".config/rofi/poweroff.sh".source = ./poweroff.sh;
    ".config/rofi/nord2.rasi".source = ./nord2.rasi;
  };




  
}