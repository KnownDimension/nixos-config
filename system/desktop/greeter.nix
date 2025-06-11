{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --asterisks --greeting 'helo' --cmd Hyprland";
        user = "greeter";
      };
    };
  };





}