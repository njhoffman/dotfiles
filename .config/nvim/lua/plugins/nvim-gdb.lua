local plugin = {}

function plugin.load()
  local map = require("utils.core").map
end

-- brew install bashdb
-- apt-get install lldb

function plugin.setup(use)
  use {
    "sakhnik/nvim-gdb",
    run = "./install.sh",
    config = plugin.load
  }
end

-- You can create a watch window evaluating a backend command on every step. Try :GdbCreateWatch info locals in GDB, for istance.
-- You can open the list of breakpoints or backtrace locations into the location list. Try :GdbLopenBacktrace or :GdbLopenBreakpoints.
-- <Leader>dd	:GdbStart gdb -q ./a.out	Start debugging session, allows editing the launching command
-- <Leader>dl	:GdbStartLLDB lldb ./a.out	Start debugging session, allows editing the launching command
-- <Leader>dp	:GdbStartPDB python -m pdb main.py	Start Python debugging session, allows editing the launching command
-- <Leader>db	:GdbStartBashDB bashdb main.sh	Start BASH debugging session, allows editing the launching command
-- <F8>	:GdbBreakpointToggle	Toggle breakpoint in the coursor line
-- <F4>	:GdbUntil	Continue execution until a given line (until in gdb)
-- <F5>	:GdbContinue	Continue execution (continue in gdb)
-- <F10>	:GdbNext	Step over the next statement (next in gdb)
-- <F11>	:GdbStep	Step into the next statement (step in gdb)
-- <F12>	:GdbFinish	Step out the current frame (finish in gdb)
-- <c-p>	:GdbFrameUp	Navigate one frame up (up in gdb)
-- <c-n>	:GdbFrameDown	Navigate one frame down (down in gdb)

return plugin
