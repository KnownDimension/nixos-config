{ inputs, pkgs, ... }:
{
    home.file = {
        ".config/mako/config".source = ./config;
    };


}