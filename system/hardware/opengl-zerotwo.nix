{ config, lib, pkgs, modulesPath, ... }:

{
  # zerotwo opengl

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs; [
      pkgsi686Linux.vaapiIntel
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.enable = true;

}