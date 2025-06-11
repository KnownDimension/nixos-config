# waybar

{ pkgs, ... }:
{

programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    systemd = {
      enable = false; # disable it,autostart it in hyprland conf
      target = "graphical-session.target";
    };
  };
  home.file = {
    ".config/waybar/style.css".source = pkgs.lib.mkForce ./style.css;
    ".config/waybar/config".source = pkgs.lib.mkForce ./config;
  };

}