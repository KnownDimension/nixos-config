# hyprland

{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
#    systemd = {
#      enable = true;
#      variables = ["--all"];
#    };
    xwayland.enable = true;
    package = null;
    portalPackage = null;
  };

  home.packages = with pkgs;[
    waylock
    swayidle
    #cava
    pkgs.mako
    hyprlock
    mpvpaper
    swww
    waypaper
    hypridle
    nwg-displays
    pngquant
  ];
  home.file = {
    "/home/unknowndimension/.config/hypr/keybinds.conf".source = pkgs.lib.mkForce ./keybinds.conf;
    "/home/unknowndimension/.config/hypr/hyprland.conf".source = pkgs.lib.mkForce ./hyprland.conf;
    "/home/unknowndimension/.config/hypr/autostart.conf".source = pkgs.lib.mkForce ./autostart.conf;
    "/home/unknowndimension/.config/hypr/hyprlock.conf".source = pkgs.lib.mkForce ./hyprlock.conf;
    "/home/unknowndimension/.config/hypr/hypridle.conf".source = pkgs.lib.mkForce ./hypridle.conf;
    "/home/unknowndimension/.config/hypr/workspace.conf".source = pkgs.lib.mkForce ./workspace.conf;
  };

}