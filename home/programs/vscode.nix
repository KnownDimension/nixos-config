# vscode configuration (say hi)

{ config, pkgs, inputs, lib, modulesPath, ... }:

{

    programs = {
        vscode = {
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
                        bmewburn.vscode-intelephense-client	
    #                    svelte.svelte-vscode
                        formulahendry.auto-close-tag
                        dbaeumer.vscode-eslint
    #                    ritwickdey.liveserver
                        ms-vscode.live-server
                        jnoortheen.nix-ide
                        ecmel.vscode-html-css
    #                    arrterian.nix-env-selector
    #                    rust-lang.rust-analyzer
                        mkhl.direnv
    #                    ms-dotnettools.csharp
    #                    ms-dotnettools.vscodeintellicode-csharp
    #                    ms-dotnettools.vscode-dotnet-runtime





                    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                        {
                            name = "vstuc";
                            publisher = "visualstudiotoolsforunity";
                            version = "1.0.5";
                            sha256 = "sha256-7v/f9oo+zjQ3EaVhYfswhy3Sqw3U+v53o50SvMRngFc=";
                        }

                        {
                            name = "sqltools";
                            publisher = "mtxr";
                            version = "0.28.5";
                            sha256 = "sha256-2JgBRMaNU3einOZ0POfcc887HCScu6myETTLoJMS6o8=";
                        }

                        {
                            name = "sqltools-driver-mysql";
                            publisher = "mtxr";
                            version = "0.6.6";
                            sha256 = "sha256-LnGaMomXuXsuDjGn1tTQy4nfHtN/SMGUgDngm+O9c/o=";
                        }

                        {
                            name = "vscode-laravel";
                            publisher = "laravel";
                            version = "1.6.6";
                            sha256 = "sha256-cuuR1mJhGCjK5b/mN3E5/aYSv0pBm4zKtiap1Qem6xs=";
                        }
                    ];
                };
            };
        };


        direnv = {
            enable = true;
            enableBashIntegration = true; 
            nix-direnv.enable = true;
        };

        bash.enable = true; 
    };

  
    home.file = {
        ".bashrc" = {
            text = ''
              export PATH="${pkgs.vscodium}/bin:$PATH"          
            '';
        };
    };

#    home.sessionVariables = {
#        DOTNET_ROOT = "${pkgs.dotnet-sdk}";
#    };



}