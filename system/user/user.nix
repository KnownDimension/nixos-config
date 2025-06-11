# user

{ config, pkgs, ... }:

{
  sops.secrets.userpassword.neededForUsers = true;

  sops.secrets."userpassword" = {};


# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.unknowndimension = {
    isNormalUser = true;
    description = "unknown_dimension";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "audio" "openrazer" "corectrl" ];
    hashedPasswordFile = config.sops.secrets."userpassword".path;
  };
  users.mutableUsers = false;
}