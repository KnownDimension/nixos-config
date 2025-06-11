{ config, inputs, pkgs, ... }:

{

  imports = [
      inputs.sops-nix.nixosModules.sops
  ];

   sops = { 
    defaultSopsFile = ./secrets/plain-secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/unknowndimension/.config/sops/age/keys.txt";
   };



}