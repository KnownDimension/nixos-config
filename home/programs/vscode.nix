# vscode configuration (say hi)

{ config, pkgs, inputs, lib, modulesPath, ... }:

{

    programs.vscode = {
        enable = true;
        mutableExtensionsDir = false;
        package = pkgs.vscodium;
        profiles = {
            default = {
                extensions = with pkgs.vscode-extensions; [
                    arcticicestudio.nord-visual-studio-code
                    yzhang.markdown-all-in-one
                    ms-python.python
                    firefox-devtools.vscode-firefox-debug
                    esbenp.prettier-vscode
                    pkief.material-icon-theme
                    svelte.svelte-vscode
                    formulahendry.auto-close-tag
                    dbaeumer.vscode-eslint
                    ritwickdey.liveserver
                    jnoortheen.nix-ide
                    arrterian.nix-env-selector
                    rust-lang.rust-analyzer
                    mkhl.direnv
                    ms-dotnettools.csharp
                    ms-dotnettools.vscodeintellicode-csharp
                    ms-dotnettools.vscode-dotnet-runtime
                ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                    {
                        name = "vstuc";
                        publisher = "visualstudiotoolsforunity";
                        version = "1.0.5";
                        sha256 = "sha256-7v/f9oo+zjQ3EaVhYfswhy3Sqw3U+v53o50SvMRngFc=";
                    }
                ];
            };
        };
    };

   # home.sessionVariables.PATH = lib.mkAfter [
   #     "${pkgs.vscode}/bin"  # Make sure the actual path is correct
   # ];

    #home.sessionVariables.PATH = "${pkgs.vscode}/bin:${config.home.sessionVariables.PATH}";
    #home.sessionVariables.PATH = lib.mkForce "${pkgs.vscode}/bin:${config.home.sessionVariables.PATH}";
    #home.sessionVariables.PATH = "${pkgs.vscode}/bin:${lib.getAttrFromPath [ "sessionVariables" "PATH" ] config}";

    home.file = {
        ".bashrc" = {
            text = ''
              export PATH="${pkgs.vscodium}/bin:$PATH"
              export PATH="${pkgs.unityhub}/bin:$PATH"
            '';
        };
    };

    home.sessionVariables = {
        DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    };

    home.packages = with pkgs; [
        direnv
    ];

    





}