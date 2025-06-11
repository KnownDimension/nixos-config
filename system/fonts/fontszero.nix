# smaller font selection to save storage space while maintaining compatibility with the system

{ config, pkgs, ... }:

{
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        jetbrains-mono
        (nerdfonts.override { fonts = [ "Symbols" ]; })
    ];
}