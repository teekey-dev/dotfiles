-- Colors
if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
end
vim.opt.background = 'light'

-- vim.cmd('highlight Visual cterm=reverse ctermbg=225 guibg=#ffa200')

vim.cmd.colorscheme "catppuccin-latte"
