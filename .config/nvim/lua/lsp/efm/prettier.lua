-- ----------------------------------------------------------------------------
-- Prettier formatter
-- ----------------------------------------------------------------------------

local M = {
  formatCommand = "prettier --stdin-filepath ${INPUT} --single-quote --arrow-parens 'avoid' --trailing-comma all",
  formatStdin = true
}

return M
