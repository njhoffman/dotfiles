local Plugin = {}

-- require("dapui").open()
-- require("dapui").close()
-- require("dapui").toggle()

Plugin.load = function()
  require("dapui").setup {
    icons = {
      expanded = "|>",
      collapsed = "λ"
    },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = {"<CR>", "<2-LeftMouse>"},
      open = "o",
      remove = "d",
      edit = "e"
    },
    sidebar = {
      elements = {
        -- You can change the order of elements in the sidebar
        "scopes",
        "breakpoints",
        "stacks",
        "watches"
      },
      width = 40,
      position = "left" -- Can be "left" or "right"
    },
    tray = {
      elements = {
        "repl"
      },
      height = 10,
      position = "bottom" -- Can be "bottom" or "top"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil -- Floats will be treated as percentage of your screen.
    }
  }
  vim.fn.sign_define("DapBreakpoint", {text = "■", texthl = "DAPBreakpointSign", linehl = "", numhl = ""})
  vim.fn.sign_define("DapStopped", {text = "🛑", texthl = "", linehl = "", numhl = ""})
  -- vim.fn.sign_define("DapLogPoint", {text = "🛑", texthl = "", linehl = "", numhl = ""})
  -- if !hlexists('DAPBreakpointSign')
  --   highlight link DAPBreakpointSign error
  -- endif
  -- if !hlexists('DAPLogPointSign')
  --   highlight link DAPLogPointSign todo
  -- endif

  -- " Completion
  -- au FileType dap-repl lua require('dap.ext.autocompl').attach()
  -- automatic completion trigger
  -- au FileType dap-repl lua require('dap.ext.autocompl').attach()
  -- vim.fn.sign_define('DapBreakpoint', {text='■', texthl='DAPBreakpointSign', linehl='', numhl='DAPBreakpointSign'})
  -- vim.fn.sign_define('DapLogPoint', {text='◆', texthl='DAPLogPointSign', linehl='', numhl='DAPLogPointSign'})
  -- vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='debugPC', numhl=''})

  local map = require("utils.core").map
  map("n", "<F8>", [[:lua require('dap').continue()<CR>]])
  map("n", "<F9>", [[:lua require('dap').step_over()<CR>]])
  map("n", "<F10>", [[:lua require('dap').step_into()<CR>]])
  map("n", "<F11>", [[:lua require('dap').step_out()<CR>]])
  map("n", "<S-F12>", [[:lua require('dap').repl.run_last()<CR>]])
  map("n", "<leader>tb", [[:lua require"dap".toggle_breakpoint()<CR>]])
  map("n", "<leader>cb", [[:lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>]])
  map("n", "<leader>lb", [[:lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>]])
end

Plugin.setup = function(use)
  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap"
    },
    config = Plugin.load
  }
end

return Plugin

