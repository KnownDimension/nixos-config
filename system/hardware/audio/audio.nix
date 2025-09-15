# audio related stuffs

{ config, lib, pkgs, modulesPath, ... }:

{

  imports =
    [ 
 #     ./pulselatency.nix
    ];



# Enable sound with pipewire.
 # sound.enable = true;
  services.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    extraConfig.pipewire."92-low-latency" = {
        context.properties = {
          default.clock.rate = 48000;
          default.clock.quantum = 32;
          default.clock.min-quantum = 32;
          default.clock.max-quantum = 32;
        };
    };





    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

#  environment.etc = {
#    "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
#      context.properties = {
#        default.clock.rate = 48000
#        default.clock.quantum = 32
#        default.clock.min-quantum = 32
#        default.clock.max-quantum = 32
#      }
#    '';
#  };  

  environment.systemPackages = with pkgs; [
    pavucontrol
    pamixer
    portaudio
    python312Packages.pyaudio
#    python311Packages.pyaudio
    qpwgraph
    qjackctl

  ];

}