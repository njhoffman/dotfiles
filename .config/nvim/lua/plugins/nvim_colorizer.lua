local plugin = {}

function plugin.load()
  require "colorizer".setup(
    {
      "*",
      css = {mode = "background"}
    },
    {mode = "foreground", names = false}
  )
end

function plugin.setup(use)
  use {"norcalli/nvim-colorizer.lua", config = plugin.load}
end

return plugin

-- RGB      = true;         -- #RGB hex codes
-- RRGGBB   = true;         -- #RRGGBB hex codes
-- names    = true;         -- "Name" codes like Blue
-- RRGGBBAA = false;        -- #RRGGBBAA hex codes
-- rgb_fn   = false;        -- CSS rgb() and rgba() functions
-- hsl_fn   = false;        -- CSS hsl() and hsla() functions
-- css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- -- Available modes: foreground, background
-- mode     = 'background'; -- Set the display mode.
--  |:ColorizerAttachToBuffer|

-- Attach to the current buffer and start highlighting with the settings as
-- specified in setup (or the defaults).

-- If the buffer was already attached (i.e. being highlighted), the settings will
-- be reloaded with the ones from setup. This is useful for reloading settings
-- for just one buffer.

-- |:ColorizerDetachFromBuffer|

-- Stop highlighting the current buffer (detach).

-- |:ColorizerReloadAllBuffers|

-- Reload all buffers that are being highlighted with new settings from the setup
-- settings (or the defaults). Shortcut for ColorizerAttachToBuffer on every
-- buffer.

-- |:ColorizerToggle|

-- Toggle highlighting of the current buffer.
