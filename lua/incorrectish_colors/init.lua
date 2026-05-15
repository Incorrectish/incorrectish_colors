local M = {}

---Change incorrectish_colors option (vim.g.incorrectish_colors_config.option)
---It can't be changed directly by modifying that field due to a Neovim lua bug with global variables (incorrectish_colors_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
    local cfg = vim.g.incorrectish_colors_config
    cfg[opt] = value
    vim.g.incorrectish_colors_config = cfg
end

---Apply the colorscheme (same as ':colorscheme incorrectish_colors')
function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = "incorrectish_colors"
    require('incorrectish_colors.highlights').setup()
    require('incorrectish_colors.terminal').setup()
end

local default_config = {
    -- Main options --
    transparent = false,     -- don't set background
    term_colors = true,      -- if true enable the terminal
    ending_tildes = false,    -- show the end-of-buffer tildes
    cmp_itemkind_reverse = false,    -- reverse item kind highlights in cmp menu

    -- Changing Formats --
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        constants = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- center bar (c) transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Related --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl for diagnostics
        background = true,    -- use background color for virtual text
    },
}

---Setup incorrectish_colors.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
    if not vim.g.incorrectish_colors_config or not vim.g.incorrectish_colors_config.loaded then    -- if it's the first time setup() is called
        vim.g.incorrectish_colors_config = vim.tbl_deep_extend('keep', vim.g.incorrectish_colors_config or {}, default_config)
        M.set_options('loaded', true)
    end
    if opts then
        vim.g.incorrectish_colors_config = vim.tbl_deep_extend('force', vim.g.incorrectish_colors_config, opts)
    end
end

function M.load()
  vim.api.nvim_command('colorscheme incorrectish_colors')
end

return M
