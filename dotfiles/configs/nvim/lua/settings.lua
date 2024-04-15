
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = {eol = '↩'}
vim.opt.scrolloff = 16
vim.opt.wrap = false
vim.opt.inccommand = 'split' -- Live substitution preview

-- TODO: Actually make it a toggle...
-- TODO: Add missing highlights, such as borders.
function Toggle_transparency()
    vim.cmd[[hi Normal ctermbg=none guibg=none]]
    vim.cmd[[hi NormalNC ctermbg=none guibg=none]]
    vim.cmd[[hi NonText ctermbg=none guibg=none]]
    vim.cmd[[hi LineNr ctermbg=none guibg=none]]
    vim.cmd[[hi Folded ctermbg=none guibg=none]]
    vim.cmd[[hi SpecialKey ctermbg=none guibg=none]]
    vim.cmd[[hi VertSplit ctermbg=none guibg=none]]
    vim.cmd[[hi SignColumn ctermbg=none guibg=none]]
    vim.cmd[[hi EndOfBuffer ctermbg=none guibg=none]]
    vim.cmd[[hi NvimTreeNormalNC guibg=none]]
end

function Open_config()
    if vim.fn.has('win32') == 1 then
        -- init.lua SHOULD be in this directory.
        vim.cmd('e $APPDATA/../Local/nvim/')
    else
        vim.cmd('e ~/.config/nvim/')
    end
end


vim.cmd('command! ConfigLocation :lua Open_config()')
-- NOTE do this
vim.cmd('command! ConfigTransparency :lua Toggle_transparency()')


