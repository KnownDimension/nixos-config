#garbage collection

{ config, pkgs, ... }:

{

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
    };

}