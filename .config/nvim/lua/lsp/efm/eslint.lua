-- ----------------------------------------------------------------------------
-- ESLint detection
local M = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT} --fix-to-stdout",
  formatStdin = true,
}
return M
