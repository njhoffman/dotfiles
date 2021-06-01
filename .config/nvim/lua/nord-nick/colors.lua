local nord = {
  -- white = "#ECEFF4",
  -- green =         '#A3BE8C',
  -- yellow = "#B48EAD",
  -- paleblue = "#5E81AC",
  -- contrast =      '#434C5E',

  yellow_faded = "#7B6B3B",
  purple_faded = "#6A6CAB",
  red_faded = "#7F212A",
  green_faded = "#128A67",
  blue_faded = "#5171A1",
  white = "#BCBFC4",
  gray = "#9aa2b1",
  black = "#3B4252",
  red = "#BF616A",
  green = "#42AA97",
  yellow = "#AB9B7B",
  paleblue = "#9EB1CC",
  cyan = "#78C0E0",
  blue = "#7191B1",
  purple = "#6A8CCB",
  orange = "#D08770",
  pink = "#AB8B9B",
  nord0_gui = "#2E3440",
  nord1_gui = "#3B4252",
  nord2_gui = "#434C5E",
  nord3_gui = "#4C566A",
  nord3_gui_bright = "#616E88",
  nord4_gui = "#C8CED9",
  nord5_gui = "#D5D9E0",
  nord6_gui = "#DCDFE4",
  nord7_gui = "#8FBCBB",
  nord8_gui = "#88C0D0",
  nord9_gui = "#81A1C1",
  nord10_gui = "#5E81AC",
  nord11_gui = "#BF616A",
  nord12_gui = "#D08770",
  nord13_gui = "#EBCB8B",
  nord14_gui = "#22BB99",
  nord15_gui = "#646EAD",
  bg = "#0E1420",
  bg_alt = "#0B1222",
  fg = "#aaaaba",
  text = "#babaca",
  comments = "#4C566A",
  selection = "#3B4252",
  contrast = "#0C1219",
  active = "#5E81AC",
  border = "#434C5E",
  line_numbers = "#616E88",
  highlight = "#c1c9d6",
  disabled = "#3B4252",
  cursor = "#E5E9F0",
  accent = "#D8DEE9",
  error = "#9F312A",
  link = "#5E81AC",
  none = "NONE"
}

-- Optional colors

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.nord_contrast == true then
  nord.sidebar = nord.bg_alt
  nord.float = nord.bg_alt
else
  nord.sidebar = nord.bg
  nord.float = nord.bg
end

if vim.g.nord_cursorline_transparent == true then
  nord.cursorlinefg = nord.bg
else
  nord.cursorlinefg = nord.nord1_gui
end

return nord
