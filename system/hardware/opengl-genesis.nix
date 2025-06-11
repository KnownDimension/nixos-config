{ config, lib, pkgs, modulesPath, ... }:

{
  # genesis opengl

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      rocmPackages.clr.icd
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
      pkgsi686Linux.vaapiIntel
    ];
    #driSupport = true;
    #driSupport32Bit = true;
    enable32Bit = true; 
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  chaotic.mesa-git.enable = true;

  hardware.amdgpu = {
    overdrive = {
      enable = true;
      ppfeaturemask = "0xffffffff";
    };
  };

  environment = {
    variables = {
    # VAAPI and VDPAU config for accelerated video.
    # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
#    "VDPAU_DRIVER" = "radeonsi";
#    "LIBVA_DRIVER_NAME" = "radeonsi";
    };
    systemPackages = with pkgs; [
      ffmpeg-full
    ];
  };


}