{ config, pkgs, ... }:

let
    lock-false = { Value = false; Status = "locked"; };
    lock-true  = { Value = true; Status = "locked"; };
in
{
    programs.firefox = {
        enable = true;
        # languagePacks = [ "en-US" "de" ];

        # Policies: see about:policies for details. Use these to set prefs and
        # to force-install or block extensions via their IDs.
        policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
                Value = true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
            };
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisableAccounts = true;
            DisableFirefoxScreenshots = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "never";
            DisplayMenuBar = "default-off";
            SearchBar = "unified";

            # ExtensionSettings: block all by default and add exceptions below.
            ExtensionSettings = {
                "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                };
                "bitwarden" = {
                    install_url = "https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/";
                    installation_mode = "force_installed";
                };
                "DarkReader" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
                    installation_mode = "force_installed";
                };
            };

            Preferences = {
                "browser.download.lastDir" = "/home/joseph/dotfiles/assets";

                # Privacy prefs
                "network.prefetch-next" = lock-false;
                "network.dns.disablePrefetch" = lock-true;
                "network.http.speculative-parallel-limit" = 0;

                # Containers
                "privacy.userContext.enabled" = lock-true;
                "privacy.userContext.ui.enabled" = lock-true;

                # Sidebar / vertical tabs
                "sidebar.verticalTabs" = lock-true;

                # Autofill
                "dom.forms.autocomplete.formautofill" = lock-false;

                # Start page behavior
                "browser.shell.checkDefaultBrowser" = lock-false;

                # Disable Firefox’s “default bookmarks” restore
                "browser.bookmarks.restore_default_bookmarks" = lock-false;
            };
        };
    };

}