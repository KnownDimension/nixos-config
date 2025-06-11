
{ config, lib, pkgs, modulesPath, ... }:

{


programs.envision = {
  enable = true;
  openFirewall = true; # This is set true by default
};

environment.systemPackages = with pkgs; [
  glslang
  gst_all_1.gstreamer
  libdrm
  pkgs.wlx-overlay-s 
  pkgs.stardust-xr-flatland 
  pkgs.stardust-xr-server 
  pkgs.stardust-xr-kiara
  pkgs.xrgears
  pkgs.sidequest
  pkgs.android-tools
];

services.wivrn = {
  enable = true;
  openFirewall = true;

  # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
  # will automatically read this and work with WiVRn (Note: This does not currently
  # apply for games run in Valve's Proton)
  defaultRuntime = true;

  # Run WiVRn as a systemd service on startup
  autoStart = true;

  # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
  config = {
    enable = true;
    json = {
      # 1.0x foveation scaling
      scale = 0.6;
      # 100 Mb/s
      bitrate = 50000000;
      encoders = [
        {
          encoder = "vaapi";
          codec = "h265";
          # 1.0 x 1.0 scaling
          width = 1.0;
          height = 1.0;
          offset_x = 0.0;
          offset_y = 0.0;
        }
        {
          encoder = "vaapi";
          codec = "h265";
          # 1.0 x 1.0 scaling
          width = 1.0;
          height = 1.0;
          offset_x = 0.0;
          offset_y = 0.0;
        }
      ];
    };
  };
};

hardware.opentabletdriver = {
  enable = true;
  daemon.enable = true;
};

#xdg.desktopEntries = {
#    ALVRandSteam = {
#      name = "ALVRandSteam";
#      genericName = "virtual reality";
 #     exec = "flatpak run --command=alvr_launcher com.valvesoftware.Steam";
#      terminal = false;
#      categories = [ "Application" "OpenXR" "VR" ];
#    };
#  };


}