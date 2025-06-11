{ config, lib, pkgs, modulesPath, ... }:

{
  stylix = {
    enable = true;
    image = ./22.png;
    autoEnable=true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
   # targets = {
    #  console.enable = false;

   # };

  };

  environment.systemPackages = [
    pkgs.base16-schemes
  ];
}