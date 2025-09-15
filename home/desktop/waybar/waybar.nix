# waybar

{ pkgs, ... }:
{


# nixpkgs.overlays = [(import ./spdlog-patched.nix)];

programs.waybar = {
    enable = true;
    package = pkgs.waybar;
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