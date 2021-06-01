local plugin = {}

function plugin.load()
  local map = require("utils.core").map
  require("which-key").setup {
    window = {
      border = "shadow",
      position = "bottom",
      margin = {1, 0, 1, 0},
      padding = {2, 2, 2, 2}
    }
  }
  map("n", "<leader>wk", ":WhichKey<CR>", {silent = true})
end

-- :WhichKey " show all mappings
-- :WhichKey <leader> " show all <leader> mappings
-- :WhichKey <leader> v " show all <leader> mappings for VISUAL mode
-- :WhichKey '' v " show ALL mappings for VISUAL mode

-- ' or ` ... Marks , "(NRML) or <c-r>(INST) ... Registers
-- :h

function plugin.setup(use)
  use {"folke/which-key.nvim", config = plugin.load}
end

return plugin
--
-- defaults
-- {
--   plugins = {
--     marks = true, -- shows a list of your marks on ' and `
--     registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--     -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--     -- No actual key bindings are created
--     spelling = {
--       enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--       suggestions = 20, -- how many suggestions should be shown in the list?
--     },
--     presets = {
--       operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
--       motions = true, -- adds help for motions
--       text_objects = true, -- help for text objects triggered after entering an operator
--       windows = true, -- default bindings on <c-w>
--       nav = true, -- misc bindings to work with windows
--       z = true, -- bindings for folds, spelling and others prefixed with z
--       g = true, -- bindings for prefixed with g
--     },
--   },
--   -- add operators that will trigger motion and text object completion
--   -- to enable all native operators, set the preset / operators plugin above
--   operators = { gc = "Comments" },
--   key_labels = {
--     -- override the label used to display some keys. It doesn't effect WK in any other way.
--     -- For example:
--     -- ["<space>"] = "SPC",
--     -- ["<cr>"] = "RET",
--     -- ["<tab>"] = "TAB",
--   },
--   icons = {
--     breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--     separator = "➜", -- symbol used between a key and it's label
--     group = "+", -- symbol prepended to a group
--   },
--   window = {
--     border = "none", -- none, single, double, shadow
--     position = "bottom", -- bottom, top
--     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
--     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--   },
--   layout = {
--     height = { min = 4, max = 25 }, -- min and max height of the columns
--     width = { min = 20, max = 50 }, -- min and max width of the columns
--     spacing = 3, -- spacing between columns
--     align = "left", -- align columns left, center or right
--   },
--   ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
--   hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
--   show_help = true, -- show help message on the command line when the popup is visible
--   triggers = "auto", -- automatically setup triggers
--   -- triggers = {"<leader>"} -- or specify a list manually
--   triggers_blacklist = {
--     -- list of mode / prefixes that should never be hooked by WhichKey
--     -- this is mostly relevant for key maps that start with a native binding
--     -- most people should not need to change this
--     i = { "j", "k" },
--     v = { "j", "k" },
--   },

-- local wk = require("which-key")
-- As an example, we will the following mappings:
--  1. <leader>fn new file
--  2. <leader>fr show recent files
--  2. <leader>ff find files

-- wk.register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--   },
-- }, { prefix = "<leader>" })
-- -- }

