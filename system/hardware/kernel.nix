# kernel, mainly optimised for audio even though im not an audio professional, mainly just experimenting
# instead of using the RT kernel and the extra configs as mentioned in https://nixos.wiki/wiki/JACK i used liquorix, this is to
# allow for low latency audio while not going full RT as full RT can potentially negatively affect gaming performance
# and introduce potential problems i dont want to deal with
#
#


{ config, lib, pkgs, modulesPath, ... }:

{

    boot = {
        kernelModules = [ "snd-seq" "snd-rawmidi" "kvm-intel" "i2c-dev" ];
        kernel.sysctl = { "vm.swappiness" = 10; "fs.inotify.max_user_watches" = 524288; };
        kernelParams = [ "pcie_aspm=off" "CONFIG_SCHED_DEBUG=y"
    "CONFIG_LOCK_DEBUGGING=y"
    "CONFIG_DEBUG_KERNEL=y" "threadirq" "CONFIG_NTSYNC=y"];
        kernelPackages = pkgs.linuxPackages_cachyos;
        
        #kernelPackages = pkgs.linuxPackages_6_11;
     #   kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_11.override {
    #      argsOverride = rec {
    #        src = pkgs.fetchurl {

                #owner = "torvalds";
               # repo = "linux";
               # rev = "9c26a1d0a01c941706fd0be55915b4db87bbe7c3";
#                url = "mirror://kernel/linux/kernel/v6.x/linux-${"6.11.11"}.tar.xz";
#                sha256 = "sha256-YhSOfhf1TEpateda1IgmgsVL7oGJSL5hpZYyNPwISfw=";
#            };
#            dontStrip = true;
#            version = "6.11";
#            modDirVersion = "6.11.11";
#            };    
#        });

#        kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_12.override {
#            argsOverride = rec {
#            src = pkgs.fetchurl {
#                    url = "mirror://kernel/linux/kernel/v6.x/linux-${"6.12.3"}.tar.xz";
#                    sha256 = "sha256-yJgJzHd9UPHqSEoRhjAoGiY4Nweg51LJb9g09udl3q4=";
#            };
#            version = "6.12.3";
#            modDirVersion = "6.12.3";
#            };
#        });
        
       # });
        blacklistedKernelModules = [
            "zram"
            "nvidia"
            "nvidiafb"
            "nvidia-drm"
            "nvidia-uvm"
            "nvidia-modeset"
        ];





#       pkgs.linuxPackages_cachyos;
        postBootCommands = ''
            echo 2048 > /sys/class/rtc/rtc0/max_user_freq
            echo 2048 > /proc/sys/dev/hpet/max-user-freq
            setpci -v -d *:* latency_timer=b0
            setpci -v -s $00:1b.0 latency_timer=ff
        '';
        # The SOUND_CARD_PCI_ID can be obtained like so:
        # $ lspci ¦ grep -i audio
    };
   # services.scx = {
   #     enable = true; 
   #     scheduler = "scx_lavd";
  #  };
    security.pam.loginLimits = [
        { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
        { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
        { domain = "@audio"; item = "nofile"; type = "soft"; value = "99999"; }
        { domain = "@audio"; item = "nofile"; type = "hard"; value = "99999"; }
    ];

    services = {
        udev = {
            packages = [ pkgs.ffado ]; # If you have a FireWire audio interface
            extraRules = ''
            KERNEL=="rtc0", GROUP="audio"
            KERNEL=="hpet", GROUP="audio"
        '';
      };
        cron.enable = false;
        scx = {
            enable = true;
            package = pkgs.scx_git.full;
            scheduler = "scx_bpfland";
        };
    };

    environment.shellInit = ''
        export VST_PATH=/nix/var/nix/profiles/default/lib/vst:/var/run/current-system/sw/lib/vst:~/.vst
        export LXVST_PATH=/nix/var/nix/profiles/default/lib/lxvst:/var/run/current-system/sw/lib/lxvst:~/.lxvst
        export LADSPA_PATH=/nix/var/nix/profiles/default/lib/ladspa:/var/run/current-system/sw/lib/ladspa:~/.ladspa
        export LV2_PATH=/nix/var/nix/profiles/default/lib/lv2:/var/run/current-system/sw/lib/lv2:~/.lv2
        export DSSI_PATH=/nix/var/nix/profiles/default/lib/dssi:/var/run/current-system/sw/lib/dssi:~/.dssi
    '';
}