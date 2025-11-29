local M = {}

M.setup = function()
    -- completeopt is used to manage code suggestions
    -- menuone: show popup even when there is only one suggestion
    -- noinsert: Only insert text when selection is confirmed
    -- noselect: force us to select one from the suggestions
    vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }

    -- shortmess is used to avoid excesive messages
    vim.opt.shortmess = vim.opt.shortmess + { c = true }


    local cmp = require "cmp"
    cmp.setup({
        mapping = {
            -- Shift+TaB to go to the Previous suggested item
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            -- Tab to go to the next suggestion
            ['<Tab>'] = cmp.mapping.select_next_item(),
            -- CTRL+SHIFT+f to scroll backwards in description
            ['<A-S-f>'] = cmp.mapping.scroll_docs(-4),
            -- CTRL+F to scroll forwards in the description
            ['<A-f>'] = cmp.mapping.scroll_docs(4),
            -- CTRL+SPACE to bring up completion at current cursor location
            ['<C-Space>'] = cmp.mapping.complete(),
            -- CTRL+e to exit suggestion and close it
            ['<C-e>'] = cmp.mapping.close(),
            -- CR (enter or return) to confirm the currently selected suggeestion
            -- we set the ConfirmBehavior to insert the selected suggestion
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
            })
        },

        -- sources are the installed sources that can be used for code suggestions
        sources = {
            { name = 'path' },
            { name = 'nvim_lsp',               keyword_length = 3 },
            { name = 'nvim_lsp_signature_help' },
            { name = 'buffer',                 keyword_length = 2 },
            { name = "codeium" }
        },

        -- Add borders to the windows
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        -- Add formatting of the different sources
        formatting = {
            fields = { 'menu', 'abbr', 'kind' },
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = 'λ',
                    buffer = 'b',
                    path = 'p',
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        }
    })
end



local configCodeium = function()
    -- Change '<C-g>' here to any keycode you like.
    -- vim.keymap.set('i', '<leader><Tab>', function() return vim.fn['codeium#Accept']() end,
    --     { expr = true, silent = true })
    -- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
    --     { expr = true, silent = true })
    -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
    --     { expr = true, silent = true })
    -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    local codeium = require("codeium")
    codeium.setup({
        virtual_text = {
            enabled = true,
            key_bindings = {
                accept = '<leader><Tab>'
            }

        },
    })

    -- disable tab
    vim.g.codeium_no_map_tab = true

    require('codeium.util').get_newline = function()
        return "\n"
    end
end

local configCopilot = function()
    vim.keymap.set('i', '<leader><Tab>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNew' }, {
    group = require "tajirhas9.constants".load_plugins_group,
    pattern = { '*' },
    callback = function()
        M.setup()
        -- configCodeium()
        -- configCopilot()
    end
})
