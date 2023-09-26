return {
  {
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- Snippet
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local kind_icons = {
        Text = "",
        Method = "",
        Function = "󰊕",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      return vim.tbl_deep_extend("force", opts or {}, {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require("snippy").expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          documentation = vim.tbl_deep_extend(
            "force",
            cmp.config.window.bordered(),
            {
              max_height = 15,
              max_width = 60,
            }
          ),
          completion = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-TAB>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        }),
        formatting = {
          format = function(entry, item)
            item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
            item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              vsnip = "[VSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return item
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" }, -- For vsnip users.
          -- { name = "luasnip" }, -- For luasnip users.
          -- { name = "ultisnips" }, -- For ultisnips users.
          -- { name = "snippy" }, -- For snippy users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  {
    "echasnovski/mini.comment",
    version = false,
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  -- Support Emmet for HTML & CSS
  {
    "mattn/emmet-vim",
    lazy = true,
    config = function()
      vim["user_emmet_leader_key"] = "<C-Y>"
    end,
    ft = { "html" },
  },

  {
    "junegunn/vim-easy-align",
    keys = {
      {
        "ga",
        "<Plug>(EasyAlign)",
        mode = "x",
        remap = true,
        desc = "Starts interactive EasyAlign in visual mode (e.g. vipga)",
      },
      {
        "ga",
        "<Plug>(EasyAlign)",
        mode = "n",
        remap = true,
        desc = "Starts interactive EasyAlign for a motion/text object (e.g. gaip)",
      },
    },
  },

  -- TODO: move to markdown lang module
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
