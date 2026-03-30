{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time -r --remember-session --asterisks --greeting 'helo'";
        user = "greeter";
      };
    };
  };





}