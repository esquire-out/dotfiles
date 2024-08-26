require('mappings')

require('options')


-- Plugins
require('packer').startup(function(use)

    use "startup-nvim/startup.nvim"

    -- File explorer
    use { 'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
      },
    }

    use 'wbthomason/packer.nvim'

    -- Theme(s)
    use 'shatur/neovim-ayu'
    use 'fenetikm/falcon'
    use 'rockerBOO/boo-colorscheme-nvim'
    use 'PyGamer0/darc.nvim'
    use 'rktjmp/lush.nvim'
    use 'matsuuu/pinkmare'
    use 'marko-cerovac/material.nvim'

    use 'folke/tokyonight.nvim'

    -- WARN  Might be unused!
    use 'romgrk/barbar.nvim'

    -- LuaLine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true}
    }

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Mason
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }
    use 'mfussenegger/nvim-dap'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp' -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- buffer source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets engine
    use 'saadparwaiz1/cmp_luasnip' -- LuaSnip source for nvim-cmp


    -- Highlights
    use {
        'folke/todo-comments.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- TODO  Disable on startup.
    use 'github/copilot.vim'
end)

-- LSP stuff
require('mason').setup()
require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' }

})

local on_attach = function(_, _)
        --vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {
            desc = "List available code actions"
        })

        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {
            desc = "Go to definition"
        })

        vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, {
            desc = "Show error diagnostic"
        })

        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {
            desc = "Show implementation"
        })

        vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {
            desc = "Show references to symbol"
        })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
            -- NOTE Keep in mind that 'K' is not bound by default.
            desc = "Show hover information"
        })

        vim.keymap.set('n', 'T', vim.diagnostic.goto_next, {
            desc = "Go to next Diagnostic message"
        })

        vim.keymap.set('n', 'Y', vim.diagnostic.goto_prev, {
            desc = "Go to previous Diagnostic message"
        })

        vim.keymap.set('n', '<leader>L', require('telescope.builtin').diagnostics, {
            desc = "Show [L]ist of diagnostic messages"
        })
end

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = 'usr/bin/lldb-vscode',
    name = 'lldb'
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function ()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}
    },
}



require('lspconfig').lua_ls.setup {
        on_attach = on_attach
}

-- Server configurations
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

-- Configures mason based on the servers table (?)
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

-- Configures the handlers for each server
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
-- End LSP stuff
local cmp = require('cmp')
local luasnip = require('luasnip')

luasnip.config.setup {}
-- nvim-cmp setup
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- cmp Mappings
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true,}),
    ['<Down>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Up>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'mason' },
  },
}

require('nvim-tree').setup()


require('lualine').setup {
    options = {
        theme = 'nightfly'
    }
}

-- Keep near the end of the file
require('settings')
require('homescreen')
require('comments')

-- Must always be at end of file else it gives me a lot of issues lol
require('copilot').setup()
