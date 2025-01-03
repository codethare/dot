return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      notify = { enabled = false },
      notifier = { enabled = false },
      statuscolumn = { enabled = false },
      scroll = { enabled = false },
    },
    keys = {
      { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { '<leader>S',  function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
			{ '<leader>n',  function() Snacks.notifier.show_history() end, desc = 'Notification History' },
			{ '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications' },
			{ '<leader>dps', function() Snacks.profiler.scratch() end, desc = 'Profiler Scratch Buffer' },
    }
  },

  -----------------------------------------------------------------------------
  --                                                                statusline
  {
    enabled = false,
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local LazyVim = require("lazyvim.util")
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " 󰌾 ",
        }),
      }
    end,
  },

  -----------------------------------------------------------------------------
	--                                                       UI Component Library
	{ 'MunifTanjim/nui.nvim', lazy = false },
}

