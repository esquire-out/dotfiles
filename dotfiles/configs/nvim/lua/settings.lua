-- toggle both numbers and relativenumbers on, vim.cmd
vim.cmd('set number relativenumber')

-- Transparency commands, partially works.
vim.cmd('hi Normal ctermbg=none guibg=none')
vim.cmd('hi NormalNC ctermbg=none guibg=none')
vim.cmd('hi NonText ctermbg=none guibg=none')
vim.cmd('hi LineNr ctermbg=none guibg=none')
vim.cmd('hi Folded ctermbg=none guibg=none')
vim.cmd('hi SpecialKey ctermbg=none guibg=none')
vim.cmd('hi VertSplit ctermbg=none guibg=none')
vim.cmd('hi SignColumn ctermbg=none guibg=none')
vim.cmd('hi EndOfBuffer ctermbg=none guibg=none')
vim.cmd('hi NvimTreeNormalNC guibg=none')

-- Command to open the config directory in Windows.
vim.cmd('command config_win :e $APPDATA/../Local/nvim/')

-- Command to open the config directory in Linux.
vim.cmd('command config_unix :e ~/.config/nvim/')


-- Show carriage return as symbol.
-- vim.cmd('set list listchars=eol:↩')
vim.cmd('set list listchars=eol:⏎')
-- Set it's color to less of an eyesore.
vim.cmd('hi NonText guifg=#353b54')

-- 16 lines before EOB scroll.
vim.cmd('set scrolloff=16')