-- local mappings = {
--     ["<leader>"] = {
--         ["!"] = "close all buffers but current",
--         ["*"] = "save all buffers",
--         ["b"] = "show buffers",
--         ["q"] = "quit buffer",
--         ["w"] = "save",
--         ["e"] = "explorer",
--         ["u"] = "undotree",
--         ["h"] = "no highlight",
--         ["["] = {"<cmd>bprev<cr>", "prev buffer"},
--         ["]"] = {"<cmd>bnext<cr>", "next buffer"},
--         f = {
--             name = "find",
--             c = {"<cmd>Telescope colorscheme<cr>", "colorscheme"},
--             f = {"<cmd>Telescope find_files<cr>", "file"},
--             g = {"<cmd>Telescope live_grep<cr>", "grep text"},
--             h = {"<cmd>Telescope help_tags<cr>", "vim tags"},
--             n = {"<cmd>lua require('utils.core').search_nvim()<cr>", "nvim dotfiles"},
--             o = {"<cmd>Telescope oldfiles<cr>", "recent files"},
--             p = "personal config",
--             pc = {"<cmd>e ~/.config/nvim/lua/config.lua<cr>", "config"},
--             pi = {"<cmd>e ~/.config/nvim/lua/init.lua<cr>", "init"},
--             pp = {"<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "plugins"},
--             ps = {"split"},
--             psc = {"<cmd>vsp ~/.config/nvim/lua/config.lua<cr>", "split config"},
--             psi = {"<cmd>vsp ~/.config/nvim/lua/init.lua<cr>", "split init"},
--             psp = {"<cmd>vsp ~/.config/nvim/lua/plugins.lua<cr>", "split plugins"}
--         },
--         n = {
--             name = "new",
--             f = "create new file",
--             s = "create new file in a split",
--             t = "create new file in tab"
--         },
--         g = {
--             name = "git",
--             f = {"<cmd>Telescope git_files<cr>", "files"},
--             c = {"<cmd>Telescope git_commits<cr>", "commits"},
--             b = {"<cmd>Telescope git_branches<cr>", "branches"},
--             s = {"<cmd>Telescope git_status<cr>", "status"},
--             n = {"<cmd>Gitsigns next_hunk<cr>", "next hunk"},
--             p = {"<cmd>Gitsigns prev_hunk<cr>", "prev hunk"},
--             v = {"<cmd>Gitsigns preview_hunk<cr>", "preview hunk"},
--             r = {"<cmd>Gitsigns reset_hunk<cr>", "reset hunk"},
--             R = {"<cmd>Gitsigns reset_buffer<cr>", "reset buffer"}
--         },
--         l = {
--             name = "LSP",
--             a = {"<cmd>Lspsaga code_action<cr>", "code action"},
--             A = {"<cmd>Lspsaga range_code_action<cr>", "selected action"},
--             d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "document diagnostics"},
--             D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "workspace diagnostics"},
--             l = {"<cmd>Lspsaga show_line_diagnostics<cr>", "line diagnostics"},
--             f = {"<cmd>Lspsaga lsp_finder<cr>", "LSP finder"},
--             i = {"<cmd>LspInfo<cr>", "LSP info"},
--             k = {"<cmd>Lspsaga signature_help<cr>", "LSP signature help"},
--             h = {"<cmd>Lspsaga hover_doc<cr>", "hover document"},
--             F = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "format"},
--             p = {"<cmd>Lspsaga preview_definition<cr>", "preview definition"},
--             r = {"<cmd>Lspsaga rename<cr>", "rename"},
--             s = {"<cmd>Telescope lsp_document_symbols<cr>", "document symbols"},
--             S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbols"},
--             ["'"] = "LSP start",
--             ["'t"] = {"<cmd>LspStart TsServer<cr>", "javascript, typescript"},
--             ["'e"] = {"<cmd>LspStart emmet_ls<cr>", "emmet"},
--             ["'b"] = {"<cmd>LspStart bashls<cr>", "bash"},
--             ["'l"] = {"<cmd>LspStart sumneko_lua<cr>", "lua"},
--             ["'c"] = {"<cmd>LspStart clangd<cr>", "C/C++"},
--             ["'j"] = {"<cmd>LspStart jsonls<cr>", "json"},
--             ["'p"] = {"<cmd>LspStart pyright<cr>", "python"},
--             ["'L"] = {"<cmd>LspStart texlab<cr>", "latex"},
--             ["'h"] = {"<cmd>LspStart html<cr>", "HTML"},
--             ["'C"] = {"<cmd>LspStart cssls<cr>", "CSS"},
--             ["."] = {"LSP stop"},
--             [".a"] = {"<cmd>LspStop<cr>", "stop all"},
--             [".s"] = {"select"}
--         },
--         j = {
--             name = "jump windows",
--             h = {"<cmd>wincmd h<cr>", "Left"},
--             j = {"<cmd>wincmd j<cr>", "Down"},
--             k = {"<cmd>wincmd k<cr>", "Up"},
--             l = {"<cmd>wincmd l<cr>", "Right"}
--         },
--         T = {
--             name = "tabs",
--             n = {"<cmd>tabnext<cr>", "next"},
--             p = {"<cmd>tabprevious<cr>", "previous"},
--             q = {"<cmd>tabclose<cr>", "quit tab"}
--         },
--         t = {
--             name = "text",
--             [","] = "add comma to end of line",
--             [";"] = "add semicolon to end of line",
--             [":"] = "add colon to end of line",
--             u = "lowercase",
--             U = "uppercase",
--             S = "source file"
--         },
--         s = {
--             name = "session",
--             s = {"<cmd>SSave<cr>", "session save"},
--             c = {"<cmd>SClose<cr>", "session close"},
--             d = {"<cmd>SDelete<cr>", "session delete"},
--             l = {"<cmd>SLoad<cr>", "session load"}
--         },
--         o = {
--             name = "open",
--             t = {"<cmd>ToggleTerm<cr>", "terminal"},
--             e = {"<cmd>NvimTreeFindFile<cr>", "find current file"}
--         },
--         p = {
--             name = "plugins",
--             u = {"<cmd>PackerUpdate<cr>", "update"},
--             i = {"<cmd>PackerInstall<cr>", "install"},
--             S = {"<cmd>PackerSync<cr>", "sync"},
--             c = {"<cmd>PackerClean<cr>", "clean"},
--             s = {"<cmd>PackerStatus<cr>", "status"}
--         }
--     },
--     ["g"] = {
--         ["V"] = "visually select last edited/pasted text",
--         ["d"] = "LSP definition",
--         ["D"] = "LSP declaration",
--         ["r"] = "LSP declaration",
--         ["y"] = "LSP type definition",
--         ["h"] = "LSP doc",
--         ["c"] = "comment text",
--         ["cc"] = "comment line"
--     },
--     ["s"] = {
--         a = "add surrounding",
--         d = "delete surrounding",
--         db = "automatically seearch and delete",
--         r = "replace surrounding",
--         rb = "automatically search and select to replace"
--     }
-- }
