vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/**" }
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.wrap = false

vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.clipboard:append({ "unnamedplus" })

vim.opt.path:append({ "**" })

vim.opt.formatoptions:append({ "r" })

vim.opt.termguicolors = true

vim.opt.lazyredraw = true

vim.g.skip_ts_context_commentstring_module = true

vim.o.signcolumn = "yes"
