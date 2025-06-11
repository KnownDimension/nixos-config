
{ config, inputs, pkgs, ... }:

{

home.file = {
        "nixos-system/system/desktop/stylix.nix".source = pkgs.lib.mkForce ./stylix.nix;
        "nixos-system/system/desktop/22.png".source = pkgs.lib.mkForce ./22.png;
    };
}