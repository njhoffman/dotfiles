
local hlslens_config = {
  override_lens = function(render, plist, nearest, idx, r_idx)
    local sfw = vim.v.searchforward == 1
    local indicator, text, chunks
    local abs_r_idx = math.abs(r_idx)
    if abs_r_idx > 1 then
      indicator = string.format('%d%s', abs_r_idx, sfw ~= (r_idx > 1) and '' or '')
    elseif abs_r_idx == 1 then
      indicator = sfw ~= (r_idx == 1) and '' or ''
    else
      indicator = ''
    end

    local lnum, col = unpack(plist[idx])
    if nearest then
      local cnt = #plist
      if indicator ~= '' then
        text = string.format('[%s %d/%d]', indicator, idx, cnt)
      else
        text = string.format('[%d/%d]', idx, cnt)
      end
      chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensNear'}}
    else
      text = string.format('[%s %d]', indicator, idx)
      chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
    end
    render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
  end,
  auto_enable = true,
  calm_down = true,
  nearest_only = true,
  nearest_float_when = "always",
  virt_priority = 50,
}

  require"hlslens".setup(hlslens_config)


  -- integrate with vim-visual-multi multiple cursors
  -- aug VMlens
  --   au!
  --   au User visual_multi_start lua require('vmlens').start()
  --   au User visual_multi_exit lua require('vmlens').exit()
  -- aug END
