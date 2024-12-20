{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    enable = true;
    enableMan = true;
    viAlias = true;
    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
        term_colors = true;
        integrations = {
          cmp = true;
          which_key = true;
          treesitter = true;
          indent_blankline = true;
        };
      };
    };
    plugins = {
      bufferline.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {
              name = "nvim_lsp";
              keyword_length = 3;
            }
            {
              name = "path";
              keyword_length = 3;
            }
            {
              name = "buffer";
              keyword_length = 5;
            }
            {
              name = "luasnip";
              keyword_length = 3;
            }
            {
              name = "codeium";
              keyword_length = 3;
            }
            {
              name = "treesitter";
              keyword_length = 3;
            }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<TAB>" =
              #Lua
              ''
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
          c = ["clangtidy"];
          python = ["pylint"];
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
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            bash = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            c = ["clang_format"];
            cpp = ["clang_format"];
            python = ["isort" "black"];
            lua = ["stylua"];
            nix = ["alejandra"];
            "_" = [
              "squeeze_blanks"
              "trim_whitespace"
              "trim_newlines"
            ];
          };
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
        };
      };
      lazygit = {
        enable = true;
      };
      markdown-preview = {
        enable = true;
        settings = {
          browser = "firefox";
        };
      };
      which-key.enable = true;
      lspkind.enable = true;
      texpresso.enable = true;
      tmux-navigator.enable = true;
      indent-blankline.enable = true;
      lazy.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      trouble.enable = true;
      yazi.enable = true;
      vim-be-good.enable = true;
    };
    globals.mapleader = " ";
    opts = {
      tabstop = 8;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;
      smartindent = true;
      cindent = true;
      shiftwidth = 2;
      breakindent = true;
      splitbelow = true;
      splitright = true;
      wrap = true;
      mouse = "a";
      updatetime = 50;
      swapfile = true;
      backup = false;
      undofile = true;
      termguicolors = true;
      signcolumn = "yes";
      scrolloff = 8;
      encoding = "utf-8";
      fileencoding = "utf-8";
      # offset_encoding = "utf-8";
      cmdheight = 0;
      number = true;
      relativenumber = true;
    };
    performance.byteCompileLua.enable = true;
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
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Yazi<cr>";
      }
    ];
  };
}
