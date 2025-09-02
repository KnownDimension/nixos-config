{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time -r --asterisks --greeting 'helo'";
        user = "greeter";
      };
    };
  };





}