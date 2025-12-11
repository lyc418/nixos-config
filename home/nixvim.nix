{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    extraPlugins = [ pkgs.vimPlugins.lazy-nvim ];

    extraConfigLuaPre = ''
      require("lazy").setup({
          spec = {
              { "LazyVim/LazyVim", import = "lazyvim.plugins" },
              {
                  "folke/tokyonight.nvim",
                  opts = {
                      transparent = true,
                      styles = {
                          sidebars = "transparent",
                          floats = "transparent",
                      },
                  },
              },
              {
                  "folke/noice.nvim",
                  opts = {
                      notify = { enabled = false },
                  },
              },
              {
                  "stevearc/conform.nvim",
                  opts = {
                      format_on_save = false,
                      format_after_save = false,
                  },
              },
              {
                  "mason-org/mason.nvim",
                  enabled = false,
              },
              {
                  "mason-org/mason-lspconfig.nvim",
                  enabled = false,
              },
              {
                  "neovim/nvim-lspconfig",
                  enabled = false,
              },
              {
                  "hrsh7th/nvim-cmp",
                  opts = function(_, opts)
                      local cmp = require("cmp")
                      opts.mapping = cmp.mapping.preset.insert({
                          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                          ["<C-f>"] = cmp.mapping.scroll_docs(4),
                          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                          ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                          ["<C-Space>"] = cmp.mapping.complete(),
                          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                          ["<C-e>"] = cmp.mapping.abort(),
                      })
                      return opts
                  end,
              },
          },
          defaults = { lazy = false },
      })
    '';

    globals.mapleader = " ";

    opts = {
      syntax = "on";

      encoding = "UTF-8";
      fileencoding = "UTF-8";

      expandtab = false;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;

      smartindent = true;

      backspace = "indent,eol,start";

      showmatch = true;
      wildmenu = true;
      cursorline = true;
      background = "dark";

      number = true;
      relativenumber = true;

      undofile = false;
      backup = false;
      writebackup = false;
      swapfile = false;

      autoread = true;
    };

    autoCmd = [
      {
        event = [
          "FocusGained"
          "BufEnter"
          "CursorHold"
          "CursorHoldI"
        ];
        pattern = "*";
        command = "if mode() != 'c' | checktime | endif";
      }

      {
        event = [
          "BufEnter"
          "FocusGained"
          "InsertLeave"
        ];
        pattern = "*";
        command = "set relativenumber";
      }

      {
        event = [
          "BufLeave"
          "FocusLost"
          "InsertEnter"
        ];
        pattern = "*";
        command = "set norelativenumber";
      }
    ];

    keymaps = [
      {
        mode = "i";
        key = "{<CR>";
        action = "{<CR>}<Esc>O";
      }
      {
        mode = "i";
        key = "{{";
        action = "{";
      }
      {
        mode = "i";
        key = "{}";
        action = "{}";
      }

      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
    ];
  };
}
