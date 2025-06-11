{ config, pkgs, inputs, ... }:

{

home.packages = [
    pkgs.bc
    pkgs.gimp
   # pkgs.git
   # pkgs.git-lfs
    pkgs.imagemagick
    pkgs.nix-prefetch-git
    pkgs.python3
    pkgs.cosmic-files
#    pkgs.olive-editor // currently has build error
    pkgs.gnupg
    pkgs.gradience
    pkgs.rclone
    pkgs.feh
    pkgs.deja-dup
    pkgs.mpv
    pkgs.kitty
    pkgs.jdk17
    pkgs.syncthingtray
    pkgs.vial
    pkgs.audacity
    pkgs.localsend
    pkgs.anytype
#    pkgs.firefox-devedition
   ];

}