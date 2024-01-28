-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Before saving a file,
-- the formatting function provided by LSP is automatically executed to
-- ensure that the code is automatically formatted according
-- to the set rules when the file is saved.
-- vim.api.nvim_command[[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync() ]]
