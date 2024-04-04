vim.g.mapleader = ' '
-- Mappings
vim.api.nvim_set_keymap('n', '<leader>F', ':Telescope find_files<CR>', {
    noremap = true,
    silent = true,
    desc = 'Find [F]iles'
})

vim.api.nvim_set_keymap('n', '<leader>B', ':Telescope buffers<CR>', {
    noremap = true,
    silent = true,
    desc = 'Search in current [B]uffer'
})



vim.api.nvim_set_keymap('n', '<leader>b', ':BufferPick<CR>', {
    noremap = true,
    silent = true,
    desc = 'Enter [B]ufferPick mode'
})

-- Toggle Inlay Hints
vim.api.nvim_set_keymap('n', '<leader>V', ':lua vim.lsp.inlay_hint(0, nil)<CR>', {
        noremap = true,
        silent = true,
        desc = 'Toggle [V]isual inlay hints'
})

-- Toggle NerdTree
vim.api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true,
    desc = 'Toggle [N]vim[T]ree'
})




-- Telescope Mappings
vim.api.nvim_set_keymap('n', '<leader>T', ':Telescope<CR>',{
    noremap = true,
    silent = true,
    desc = 'Launch [T]elescope'
})

