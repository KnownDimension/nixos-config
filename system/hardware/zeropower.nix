# power management for zerotwo

{ config, lib, pkgs, modulesPath, ... }:
{
    services.thermald.enable = true;
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
    battery = {
        governor = "powersave";
        turbo = "never";
    };
    charger = {
        governor = "performance";
        turbo = "auto";
    };
  };
}