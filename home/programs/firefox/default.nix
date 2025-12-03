{ config, pkgs, ... }:

{
    profiles.default.extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        darkreader

    ];


    programs.firefox = {
        enable = true;

        profiles.default.settings = {
            # Download directory
            "browser.download.lastDir" = "/home/joseph/dotfiles/assets";

            # Privacy: disable prefetching
            "network.prefetch-next" = false;
            "network.dns.disablePrefetch" = true;
            "network.http.speculative-parallel-limit" = 0;

            # Containers
            "privacy.userContext.enabled" = true;
            "privacy.userContext.ui.enabled" = true;

            # Sidebar / vertical tabs
            "sidebar.verticalTabs" = true;

            # Autofill
            "dom.forms.autocomplete.formautofill" = true;

            # Start page behavior (optional)
            "browser.shell.checkDefaultBrowser" = false;

            # Disable Firefox’s “default bookmarks” restore
            "browser.bookmarks.restore_default_bookmarks" = false;
        };
        };


}