{ config, pkgs, inputs, ... }:
    
{ 
  programs.nixvim = {                          
    enable = true;
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.transparent_background = true;
    viAlias = true;
    plugins = {
      lualine.enable = true;
      neo-tree.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
      nvim-autopairs.enable = true;
    };
    globals.mapleader = " ";
    globalOpts = {
    };
    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      mouse = "a";
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      cursorline = true;
      ruler = true;
      scrolloff = 5;
    };
    keymaps = [ 
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }
    ];
  };
}

