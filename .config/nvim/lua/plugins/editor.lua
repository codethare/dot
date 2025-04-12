return {
  {
    "kazhala/close-buffers.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>th",
				function()
					require("close_buffers").delete({ type = "hidden" })
				end,
				"Close Hidden Buffers",
			},
			{
				"<leader>tu",
				function()
					require("close_buffers").delete({ type = "nameless" })
				end,
				"Close Nameless Buffers",
			},
		},
	},
  {
		"saghen/blink.cmp",
		opts = {
			completion = {
        trigger = { prefetch_on_insert = true, show_on_keyword = true },
        list = {
          selection = { preselect = false, auto_insert = true },
          cycle = {
            from_bottom = true,
            from_top = true,
          },
        },
        menu = {
          auto_show = true,
          winblend = vim.o.winblend,
          -- draw = { treesitter = { 'lsp' } },
        },
        documentation = {
          window = { winblend = vim.o.winblend },
          auto_show = false,
          -- auto_show_delay_ms = 0,
          -- update_delay_ms = 0,
        },
			},
			signature = {
        enabled = true,
				window = {
					winblend = vim.o.pumblend,
				},
			},
    },
    snippets = {
      preset = 'friendly-snippets',
      expand = function(s) ls.lsp_expand(s) end,
      active = function(opts)
        if opts and opts.direction then return ls.locally_jumpable(opts.direction) end
        return ls.in_snippet()
      end,
      jump = function(direction) ls.jump(direction) end,
    },
	},

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end
      local events = require("neo-tree.events")
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
    end,
  },

	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
					group = function(_, match)
						local utils = require("solarized-osaka.hsl")
						--- @type string, string, string
						local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
						--- @type number?, number?, number?
						local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
						--- @type string
						local hex_color = utils.hslToHex(h, s, l)
						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},

  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        ";f",
        function()
          local builtin = require("fzf-lua")
          builtin.files({
              no_ignore = false,
              hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("fzf-lua")
          builtin.live_grep({
            additional_args = { "--hidden" },
          })
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "<leader>fP",
        function()
          require("fzf-lua").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "\\\\",
        function()
          local builtin = require("fzf-lua")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";t",
        function()
          local builtin = require("fzf-lua")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";;",
        function()
          local builtin = require("fzf-lua")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("fzf-lua")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
    },
  },
}
