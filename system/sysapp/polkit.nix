# polkit maybe



{ config, lib, pkgs, modulesPath, ... }:

{

#  systemd = {
#    user.services.polkit-kde-authentication-agent-1 = {
#      description = "polkit-kde-authentication-agent-1";
#      wantedBy = [ "graphical-session.target" ];
#      wants = [ "graphical-session.target" ];
#      after = [ "graphical-session.target" ];
#      serviceConfig = {
#          Type = "simple";
#          ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
#          Restart = "on-failure";
#         RestartSec = 1;
#         TimeoutStopSec = 10;
#        };
#    };
#  };


  environment.systemPackages = with pkgs; [
    (import ./polkitstart.nix { inherit pkgs; })
    libsForQt5.polkit-kde-agent
    lxqt.lxqt-policykit
  ];

}