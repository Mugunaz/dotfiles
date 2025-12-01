{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      gp = "git pull";
      gc = "git commit";
    };

  };

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
