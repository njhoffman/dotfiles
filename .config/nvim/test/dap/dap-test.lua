-- 1. Open a Neovim instance (instance A)
-- 2. Launch the DAP server with (A) >
--  :lua require"osv".launch()
-- < Note: Write down the port number
-- 3. Open another Neovim instance (instance B)
-- 4. Open `myscript.lua` (B)
-- 5. Place a breakpoint on line 2 using (B) >
--   :lua require"dap".toggle_breakpoint()
-- <6. Connect the DAP client using (B) >
--   :lua require"dap".continue()
-- < Note: host - Press return, leave default
--        port - Enter the port you wrote down
-- 7. Run `myscript.lua` in the other instance (A) >
--   :luafile myscript.lua
-- <8. The breakpoint should hit and freeze the instance (B)
-- or lua require"osv".run_this()

local M = {}
function M.output(n)
  print(n)
end

print("start")
for i = 1, 10 do
  M.output(i)
end
print("end")
