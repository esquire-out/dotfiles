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



-- Formatter stuff

local function fmt_helper( num )
    vim.api.nvim_win_set_cursor(0, {num, 1})
    vim.api.nvim_feedkeys('<CR>', 'n', true)
end

-- TODO

function Buf_fmt()
    local buf_filetype = vim.api.nvim_buf_get_option(0, 'filetype')
    -- Returns the filetype of the current buffer in the format:
    -- e.g. 'cpp', 'c', 'python', 'lua', etc.
    local last_pos = vim.api.nvim_win_get_cursor(0)[1]

    if buf_filetype == 'cpp' or buf_filetype == 'c' or buf_filetype == 'h' then
        print('Formatting C/C++ file')
        vim.api.nvim_command('%!clang-format -style=LLVM') -- TODO: find preferred style
        fmt_helper(last_pos)

    elseif buf_filetype == 'rs' then
        print('Formatting Rust file')
        vim.api.nvim_command('!rustfmt') -- TODO Test this.

    else
        print('No formatter configured for (' .. buf_filetype .. ') filetype')
    end
end

vim.api.nvim_set_keymap('n', '<leader>ff', ":lua Buf_fmt()<CR>", {
    noremap = true,
    silent = false,
    desc = 'Format [F]ile'
})


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- From kickstart.nvim 
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
