return {
  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
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
    enabled = false,
    'gera2ld/ai.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      api_key = 'AIzaSyBvQmJKuijJQpPvdfttevITSx_iaAulw6E', -- or read from env: `os.getenv('GEMINI_API_KEY')`
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

