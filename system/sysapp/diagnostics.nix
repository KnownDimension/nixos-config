


{ config, lib, pkgs, modulesPath, ... }:

{
    environment.systemPackages = with pkgs; [
        pciutils
        pkgs.udiskie
        pkgs.htop
        pkgs.nvtopPackages.amd
        tldr
        unzip
        wget
        powertop
        brightnessctl
        pkgs.ddcui
        pkgs.ddcutil
        btop-rocm
        busybox
        zstd
        sops
        iw
        lshw
        libisoburn
        zip
        p7zip
        libgpod
        openssl
        wev
        ckbcomp
    ];
    programs.light.enable = true;
}