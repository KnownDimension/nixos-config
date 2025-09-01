# these are apps that arent inherently nessesary, thus they wont be installed onto zerotwo to save disk space
{ config, pkgs, inputs, ... }:

{



home.packages = [
    pkgs.pixelorama
    pkgs.aseprite
    pkgs.obs-studio
    pkgs.lollypop
    pkgs.kdePackages.falkon
    pkgs.conda
    pkgs.boxbuddy
    pkgs.brave
    pkgs.blender-hip
    pkgs.openseeface
 #   pkgs.wine64
 #   pkgs.gpt4all-cuda
 #   pkgs.local-ai
   # pkgs.ollama-rocm
    pkgs.gifsicle
   ];



}