vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true

vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.shell = 'fish'
vim.opt.inccommand = 'split'
vim.opt.wrap = false
vim.opt.wildmenu = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.wildmode = { 'longest', 'list', 'full' }
vim.opt.path:append({ '**' })          -- finding search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"

-- vim.opt.listchars = { nbsp = '¬',tab = '»·',trail = '·',extends = '>' }
-- vim.opt.listchars.extends = 'nbsp:¬,tab:»·,trail:·,extends:>'

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""

vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.wo.number = true
vim.wo.relativenumber = true
-- vim.opt.colorcolumn = "80"     --hei line
-- vim.o.laststatus = 0 status line
-- vim.opt.undofile = true Save undo history

vim.g.mapleader = ' ' -- Set leader to space key
vim.o.hlsearch = true -- Set highlight on search

vim.opt.formatoptions:append { 'r' } -- Add asterisks in block comments

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Cs = "\e[4:0m"]])

-- tab jump with name
-- (if set, when we switch between buffers, it will not split more than once. It will switch to the existing buffer instead)
-- vim.opt.switchbuf = { 'usetab' }

-- npm && yarn $PATH
vim.cmd([[ let $PATH = expand('$HOME/.config/yarn/lsp/node_modules') . '/.bin:' . $PATH ]])

-- vim.env.http_proxy = 'socks5://127.0.3.13:9918'
-- vim.env.https_proxy = 'socks5://127.0.3.13:9918'

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end

-- plugin lazynvim
vim.g.snacks_animate = false
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_cmp = "blink.cmp"

