-- vim.cmd(
--   [[
--   let g:vimade = {
--   \ "normalid": '',
--   \ "normalncid": '',
--   \ "basefg": '',
--   \ "basebg": '',
--   \ "fadelevel": 0.4,
--   }]]
-- )
--  vim.g.vimade = {
--    enabletreesitter = 1,
--    basegroups = {
--      "VirtualText",
--      "Search",
--      "SignColumn",
--      "v2hexokinase",
--      "LineNr",
--      "CursorLine",
--      "CursorLineNr",
--      "DiffAdd",
--      "DiffChange",
--      "DiffDelete",
--      "DiffText",
--      "FoldColumn",
--      "Whitespace"
--    },
--    rowbufsize = 15,
--    colbufsize = 15,
--    fadelevel = 0.7,
--    signsretentionperiod = 1000,
--    fadepriority = 50,
--    enablesigns = 1,
--    enablefocusfading = 1
--  }

vim.cmd([[let g:vimade  = {}]])
vim.cmd([[let g:vimade.fadelevel = 0.5]])
vim.cmd([[let g:vimade.enabletreesitter = 1]])
vim.cmd([[let g:vimade.fadepriority = 50]])
vim.cmd([[let g:vimade.colbufsize = 15]])
vim.cmd([[let g:vimade.rowbufsize = 15]])
vim.cmd([[let g:vimade.signsretentionperiod = 1]])
vim.cmd([[let g:vimade.enablefocusfading = 1]])

-- print(vim.inspect(vim.g.vimade.fadelevel))
