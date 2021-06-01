local plugin = {}

function set_config()
  local config = require "config"
  require("lspsaga").init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = "﮻",
    warn_sign = "",
    hint_sign = "◆",
    infor_sign = "",
    dianostic_header_icon = "   ",
    code_action_icon = "",
    code_action_prompt = {enable = true, sign = true, sign_priority = 20, virtual_text = true},
    finder_definition_icon = "   ",
    finder_reference_icon = "   ",
    max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
      open = "o",
      vsplit = "s",
      split = "i",
      quit = {"q", "<C-[>"},
      scroll_down = "<C-f>",
      scroll_up = "<C-b>"
    },
    code_action_keys = {quit = {"q", "<C-[>"}, exec = "<CR>"},
    rename_action_keys = {
      quit = {"<C-c>", "<C-[>"},
      exec = "<CR>" -- quit can be a table
    },
    definition_preview_icon = "   ",
    -- "single" "double" "round" "plus"
    border_style = "round",
    rename_prompt_prefix = "➤"
  }
end

function plugin.load()
  set_config()
end

function plugin.setup(use)
  use {"glepnir/lspsaga.nvim", config = plugin.load}
end

return plugin

--      ﮻  ﱥ    ● ★ ◉ ◎ ◯ ? ✖ Ⓘ ⓧ ⓞ  Ⓘ ◆ ◇ ⬢ ✔ ♥       
--                             
