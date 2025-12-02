{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    withPython3 = true;
    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      telescope-nvim
      plenary-nvim
      nvim-lspconfig
      catppuccin-nvim

    ];

    extraPackages = with pkgs; [
      tree-sitter
      tree-sitter-grammars.tree-sitter-bash
      tree-sitter-grammars.tree-sitter-json
      tree-sitter-grammars.tree-sitter-lua
      tree-sitter-grammars.tree-sitter-nix
      tree-sitter-grammars.tree-sitter-vim
      tree-sitter-grammars.tree-sitter-yaml
    ];

    extraLuaConfig = ''
      -- line numbers
      vim.o.number = true
      vim.o.relativenumber = true

      -- indentation
      vim.o.expandtab = true
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2

      -- searching
      vim.o.ignorecase = true
      vim.o.smartcase = true

      -- colors
      vim.o.termguicolors = true
      vim.cmd.colorscheme("catppuccin")
 
      -- treesitter
      require('nvim-treesitter.configs').setup {
        ensure_installer = { "lua", "vim", "vimdoc", "bash", "json", "yaml", "nix" },
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }

    '';
  };
}
