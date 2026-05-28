-- Language menu
vim.opt.langmenu = none
-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd('Filetype', {
    pattern = { 'ruby', 'html', 'css', 'javascript', 'typescript', 'dart', 'yaml', 'json', 'vim', 'cpp' },
    command = 'setlocal ts=2 sw=2'
})

-- Comand Height
vim.opt.cmdheight = 2

-- Show signcolumn
vim.opt.signcolumn = 'yes'

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Ruler
vim.opt.ruler = true

-- Text width
vim.opt.textwidth = 140

-- Syntax Highlight
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- Search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable opening files without saving. Editing files will be hidden and preserved
vim.opt.hidden = true

-- Status
vim.opt.laststatus = 3

-- Show command in statusline
vim.opt.showcmd = true
vim.opt.showcmdloc = 'statusline'

-- Backspace options
vim.opt.backspace = 'indent,eol,start'

-- Change leader to ,
vim.g.mapleader = ','
vim.g.maplocalleader = ' '

-- EOL settings
vim.opt.fileformats = 'unix,mac'

-- Disable mouse
vim.opt.mouse = {}
vim.opt.mousescroll = 'ver:0,hor:0'

-- Spell check
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

-- autoload
vim.opt.autoread = true
vim.opt.updatetime = 300

-- 자동 체크를 위한 autocmd 설정
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" and vim.fn.filereadable(vim.fn.expand("%")) == 1 then
            vim.cmd("checktime")
        end
    end
})
