# placeholder text

{ config, pkgs, ... }:

{
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        jetbrains-mono
        font-awesome
        material-icons
        material-design-icons
     #   nerdfonts
        nerd-fonts.fira-code
        nerd-fonts.droid-sans-mono
        nerd-fonts.jetbrains-mono
        nerd-fonts.symbols-only

    ];
}