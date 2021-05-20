local config = require "config"
local u = require "utils.core"
local Formatting = config.Formatting
local Opts = config.Opts

local autocmds = {
  filetypes = {
    {"BufNewFile,BufRead", "*.ejs", "set filetype=html"},
    {"FileType", "markdown", "setlocal wrap spell"},
    {"FileType", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"},
    {"FileType", "toggleterm", "setlocal nonumber norelativenumber"}
  },
  terminal = {
    {"TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]]},
    {"TermOpen", "*", "set nonu"}
  },
  packer = {
    {"BufWritePost", "plugins.lua", "PackerCompile"}
  }
}

-- vim.cmd([[autocmd ColorScheme * lua require("utils.lsp").fix("ColorScheme")]])

-- define tables to insert
local hl_yank = {
  {"TextYankPost", "*", 'lua require"vim.highlight".on_yank()'}
}

local preserve_cursor = {
  {"BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]}
}

local format = {
  {
    "BufWritePre",
    "*",
    [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]]
  }
}

local trim_whitespaces = {
  {"BufWritePre", "*", [[%s/\s\+$//e]]},
  {"BufWritePre", "*", [[%s/\n\+\%$//e]]}
  -- {"BufWritePre", "*.[ch]", [[*.[ch] %s/\%$/\r/e]]}
}

-- insert tables if true or nil
if Opts.preserve_cursor == true or Opts.preserve_cursor == nil then
  table.insert(autocmds, preserve_cursor)
end

if Opts.highlight_yank == true or Opts.highlight_yank == nil then
  table.insert(autocmds, hl_yank)
end

if Formatting.format_on_save == true or Formatting.format_on_save == nil then
  table.insert(autocmds, format)
end

if Formatting.trim_trailing_space == true or Formatting.trim_trailing_space == nil then
  table.insert(autocmds, trim_whitespaces)
end

u.define_augroups(autocmds)