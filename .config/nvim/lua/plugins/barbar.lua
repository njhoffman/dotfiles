local plugin = {}
local map = require("utils.core").map

function set_config()
  if vim.g.bufferline ~= nil then
    vim.g.bufferline.animation = true
    vim.g.bufferline.auto_hide = false
    vim.g.bufferline.tabpages = true
    vim.g.bufferline.closable = true
    vim.g.bufferline.clickable = true
    vim.g.bufferline.icons = true
    vim.g.bufferline.icon_custom_colors = false
    vim.g.bufferline.icon_separator_active = "▎"
    vim.g.bufferline.icon_separator_inactive = "▎"
    vim.g.bufferline.icon_close_tab = ""
    vim.g.bufferline.icon_close_tab_modified = "●"
    vim.g.bufferline.maximum_padding = 4
    vim.g.bufferline.semantic_letters = true
    vim.g.bufferline.letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP"
    vim.g.bufferline.no_name_title = null
  end
end

function set_mapping()
  -- map("n", "H", ":BufferPrev<CR>")
  -- map("n", "L", ":BufferNext<CR>")
  -- map("n", "<Leader>D", ":BufferCloseAllButCurrent<CR>")
  -- nnoremap <silent>    <A-1> :BufferGoto 1<CR>
  -- nnoremap <silent>    <A-2> :BufferGoto 2<CR>
  -- nnoremap <silent>    <A-3> :BufferGoto 3<CR>
  -- nnoremap <silent>    <A-4> :BufferGoto 4<CR>
  -- nnoremap <silent>    <A-5> :BufferGoto 5<CR>
  -- nnoremap <silent>    <A-6> :BufferGoto 6<CR>
  -- nnoremap <silent>    <A-7> :BufferGoto 7<CR>
  -- nnoremap <silent>    <A-8> :BufferGoto 8<CR>
  -- nnoremap <silent>    <A-9> :BufferLast<CR>
  --
  --
  -- " Magic buffer-picking mode
  -- nnoremap <silent> <C-s>    :BufferPick<CR>
  -- " Move to previous/next
  -- nnoremap <silent>    <A-,> :BufferPrevious<CR>
  -- nnoremap <silent>    <A-.> :BufferNext<CR>
  -- " Re-order to previous/next
  -- nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
  -- nnoremap <silent>    <A->> :BufferMoveNext<CR>
  -- " Goto buffer in position...
  -- nnoremap <silent>    <A-1> :BufferGoto 1<CR>
  -- nnoremap <silent>    <A-2> :BufferGoto 2<CR>
  -- nnoremap <silent>    <A-3> :BufferGoto 3<CR>
  -- nnoremap <silent>    <A-4> :BufferGoto 4<CR>
  -- nnoremap <silent>    <A-5> :BufferGoto 5<CR>
  -- nnoremap <silent>    <A-6> :BufferGoto 6<CR>
  -- nnoremap <silent>    <A-7> :BufferGoto 7<CR>
  -- nnoremap <silent>    <A-8> :BufferGoto 8<CR>
  -- nnoremap <silent>    <A-9> :BufferLast<CR>
  -- " Close buffer
  -- nnoremap <silent>    <A-c> :BufferClose<CR>
  -- " Wipeout buffer
  -- "                          :BufferWipeout<CR>
  -- " Close commands
  -- "                          :BufferCloseAllButCurrent<CR>
  -- "                          :BufferCloseBuffersLeft<CR>
  -- "                          :BufferCloseBuffersRight<CR>
end

function plugin.load()
  -- lua print(vim.inspect(require"bufferline.state"))
  set_config()
  set_mapping()
end

function plugin.setup(use)
  use {"romgrk/barbar.nvim", config = plugin.load, requires = "romgrk/doom-one.vim"}
end

return plugin
