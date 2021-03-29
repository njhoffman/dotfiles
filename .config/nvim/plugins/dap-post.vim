
lua <<EOF
require('hlslens').setup({
    -- enable hlslens after searching
    -- type: boolean
    auto_enable = true,
    -- if calm_down is true, stop hlslens when cursor is out of position range
    -- type: boolean
    calm_down = false,
    -- hackable function for customizing the virtual text
    -- type: function(lnum, loc, idx, r_idx, count, hls_ns)
    override_line_lens = nil
})
EOF

lua <<EOF
  local dap = require('dap')
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/.local/src/vscode-node-debug2/out/src/nodeDebug.js'},
  }
  dap.configurations.javascript = {
    {
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
  }
  vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
  vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
EOF

" vim: ft=lua
