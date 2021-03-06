local config = require "config"
local u = require "utils.core"
local Formatting = config.Formatting
local Opts = config.Opts

-- relative in normal mode, absolute in insert
-- af(
--   "BufEnter,FocusGained,InsertLeave",
--   "*",
--   function()
--     if vim.bo.filetype ~= "dashboard" then
--       vim.wo.relativenumber = true
--     end
--   end
-- )
-- af(
--   "BufLeave,FocusLost,InsertEnter",
--   "*",
--   function()
--     vim.wo.relativenumber = false
--   end
-- )
-- local M = {}

-- M.vimadeCheck = function()
--   if vim.bo.filetype == "dapui_scopes" then vim.cmd([[VimadeBufDisable]]) end
--   -- print(vim.bo.filetype)
-- end

local autocmds = {
  Mundo = { { "FileType", "Mundo", "noremap <buffer>  :q<cr>" } },
  helpfile = { { "FileType", "help", "noremap <buffer> q :q<cr>" }, { "FileType", "help", "noremap <buffer>  :q<cr>" } },
  fasd = { { "BufWinEnter,BufFilePost", "*", [[call Fasd_update()]] } },

  FiletypeDetect = {
    { "BufNewFile,BufRead", "*.ejs", "set ft=html" },
    { "BufNewFile,BufRead", "*.bash*", "let b:is_bash = 1 | setfiletype sh" },
    { "BufNewFile,BufRead", ".env.*", "setlocal ft=config syn=config" },
    { "BufNewFile,BufRead", "*.env", "setlocal ft=config syn=config" },
    { "BufNewFile,BufRead", "*.md", "setlocal ft=markdown.pandoc conceallevel=3 nospell wrap" },
    { "BufNewFile,BufRead", ".tasks", "setlocal ft=dosini" },
    { "BufNewFile,BufRead", ".vimtasks", "setlocal ft=dosini" },
    { "BufNewFile,BufRead", "Dockerfile*", "setlocal ft=dockerfile" },
    { "BufNewFile,BufRead", ".dockerignore", "setlocal ft=gitignore" },
    { "BufNewFile,BufRead", "nord-nick.lua", "setlocal ft=lua.lush" },
    { "BufNewFile,BufRead", "nord-nvim.lua", "setlocal ft=lua.lush" },

    --   au BufNewFile,BufRead *.module setlocal ft=php syn=php
    --   " force bash syntax for shell scripts by default custom syntax extension assignments
    --   au BufNewFile,BufRead .pa set ft=config
    --   au BufNewFile,BufRead Chart.yaml  set ft=helm
    --   au BufNewFile,BufRead values.yaml set ft=helm
    --   au BufNewFile,BufRead */templates/*.yaml set ft=helm
    --   au BufNewFile,BufRead */templates/*.tpl set ft=helm
    --   au BufNewFile,BufRead */templates/*.txt set ft=helm
    --   au BufNewFile,BufRead */ansible/*.yml  set ft=yaml.ansible
    --   au BufNewFile,BufRead *.j2,*/ansible/*/templates/* set ft=config.jinja2
    --   au BufNewFile,BufRead bundles.txt setlocal ft=sh
    --   au BufNewFile,BufRead bundles.*.txt setlocal ft=sh
    --   au BufNewFile,BufRead *.sock setlocal ft=systemd
    --   au BufNewFile,BufRead *.service setlocal ft=systemd
    --   " au BufEnter * if &bufhidden =~ 'wipe' && &buftype =~ 'nofile' | setf preview | endif
  },
  vimade = {
    -- { "CompleteChanged", "*", "redraw" },
    -- { "FocusLost", "*", "VimadeFadeActive" },
    -- { "FocusGained", "*", "VimadeUnfadeActive" },
    -- { "BufLeave,FocusLost", "*", M.vimadeCheck() },
    -- { "BufEnter", "dapui_scopes", "VimadeBufDisable" },
    -- { "BufEnter", "dapui_breakpoints", "VimadeBufDisable" },
    -- { "BufEnter", "dapui_watches", "VimadeBufDisable" },
    -- { "BufEnter", "dapui_stacks", "VimadeBufDisable" },
    -- { "BufEnter", "dap-repl", "VimadeBufDisable" },

  },
  filetypes = {
    { "FileType", "lua.lush", "" },
    { "FileType", "markdown.pandoc", "set conceallevel=3 nospell wrap" },
    { "FileType", "markdown.pandoc", "hi! markdownH1 guifg=#45a5f8" },
    { "FileType", "markdown.pandoc", "hi! markdownH2 guifg=#45a5e8" },
    { "FileType", "markdown.pandoc", "hi! markdownH3 guifg=#45a5d8" },
    { "FileType", "markdown.pandoc", "hi! markdownH4 guifg=#45a5c8" },
    { "FileType", "markdown.pandoc", "hi! markdownH5 guifg=#45a5b8" },
    { "FileType", "markdown.pandoc", "hi! markdownH6 guifg=#45a5a8" },
    -- { "FileType", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
    { "FileType", "toggleterm", "setlocal nonumber norelativenumber" },
  },
  Shape = {
    -- { "FocusLost", "*", "hi TermCursor cterm=NONE gui=NONE" },
    -- { "FocusGained", "*", "hi TermCursor cterm=reverse gui=reverse"},
    { "VimLeave,VimSuspend", "*", "set guicursor=a:block-blinkon90" },
  },
  terminal = { { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] }, { "TermOpen", "*", "set nonu" } },
  packer = {
    { "BufWritePost", "plugins.lua", "PackerCompile" },
    { "BufWritePost", "plugins-config.lua", "PackerCompile" },
    {
      "User",
      "PackerComplete,PackerCompileDone",
      "call bufferline#highlight#setup() | lua require('feline').reset_highlights()",
    },
  },
  -- lsp = {
  --   {"CursorHold,CursorHoldI", "*", "lua require'nvim-lightbulb'.update_lightbulb()"}
  -- }
}

-- define tables to insert
local hl_yank = { { "TextYankPost", "*", "silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }" } }

local preserve_cursor = {
  { "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]] },
}

local trim_whitespaces = {
  { "BufWritePre", "*", [[%s/\s\+$//e]] },
  { "BufWritePre", "*", [[%s/\n\+\%$//e]] },
  -- {"BufWritePre", "*.[ch]", [[*.[ch] %s/\%$/\r/e]]}
}

-- insert tables if true or nil
if Opts.preserve_cursor == true or Opts.preserve_cursor == nil then table.insert(autocmds, preserve_cursor) end

if Opts.highlight_yank == true or Opts.highlight_yank == nil then table.insert(autocmds, hl_yank) end

--[[ if Formatting.format_on_save == true or Formatting.format_on_save == nil then
  -- table.insert(autocmds, format)
end ]]

if Formatting.trim_trailing_space == true or Formatting.trim_trailing_space == nil then
  table.insert(autocmds, trim_whitespaces)
end

u.define_augroups(autocmds)
