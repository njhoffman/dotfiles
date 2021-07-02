--- DAP interactions
local dap_maps = {
  ["<F8>"] = { "<cmd>lua require('dap').continue()<cr>", "dap continue" },
  ["<F9>"] = { "<cmd>lua require('dap').step_over()<cr>", "dap step-over" },
  ["<F10>"] = { "<cmd>lua require('dap').step_into()<cr>", "dap step-into" },
  ["<F11>"] = { "<cmd>lua require('dap').step_out()<cr>", "dap step-out" },
  ["<S-F12>"] = {
    "<cmd>lua require('dap').repl.run_last()<cr>",
    "dap repl run last",
  },
  ["<leader>b"] = {
    name = "+breakpoints",
    ["p"] = { "<cmd>lua require'dap'.set_breakpoint()<cr>", "set breakpoint" },
    ["b"] = {
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      "toggle breakpoint",
    },
    ["t"] = {
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      "toggle breakpoint",
    },
    ["c"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      "conditional breakpoint",
    },
    ["l"] = {
      "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
      "logging breakpoint",
    },
  },
  ["<leader>d"] = {
    name = "+dap",
    ["t"] = { "<cmd>lua require'dapui'.toggle()<cr>", "toggle dap ui" },
    [" "] = { "<cmd>lua require'dap'.continue()<cr>", "start lua dap" },
    ["s"] = {
      "<cmd>lua require'dapui'.toggle('sidebar')<cr>",
      "toggle ui sidebar",
    },
    ["c"] = { "<cmd>lua require'dap'.continue()<cr>", "dap continue" },
    ["i"] = { "<cmd>lua require('dap').step_into()<cr>", "dap step-into" },
    ["o"] = { "<cmd>lua require('dap').step_over()<cr>", "dap step-over" },
    ["r"] = { "<cmd>lua require('dap').repl.toggle()<cr>", "dap repl toggle" },
    -- ["s"] = { "<cmd>DebugStart<cr>", "Start" },
  },
}

-- TODO: vimade buf disable, assign shortcuts to windows, investigate floats
-- require("dapui").open()
-- require("dapui").close()
-- require("dapui").toggle(), toggle("sidebar"), toggle("tray")
-- require("dapui").float_element(<element ID>)
-- require("dapui").eval(<expression>)
-- dap.goto_(15) dap.goto_(), dap. pause, run, restart, stop, list breakpoints,
-- set_exception_breakpoints, run_last, run_to_cursor
-- ["S"] = { "<cmd>lua require'osv'.run_this()<cr>", "start lua dap" },
-- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
-- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

local dap_v_maps = {
  ["<M-k>"] = {
    "<cmd>lua require('dapui').eval()<CR>>",
    "dap evaluate under cursor",
  },
}

local dap_opts = {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local dap_v_opts = {
  mode = "v",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

require("which-key").register(dap_v_maps, dap_v_opts)
require("which-key").register(dap_maps, dap_opts)
