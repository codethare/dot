local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- __________________________________________
--                            skip { X } keys
keymap.set("n", "x", '"_x')

-- __________________________________________
--                        Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- __________________________________________
--                                jump list
keymap.set("n", "<C-m>", "<C-i>", opts)

-- __________________________________________
--                           delete word back
keymap.set("n", "dw", 'vb"_d')

-- __________________________________________
--                                    New tab
keymap.set("n", "te", ":tabedit<space>")
keymap.set("n", "tn", ":tabnew<Return>")
keymap.set("n", "<leader>T", ":terminal <Return> a")
keymap.set("n", "K", "mzJ`z")

-- __________________________________________
--                               Split window
keymap.set("n", "st", ":split<Return>:resize 15<Return>", opts)
keymap.set("n", "vt", ":vsplit<Return>", opts)
keymap.set("n", "ST", [[:split \| :resize 15 \| :terminal <Return> a]], opts)
keymap.set("n", "VT", [[:vsplit \| :terminal <Return> a]], opts)

-- __________________________________________
--                               windows_size
keymap.set("n", "<c-w>[", ":vertical resize -5<Return>")
keymap.set("n", "<c-w>]", ":vertical resize +5<Return>")
keymap.set("n", "<c-w>-", ":resize -5<Return>")
keymap.set("n", "<c-w>+", ":resize +5<Return>")

-- __________________________________________
--                              jump (ontime)
keymap.set("i", "<C-U>", "<C-G>u<C-U>")

-- __________________________________________
--                                 Select all
-- keymap.set('n', '<C-a>', 'gg<S-v>G')

-- __________________________________________
--                           capslock N shift
keymap.set("v", "<leader>u", "gu")
keymap.set("v", "<leader>U", "gu")

-- __________________________________________
-- Move tab
keymap.set("n", "<C-Tab>", ":sb<Space>")

-- __________________________________________
--                                Move window
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- __________________________________________
--                              Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")


-- __________________________________________
--  Do things without affecting the registers
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- __________________________________________
--                                Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("user.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
  require("user.lsp").toggleInlayHints()
end)

vim.api.nvim_create_user_command("ToggleAutoformat", function()
	require("user.lsp").toggleAutoformat()
end, {})

