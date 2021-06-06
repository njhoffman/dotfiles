local plugin = {}

function toggle_comment_custom_commentstring(...)
  local args = {...}
  local commentstring = vim.bo.commentstring
  vim.bo.commentstring = "{/*%s*/}"
  require("kommentary.kommentary").toggle_comment_range(
    args[1],
    args[2],
    require("kommentary.config").get_modes().normal
  )
  vim.api.nvim_buf_set_option(0, "commentstring", commentstring)
end

function plugin.mapping()
  -- Set the extra mapping for toggling a single line in normal mode
  vim.api.nvim_set_keymap(
    "n",
    "gCC",
    '<cmd>lua require("kommentary");kommentary.go(' ..
      require("kommentary.config").context.line .. ", " .. "'toggle_comment_custom_commentstring'" .. ")<cr>",
    {noremap = true, silent = true}
  )

  -- Set the extra mapping for toggling a range with a motion
  vim.api.nvim_set_keymap(
    "n",
    "gC",
    "v:lua.kommentary.go(" ..
      require("kommentary.config").context.init .. ", " .. "'toggle_comment_custom_commentstring'" .. ")",
    {noremap = true, expr = true}
  )

  -- Set the extra mapping for toggling a range with a visual selection
  vim.api.nvim_set_keymap(
    "v",
    "gC",
    '<cmd>lua require("kommentary");kommentary.go(' ..
      require("kommentary.config").context.visual .. ", " .. "'toggle_comment_custom_commentstring'" .. ")<cr>",
    {noremap = true, silent = true}
  )
end

function plugin.load()
  require("kommentary.config").configure_language("default", {prefer_single_line_comments = true})
  -- plugin.mapping()
end

function plugin.setup(use)
  use {"b3nj5m1n/kommentary"}
  plugin.load()
end

return plugin
