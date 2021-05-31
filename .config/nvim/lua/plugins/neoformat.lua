local plugin = {}

function plugin.load()
  vim.g.neoformat_basic_format_retab = 1
  vim.g.neoformat_basic_format_trim = 1
  vim.g.neoformat_only_msg_on_error = 1
end

function plugin.setup(use)
  use {"sbdchd/neoformat", config = plugin.load}
end

return plugin
