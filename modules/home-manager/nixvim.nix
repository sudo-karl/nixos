{ config, pkgs, inputs, ... }:
    
{ 
  programs.nixvim = {                          
    enable = true;
    enableMan = true;
    viAlias = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };
    plugins = {
      bufferline.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = { sources = [ 
            { name = "nvim_lsp"; }
            { name = "path";}
            { name = "buffer"; }
            { name = "cmdline"; }
            { name = "luasnip"; }
            { name = "treesitter"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<TAB>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item();
                elseif require("luasnip").expand_or_locally_jumpable() then
                  require("luasnip").expand_or_jump()
                else 
                  fallback()
                end 
              end, { "i", "s" })
            '';
          };
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };
      };
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<TAB>";
        };
        fromVscode = [
          {
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          autopairs.enable = true;
          folding.enable = true;
          ensure_installed = [
            "bash"
            "c"
            "cpp"
            "html"
            "css"
            "json"
            "lua"
            "nix"
            "markdown"
            "python"
            "yaml"
          ];
          auto_install = true;
          nixvimInjections = true;
        };
      };
      lualine.enable = true;
      lint = {
        enable = true;
        lintersByFt = {
          c = ["clang-format"];
          python = ["black"];
          nix = ["statix"];
        };
        autoCmd = {
          callback = {
            __raw = ''
              function()
                require('lint').try_lint()
              end
            '';
          };
          event = "BufWritePost";
        };
      };
      lsp = {
        enable = true;
        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
        servers = {
          arduino_language_server.enable = true;
          bashls.enable = true;
          clangd.enable = true;
          cmake.enable = true;
          cssls.enable = true;
          html.enable = true;
          ltex.enable = true;
          lua_ls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          pyright.enable = true;
        };
      };
      oil.enable = true;
      texpresso.enable = true;
			tmux-navigator.enable = true;
      lazygit = {
        enable = true;
      };
      lazy.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      markdown-preview = {
        enable = true;
        settings = {
          browser = "firefox";
        };
      };
    };
    globals.mapleader = " ";
    opts = {
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;
      splitbelow = true;
      splitright = true;
      wrap = true;
      mouse = "a";
      updatetime = 50;
      swapfile = false;
      backup = false;
      undofile = true;
      termguicolors = true;
      signcolumn = "yes";
      scrolloff = 8;
      encoding = "utf-8";
      fileencoding = "utf-8";
      cmdheight = 1;
      number = true;
      relativenumber = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
      }
      {
        mode = "n";
        key = "<leader>cp";
        action = "<cmd>MarkdownPreview<cr>";
      }
    ];
  };
   
}

