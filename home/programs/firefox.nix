# firefox config

{ config, pkgs, inputs, ... }:

{
    programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles = {
      default = {
        id = 0;
        name = "Default";
        isDefault = true;
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          bitwarden
          clearurls
          decentraleyes
          privacy-redirect
          sidebery
          multi-account-containers
          canvasblocker
          privacy-badger
          tree-style-tab
        ];

        search = {
         force = true;
         default = "ddg";
         engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
         };
        };
        

        bookmarks = {
          force = true;
          settings = [
            {
              name = "wikipedia";
              tags = [ "wiki" ];
              keyword = "wiki";
              url = "https://en.wikipedia.org/wiki/Main_Page";
            }

            {
              name = "syncthing-local";
              tags = [ "sync" ];
              keyword = "syncl";
              url = "http://127.0.0.1:8384/#";
            }

            {
              name = "syncthing-server";
              tags = [ "sync" ];
              keyword = "syncs";
              url = "http://192.168.1.81:8384/#";
            } 

            {
              name = "college onedrive";
              tags = [ "college" ];
              keyword = "collegedrive";
              url = "https://halscol-my.sharepoint.com/personal/187680_halesowen_ac_uk/_layouts/15/onedrive.aspx?view=1";
            }

            {
              name = "revolt";
              tags = [ "social" ];
              keyword = "revolt";
              url = "https://revolt.geoxor.moe";
            } 
          ];
        };
      
        settings = {
        "browser.tabs.closeWindowWithLastTab" = false;
        "browser.compactmode.show" = true;
        "privacy.resistFingerprinting" = true;
        "geo.enabled" = false;
        "privacy.resistFingerprinting.block_mozAddonManager" = true;
        "privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts" = true;
#        "privacy.resistFingerprinting.jsmloglevel" = Warn;
        "privacy.resistFingerprinting.randomDataOnCanvasExtract" = true;
        "privacy.resistFingerprinting.target_video_res" = 480;
        "privacy.resistFingerprinting.testGranularityMask" = 0;
        "browser.aboutConfig.showWarning" = false;
        };
     
        extraConfig = ''
           user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        '';

        userChrome = ''                         
            @media (prefers-color-scheme: dark) {
                :root {
                    --accent-color: #3B4252;
                }
            }

            @media (prefers-color-scheme: light) {
                :root {
                    --accent-color: #FAFAFC;
                }
            }
            /*====== Aesthetics ======*/
            /*
            #star-button-box {
              display: none;
            }
            */




            #save-to-pocket-button {
              display: none;
            }



            #navigator-toolbox {
                border-bottom: none !important;
            }

            #titlebar {
                background: var(--accent-color) !important; 
            }

            /* Sets the toolbar color */
            toolbar#nav-bar {
                background: var(--accent-color) !important; 
                box-shadow: none !important;
            }

            /* Sets the URL bar color */
            #urlbar {
                background: var(--accent-color) !important; 
            }

            #urlbar-background {
                background: var(--accent-color) !important;
                border: none !important;
            }

            #urlbar-input-container {
                border: none !important;
            }

            /*====== UI Settings ======*/

            :root {
                --navbarWidth: 900px; /* Set width of navbar */
            }

            /* If the window is wider than 1000px, use flex layout */
            @media (min-width: 1000px) {
                #navigator-toolbox {
                    display: flex;
                    flex-direction: row;
                    flex-wrap: wrap;
                }

                /*  Url bar  */
                #nav-bar {
                    order: 1;
                    width: var(--navbarWidth);
                }

                /* Tab bar */
                #titlebar {
                    order: 2;
                    width: calc(100vw - var(--navbarWidth) - 1px);
                } 

                /* Bookmarks bar */
                #PersonalToolbar {
                    order: 3;
                    width: 100%;
                } 
                
                /* Fix urlbar sometimes being misaligned */
                :root[uidensity="compact"] #urlbar {
                    --urlbar-toolbar-height: 39.60px !important;
                }

                :root[uidensity="touch"] #urlbar {
                    --urlbar-toolbar-height: 49.00px !important;
                }
            }

            /*====== Simplifying interface ======*/

            /* Autohide back button when disabled */
            #back-button, #forward-button {
                transform: scale(1, 1) !important;
                transition: margin-left 150ms var(--animation-easing-function), opacity 250ms var(--animation-easing-function), transform 350ms var(--animation-easing-function) !important;
            }

            #back-button[disabled="true"], #forward-button[disabled="true"] {
                margin-left: -34px !important;
                opacity: 0 !important;
                transform: scale(0.8, 0.8) !important;
                pointer-events: none !important;
            }

            /* Remove UI elements */
            #identity-box, /* Site information */
            #tracking-protection-icon-container, /* Shield icon */
            #page-action-buttons > :not(#urlbar-zoom-button, #star-button-box), /* All url bar icons except for zoom level and bookmarks */
            #urlbar-go-button, /* Search URL magnifying glass */
            #alltabs-button, /* Menu to display all tabs at the end of tabs bar */
            .titlebar-buttonbox-container /* Minimize, maximize, and close buttons */ {
                display: none !important;
            }

            #nav-bar {
                box-shadow: none !important;
            }

            /* Remove "padding" left and right from tabs */
            .titlebar-spacer {
                display: none !important;
            }

            /* Fix URL bar overlapping elements */
            #urlbar-container {
                min-width: initial !important;
            }

            /* Remove gap after pinned tabs */
            #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
            > #tabbrowser-arrowscrollbox
            > .tabbrowser-tab[first-visible-unpinned-tab] {
                margin-inline-start: 0 !important;
            }

            /* Hide the hamburger menu */
            #PanelUI-menu-button { 
                padding: 0px !important;
            }

            #PanelUI-menu-button .toolbarbutton-icon { 
                width: 20px !important; 
            }

            #PanelUI-menu-button .toolbarbutton-badge-stack {
                padding: 0px !important; 
            }


            /* sidebery */

            /**
            * Decrease size of the sidebar header
            */
             /* #sidebar-box{
              --uc-sidebar-width: 40px;
              --uc-sidebar-hover-width: 210px;
              --uc-autohide-sidebar-delay: 600ms; /* Wait 0.6s before hiding sidebar */
             /* --uc-autohide-transition-duration: 115ms;
              --uc-autohide-transition-type: linear;
              position: relative;
              min-width: var(--uc-sidebar-width) !important;
              width: var(--uc-sidebar-width) !important;
              max-width: var(--uc-sidebar-width) !important;
              z-index:1;
            }

            #sidebar-box[positionend]{ direction: rtl }
            #sidebar-box[positionend] > *{ direction: ltr }

            #sidebar-box[positionend]:-moz-locale-dir(rtl){ direction: ltr }
            #sidebar-box[positionend]:-moz-locale-dir(rtl) > *{ direction: rtl }

            #main-window[sizemode="fullscreen"] #sidebar-box{ --uc-sidebar-width: 1px; }

            #sidebar-splitter{ display: none }

            #sidebar-header{
              overflow: hidden;
              color: var(--chrome-color, inherit) !important;
              padding-inline: 0 !important;
            }

            #sidebar-header::before,
            #sidebar-header::after{
              content: "";
              display: flex;
              padding-left: 8px;
            }

            #sidebar-header,
            #sidebar{
              transition: min-width var(--uc-autohide-transition-duration) var(--uc-autohide-transition-type) var(--uc-autohide-sidebar-delay) !important;
              min-width: var(--uc-sidebar-width) !important;
              will-change: min-width;
            }
            #sidebar-box:hover > #sidebar-header,
            #sidebar-box:hover > #sidebar{
              min-width: var(--uc-sidebar-hover-width) !important;
              transition-delay: 0ms !important;
            }

            .sidebar-panel{
              background-color: transparent !important;
              color: var(--newtab-text-primary-color) !important;
            }

            .sidebar-panel #search-box{
              -moz-appearance: none !important;
              background-color: rgba(249,249,250,0.1) !important; 
              color: inherit !important;
            }

            /* Add sidebar divider and give it background */

          /*  #sidebar,
            #sidebar-header{
              background-color: inherit !important;
              border-inline: 1px solid rgb(80,80,80);
              border-inline-width: 0px 1px;
            }

            #sidebar-box:not([positionend]) > :-moz-locale-dir(rtl),
            #sidebar-box[positionend] > *{
              border-inline-width: 1px 0px;
            }

            /* Move statuspanel to the other side when sidebar is hovered so it doesn't get covered by sidebar */

          /*  #sidebar-box:not([positionend]):hover ~ #appcontent #statuspanel{
              inset-inline: auto 0px !important;
            }
            #sidebar-box:not([positionend]):hover ~ #appcontent #statuspanel-label{
              margin-inline: 0px !important;
              border-left-style: solid !important; 
            } */

            #TabsToolbar {
              display: none;
            }
                        
        '';            
    


        };

    }; 


   };


}