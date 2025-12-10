

{ config, lib, pkgs, modulesPath, ... }:

{
    
    virtualisation.libvirtd = {
        enable = true;
#        qemu.ovmf.enable = true;
        qemu.runAsRoot = false;
        qemu.vhostUserPackages = [ 
            pkgs.virtiofsd 
        ];
        onBoot = "ignore";
        onShutdown = "shutdown";
        qemu.verbatimConfig = ''
            user = "unknowndimension"
            group = "unknowndimension"
        '';


    };


    environment.systemPackages = with pkgs; [
        virt-manager
 #       virtualbox
        looking-glass-client
        scream
        distrobox
        podman
    ];
     
 #   boot.extraModulePackages = with config.boot.kernelPackages; [ virtualbox ];
    virtualisation.waydroid.enable = true;
    
 #   systemd.tmpfiles.rules = [
 #       "f /dev/shm/scream 0660 unknowndimension qemu-libvirtd -"
  #      "f /dev/shm/looking-glass 0660 unknowndimension qemu-libvirtd -"
  #  ];
    
    systemd.user.services.scream-ivshmem = {
        enable = true;
        description = "Scream IVSHMEM";
        serviceConfig = {
            ExecStart = "${pkgs.scream}/bin/scream-ivshmem-pulse /dev/shm/scream";
            Restart = "always";
        };
        wantedBy = [ "multi-user.target" ];
        requires = [ "pulseaudio.service" ];
    };


    virtualisation.virtualbox.host = {
        enable = true;
        enableExtensionPack = true;
    };
    
    
    users.extraGroups.vboxusers.members = [ "unknowndimension" ];


}