{ inputs, config, pkgs, ... }:

# copied from genesis, open gl and hardware will point to kirigiri variants while fonts will be left as genesis

{
  imports =
    [ # Include the results of the hardware scan.
      ../system/desktop/backupxfce.nix
      ../system/desktop/hyprlandrequired.nix
#      ../system/desktop/sddm.nix
      ../system/desktop/stylix.nix
#      ../system/desktop/vr.nix  # disabled as it is outdated, neet to follow linux vr adventures guide later
      ../system/desktop/greeter.nix
      ../system/fonts/fontsgenesis.nix
      ../system/hardware/hardware-kirigiri.nix
      ../system/hardware/opengl-kirigiri.nix
#      ../system/hardware/openrazer.nix  #broken for now
      ../system/hardware/printing.nix
      ../system/hardware/qmk.nix
      ../system/hardware/audio/audio.nix
      ../system/hardware/audio/bluetooth.nix
      ../system/sysapp/cachix.nix
      ../system/sysapp/diagnostics.nix
      ../system/sysapp/flatpak.nix
      ../system/sysapp/gamemode.nix
      ../system/sysapp/garbage.nix
      ../system/sysapp/gnome-stuff.nix
      ../system/sysapp/polkit.nix
      ../system/sysapp/qtsystem.nix
      ../system/sysapp/virtualisation.nix
      ../system/sysapp/steam.nix
      ../system/user/user.nix
      ../system/secret/secretmanagement.nix

      inputs.stylix.nixosModules.stylix


    ];

  # Bootloader.
  boot.loader = {
     systemd-boot.enable = true;
     efi.canTouchEfiVariables = true;
  };

  

  
  # nixos
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org/"
    ];

    http-connections = 50;
    download-buffer-size = 524288000;
    max-jobs = 2;

  };

  



 
  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  
#  services.xserver.xkb = {
#    layout = "us";
#    variant = "";
#  };

  environment.sessionVariables = {
    NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
    NIXOS_OZONE_WL = "1";
    NIXPKGS_ALLOW_UNFREE = "1";
  };
 # nixpkgs.config.allowUnfree = true;
  programs.dconf.enable = true;


  environment.systemPackages = with pkgs; [
    pkgs.home-manager
    pkgs.appimage-run
    pkgs.nix-alien
    pkgs.libxkbcommon
    wireguard-tools

  ];
  system.stateVersion = "23.05";
  time.timeZone = "Europe/London";
  
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];


  programs.nix-ld.enable = true;


  
 # systemd.extraConfig = "DefaultLimitNOFILE=524288";
 # security.pam.loginLimits = [{
 #   domain = "unknown_dimension";
 #   type = "hard";
 #   item = "nofile";
 #   value = "524288";
 # }];

  security.pam.loginLimits = [
    { domain = "unknown_dimension"; item = "nofile"; type = "-"; value = "524288"; }
    { domain = "unknown_dimension"; item = "memlock"; type = "-"; value = "524288"; }
  ];
  


}