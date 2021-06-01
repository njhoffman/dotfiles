local dap = require("dap")
local map = require "utils.core".map

vim.g.dap_virtual_text = true

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/.local/share/nvim/adapters/node/out/src/nodeDebug.js"}
}

dap.configurations.javascript = {
  {
    type = "node2",
    request = "launch",
    program = "${workspaceFolder}/${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal"
  }
}

dap.configurations.javascriptreact = {
  {
    type = "node2",
    request = "launch",
    -- program = "${workspaceFolder}/${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal"
  }
}

dap.configurations.typescript = {
  {
    type = "node2",
    request = "launch",
    program = "${workspaceFolder}/${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal"
  }
}

return dap
-- git clone https://github.com/microsoft/vscode-node-debug2.git
-- cd vscode-node-debug2
-- npm install
-- gulp build
-- npm run build
