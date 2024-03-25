return {
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    enabled = false,
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",           -- need treesitter
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- Go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
      })
    end,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },

  {
    "mini.surround",
    event = "BufReadPost",
    opts = {
       mappings = {
         add = "gz", -- Add surrounding in Normal and Visual modes
         delete = "gzd", -- Delete surrounding
         find = "gzf", -- Find surrounding (to the right)
         find_left = "gzF", -- Find surrounding (to the left)
         highlight = "gzh", -- Highlight surrounding
         replace = "gzr", -- Replace surrounding
         update_n_lines = "gzn", -- Update `n_lines`
       },
     },
  },

  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  {
  'gera2ld/ai.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    api_key = 'AIzaSyCuYgQopS29rfJH8Ko7N3cbeOzFwKDtddo', -- or read from env: `os.getenv('GEMINI_API_KEY')`
    -- The locale for the content to be defined/translated into
    locale = 'en',
    -- The locale for the content in the locale above to be translated into
    alternate_locale = 'zh',
    -- Gemini's answer is displayed in a popup buffer
    -- Default behaviour is not to give it the focus because it is seen as a kind of tooltip
    -- But if you prefer it to get the focus, set to true.
    result_popup_gets_focus = false,
    -- Define custom prompts here, see below for more details
    prompts = {},
  },
  event = 'VeryLazy',
},
}

