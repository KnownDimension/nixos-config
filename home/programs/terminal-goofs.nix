
{ config, pkgs, inputs, ... }:

{

# terminal randomness, some for funnies, some actually useful

home.packages = [
    pkgs.cmatrix
    pkgs.cbonsai
    pkgs.neofetch
    pkgs.pfetch
    pkgs.atuin
    pkgs.dust
    pkgs.lynx
    pkgs.btop
    pkgs.fastfetch

   ];

}