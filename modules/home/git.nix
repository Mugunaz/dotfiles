{ pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "joseph";
    userEmail = "josephbotzung@gmail.com";

    extraConfig = {
      core.editor = "nvim";
      pull.rebase = true;
    };
  };
}
