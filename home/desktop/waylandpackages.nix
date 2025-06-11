
{ config, pkgs, inputs, ... }:

{


    home.packages = with pkgs;[
        playerctl
        pkgs.grim
        pkgs.slurp
        pkgs.swappy
        pkgs.wl-clipboard
        pkgs.cliphist
        pkgs.swaybg
    ];

}