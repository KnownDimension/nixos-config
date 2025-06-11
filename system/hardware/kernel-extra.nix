# specific for genesis

{ config, lib, pkgs, modulesPath, ... }:

{
    powerManagement.cpuFreqGovernor = "performance";
}