{ config, pkgs, inputs, ... }:

{

home.packages = [
    pkgs.unityhub
  #  pkgs.dotnet-sdk
  #  pkgs.dotnet-runtime
  #  pkgs.dotnet-aspnetcore
    pkgs.jetbrains-toolbox
    pkgs.cpio
    pkgs.alcom
    (import ./unitylaunch.nix {inherit pkgs; })
   ];

  # imports = [
  #  ./unitylaunch.nix
  #];

}