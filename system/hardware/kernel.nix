{ config, lib, pkgs, modulesPath, ... }:

{

    boot = {
        kernelModules = [ "snd-seq" "snd-rawmidi" "kvm-intel" "i2c-dev" ];
        kernel.sysctl = { "vm.swappiness" = 10; "fs.inotify.max_user_watches" = 524288; };
        kernelParams = [ "pcie_aspm=off" "CONFIG_SCHED_DEBUG=y"
    "CONFIG_LOCK_DEBUGGING=y"
    "CONFIG_DEBUG_KERNEL=y" "threadirq" "CONFIG_NTSYNC=y"]; # "CONFIG_NTSYNC=y"
        kernelPackages = pkgs.linuxPackages_latest;

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

            
        # disable_11ax=1 11n_disable=1
        extraModprobeConfig = ''
            options iwlwifi power_save=0 uapsd_disable=1


        '';


        blacklistedKernelModules = [
            "zram"
            "nvidia"
            "nvidiafb"
            "nvidia-drm"
            "nvidia-uvm"
            "nvidia-modeset"
            "xpad"
        ];





        postBootCommands = ''
            echo 2048 > /sys/class/rtc/rtc0/max_user_freq
            echo 2048 > /proc/sys/dev/hpet/max-user-freq
            setpci -v -d *:* latency_timer=b0
            setpci -v -s $00:1b.0 latency_timer=ff
        '';
        # The SOUND_CARD_PCI_ID can be obtained like so:
        # $ lspci ¦ grep -i audio
    };

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
#        scx = {
#            enable = true;
#            package = pkgs.scx_git.full;
#            scheduler = "scx_bpfland";
#        };
    };

    environment.shellInit = ''
        export VST_PATH=/nix/var/nix/profiles/default/lib/vst:/var/run/current-system/sw/lib/vst:~/.vst
        export LXVST_PATH=/nix/var/nix/profiles/default/lib/lxvst:/var/run/current-system/sw/lib/lxvst:~/.lxvst
        export LADSPA_PATH=/nix/var/nix/profiles/default/lib/ladspa:/var/run/current-system/sw/lib/ladspa:~/.ladspa
        export LV2_PATH=/nix/var/nix/profiles/default/lib/lv2:/var/run/current-system/sw/lib/lv2:~/.lv2
        export DSSI_PATH=/nix/var/nix/profiles/default/lib/dssi:/var/run/current-system/sw/lib/dssi:~/.dssi
    '';
}