-- require("dapui").float_element(<element ID>)
-- require("dapui").eval(<expression>)
-- map("n", "F8", '<cmd>lua require"dap".continue()<CR>')
-- map("n", "F9", '<cmd>lua require"dap".step_over()<CR>')
-- map("n", "F10", '<cmd>lua require"dap".step_into()<CR>')
-- map("n", "F11", '<cmd>lua require"dap".step_out()<CR>')
-- map("n", "<leader>bt", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
-- map("n", "<leader>cb", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- map("n", "<leader>lb", '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- map("n", "<leader>ro", '<cmd>lua require"dap".repl.open()<CR>')
-- map("n", "<leader>rl", '<cmd>lua require"dap".repl.run_last()<CR>')

-- telescope-dap
-- map("n", "<leader>cc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
-- map("n", "<leader>co", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
-- map("n", "<leader>lb", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
-- map("n", "<leader>v", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
-- map("v", "<M-k>", "<Cmd>lua require('dapui').value()<CR>", {noremap = true})
-- map("n", "<leader>tb", [[:lua require('dap').toggle_breakpoint()<CR>]], {})
-- map("n", "<leader>lp", [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], {})
-- map("n", "<leader>td", [[:lua require('dap').repl.open()<CR>]], {})
-- map("n", "<leader>f", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

-- set_breakpoint({condition}, {hit_condition}, {log_message})
--                                                           *dap.set_breakpoint()*

--         Same as |toggle_breakpoint|, but is guaranteed to overwrite previous
--         breakpoint.

-- toggle_breakpoint({condition}, {hit_condition}, {log_message})
--                                                        *dap.toggle_breakpoint()*

--         Creates or removes a breakpoint at the current line.

--         Parameters: ~
--             {condition}     Optional condition that must be met for the debugger
--                             to stop at the breakpoint.
--             {hit_condition} Optional hit condition, e.g. a number as a string
--                             that tells how often this breakpoint should be visited
--                             to stop.
--             {log_message}   Optional log message. This transforms the breakpoint
--                             into a log point. Variable interpolation with {foo} is
--                             supported within the message.

-- list_breakpoints()                                     *dap.list_breakpoints()*

--         Lists all breakpoints and log points in quickfix window.

-- set_exception_breakpoints({filters}, {exceptionOptions})
--                                               *dap.set_exception_breakpoints()*

--     Sets breakpoints on exceptions filtered by `filters`. If `filters` is not
--     provided it will prompt the user to choose from the available filters of the
--     debug adapter.

--     Parameters: ~
--         {filters}          A list of exception types to stop on (optional).
--                            Most debug adapters offer categories like `"uncaught"` and
--                            `"raised"` to filter the exceptions.
--                            If set to "default" instead of a table, the
--                            default options as recommended by the debug adapter are
--                            used.
--         {exceptionOptions} ExceptionOptions[]?
--                            (https://microsoft.github.io/debug-adapter-protocol/specification#Types_ExceptionOptions)

--     >
--         -- Ask user to stop on which kinds of exceptions
--         require'dap'.set_exception_breakpoints()
--         -- don't stop on exceptions
--         require'dap'.set_exception_breakpoints({})
--         -- stop only on certain exceptions (debugpy offers "raised", "uncaught")
--         require'dap'.set_exception_breakpoints({"uncaughted"})
--         require'dap'.set_exception_breakpoints({"raised", "uncaught"})
--         -- use default settings of debug adapter
--         require'dap'.set_exception_breakpoints("default")
--     <

--     You can also set the default value via a `defaults.fallback` table:

--     >
--         require('dap').defaults.fallback.exception_breakpoints = {'raised'}
--     <

--     Or per config/adapter type:

--     >
--         require('dap').defaults.python.exception_breakpoints = {'raised'}
--     <

--     In this example `python` is the type. This is the same type used in
--     |dap-configuration| or the |dap-adapter| definition.

-- step_over([{opts}])                                            *dap.step_over()*
--         Requests the debugee to run again for one step.

--         For {opts} see |step_into|.

-- step_into([{opts}])                                            *dap.step_into()*
--         Requests the debugee to step into a function or method if possible.
--         If it cannot step into a function or method it behaves like
--         |dap.step_over()|.

--         If the debug adapter has the `supportsStepInTargetsRequest` and
--         {ask_for_targets} is true, the user can choose into which function they
--         want to step into if there are multiple.

--         Some debug adapters allow a more fine-grained control over the
--         behavior of this command using the {opts} parameter:

--         steppingGranularity:
--           Can be 'statement' | 'line' | 'instruction'
--           Will fall back to dap.defaults.fallback.stepping_granularity
--           Default: 'statement'

--         askForTargets:
--           Ask the user to step into which function if there are multiple choices.
--           Only for step_into.

-- step_out([{opts}])                                              *dap.step_out()*
--         Requests the debugee to step out of a function or method if possible.

--         For options see |step_into|.

-- step_back([{opts}]                                             *dap.step_back()*
--         Steps one step back. Debug adapter must support reverse debugging.

--         For {opts} see |step_into|.

-- pause({thread_id})                                                 *dap.pause()*
--         Requests debug adapter to pause a thread. If there are multiple threads
--         it stops `thread_id` from the optional parameter or asks the user which
--         thread to pause.

-- reverse_continue()                                      *dap.reverse_continue()*
--         Continues execution reverse in time until last breakpoint.
--         Debug adapter must support reverse debugging.

-- up()                                                                  *dap.up()*
--         Go up in current stacktrace without stepping.

-- down()                                                              *dap.down()*
--         Go down in current stacktrace without stepping.

-- goto_({line})                                                      *dap.goto_()*
--         Let the debugger jump to a specific line or line under cursor.

--         Parameters: ~
--             {line}  Line number or line under cursor if nil.

-- repl.open({winopts}, {wincmd})                                 *dap.repl.open()*
--         Open a REPL / Debug-console.

--         Parameters: ~
--             {winopts}  optional table which may include:
--                         `height` to set the window height
--                         `width` to set the window width
--                         Any other key/value pair, that will be treated as window
--                         option.

--             {wincmd} command that is used to create the window for
--                      the REPL. Defaults to 'belowright split'

--         The REPL can be used to evaluate expressions. A `omnifunc` is set to
--         support completion of expressions. It supports the following special
--         commands:

--           .exit               Closes the REPL
--           .c or .continue     Same as |dap.continue|
--           .n or .next         Same as |dap.step_over|
--           .into               Same as |dap.step_into|
--           .into_target        Same as |dap.step_into{askForTargets=true}|
--           .out                Same as |dap.step_out|
--           .up                 Same as |dap.up|
--           .down               Same as |dap.down|
--           .goto               Same as |dap.goto_|
--           .scopes             Prints the variables in the current scopes
--           .threads            Prints all threads
--           .frames             Print the stack frames
--           .capabilities       Print the capabilities of the debug adapter
--           .b or .back         Same as |dap.step_back|
--           .rc or
--           .reverse-continue   Same as |dap.reverse_continue|

--         You can customize the commands by overriding `dap.repl.commands`:
--         >
--           dap.repl.commands = vim.tbl_extend('force', dap.repl.commands, {
--             continue = {'.continue', '.c'},
--             next_ = {'.next', '.n'},
--             back = {'.back', '.b'},
--             reverse_continue = {'.reverse-continue', '.rc'},
--             into = {'.into'},
--             into_target = {'.into_target'},
--             out = {'.out'},
--             scopes = {'.scopes'},
--             threads = {'.threads'},
--             frames = {'.frames'},
--             exit = {'exit', '.exit'},
--             up = {'.up'},
--             down = {'.down'},
--             goto_ = {'.goto'},
--             capabilities = {'.capabilities'},
--             -- add your own commands
--             custom_commands = {
--               ['.echo'] = function(text)
--                 dap.repl.append(text)
--               end
--             },
--           }
--         <

-- repl.toggle({winopts}, {wincmd})                             *dap.repl.toggle()*
--         Opens the REPL if it is closed, otherwise closes it.
--         See |dap.repl.open| for a description of the argument.

-- repl.close()                                                  *dap.repl.close()*
--         Closes the REPL if it is open.

-- set_log_level(level)                                       *dap.set_log_level()*
--         Sets the log level. Defaults to `INFO`  >

--             :lua require('dap').set_log_level('TRACE')
-- <
--         Available log levels:
--           TRACE
--           DEBUG
--           INFO
--           WARN
--           ERROR

--         The log file is in the |stdpath| `cache` folder.
--         To print the location:  >

--             :lua print(vim.fn.stdpath('cache'))
-- <
--         The filename is `dap.log`
-- session()                                                        *dap.session()*
--         Returns the current session or nil if no session exists.
-- status()
--         Returns the status of the current debug session as text
--         This is intended to be used within the statusline
--         If no debug session is active the result is empty.
