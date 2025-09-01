
{ config, lib, pkgs, modulesPath, ... }:

{

    environment.plasma6.excludePackages = with pkgs.libsForQt5; [
        elisa
        gwenview
        okular
        oxygen
        khelpcenter
        konsole
        plasma-browser-integration
        print-manager
    ];

    environment.systemPackages = with pkgs; [
        pkgs.libsForQt5.qt5.qtquickcontrols
        pkgs.libsForQt5.qt5.qtgraphicaleffects
#        pkgs.libsForQt5.polkit-kde-agent
        kdePackages.ark
    ];


}