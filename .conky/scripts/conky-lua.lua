--[[
  lua script to...
    - draw analog clock & rings (see acknowledgements)
    - track & display max wlan/wifi download & upload speeds
    - place interactive (click) buttons on calendar... for back & forth months  (see acknowledgements)
    - draw 'analog' gauges

  --------------------------------------------------
  Notes: -------------------------------------------

    - To call this script in Conky, add the following lines in conky.rc (above TEXT):
      lua_load ~/Scripts/lua/conky_lua.lua
      lua_draw_hook_pre conky_main

    - For button functions (on calendar)...
      xdotool must be installed on system
      xdotool looks for specific window so add the following line in conky.rc (above TEXT):
        own_window_title click_conky

    - For some reason, if conky is loaded automatically during boot/login,
      the buttons on calendar will not work (I don't know why at this time).

]]

---------------------------------------
----- main setup & initialization -----
---------------------------------------

require 'cairo'

local table_stocks = {stocks = "Stocks Table"}  -- used in: function conky_stock(ticker, qty, buy_price)
local stock_timer = 0                           -- used in: function conky_stock(ticker, qty, buy_price)
local getMonth = os.date("%m")                  -- used in: function conky_calendar() & draw_cal_buttons(cr)
local oldMonth = os.date("%m")                  -- used in: function conky_calendar()
local getYear = tonumber(os.date("%Y"))         -- used in: function conky_calendar() & draw_cal_buttons(cr)
local start1 = 1                                -- used in: function clickfunction()
local start2 = 1                                -- used in: function draw_cal_buttons(cr)

--------------------------
----- Clock settings -----

----- "clock_x" and "clock_y" are pixel coordinates for clock center, from the top left of the Conky window -----
local clock_x = 85
local clock_y = 220

----- clock_r is used to calculate length of clock hands -----
local clock_r = 45

local show_seconds = true

--- clock settings table ---
settings_table = {
  -- Edit this table to customise your rings.
  -- You can create more rings simply by adding more elements to settings_table.

  -- "name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'. (only?)
  -- "arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument.
      --  If you would not use an argument in the Conky variable, use ''.
  -- "max" is the maximum value of the ring. If the Conky variable outputs a percentage, use 100.
  -- "bg_color" is the color of the base ring... use regular rgb color prefixed with 0x as in 0x######
  -- "bg_alpha" is the alpha value of the base ring... 1 = 255 in regular rgba format
  -- "fg_color" is the color of the indicator part of the ring... use regular rgb color prefixed with 0x as in 0x######
  -- "fg_alpha" is the alpha value of the indicator part of the ring... 1 = 255 in regular rgba format
  -- "x" and "y" are the x and y coordinates of the centre of the ring, relative to the top left corner of the Conky window.
  -- "radius" is the radius of the ring.
  -- "thickness" is the thickness of the ring, centred around the radius.
  -- "start_angle" is the starting angle of the ring, in degrees, clockwise from top. Value can be either positive or negative...
  --  but should always be smaller than end_angle...
  -- "end_angle" is the ending angle of the ring, in degrees, clockwise from top. Value can be either positive or negative,
      --  but must be larger than start_angle... so to go from 9 o'clock to 6 o'clock we'd have -90 to 180

  {
    -- HOUR ARC --
    name = 'time',
    arg = '%I.%M',
    max = 12,
    bg_color = 0x0072D6,
    bg_alpha = 0.3,
    -- fg_color = 0x0072D6,
    fg_color = 0x624295,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 50,
    thickness = 2,
    start_angle = 0,
    end_angle = 360
    },
  {
    -- MINUTES ARC --
    name = 'time',
    arg = '%M.%S',
    max = 60,
    bg_color = 0x0072D6,
    bg_alpha = 0.3,
    -- fg_color = 0x0072D6,
    fg_color = 0x624295,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 53,
    thickness = 2,
    start_angle = 0,
    end_angle = 360
  },
  {
    -- SECONDS ARC --
    name = 'time',
    arg = '%S',
    max = 60,
    bg_color = 0x0072D6,
    bg_alpha = 0.3,
    -- fg_color = 0x0072D6,
    fg_color = 0x624295,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 56,
    thickness = 2,
    start_angle = 0,
    end_angle = 360
  },
  {
    -- 12 --
    name = 'time',
    arg = '12',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 40,
    thickness = 15,
    start_angle = 0,
    end_angle = 2
  },
  {
    -- 1 --
    name = 'time',
    arg = '1',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 29,
    end_angle = 31
  },
  {
    -- 2 --
    name = 'time',
    arg = '2',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 59,
    end_angle = 61
  },
  {
    -- 3 --
    name = 'time',
    arg = '3',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 40,
    thickness = 15,
    start_angle = 90,
    end_angle = 92
  },
  {
    -- 4 --
    name = 'time',
    arg = '4',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 119,
    end_angle = 121
  },
  {
    -- 5 --
    name = 'time',
    arg = '5',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 149,
    end_angle = 151
  },
  {
    -- 6 --
    name = 'time',
    arg = '6',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 40,
    thickness = 15,
    start_angle = 180,
    end_angle = 182
  },
  {
    -- 7 --
    name = 'time',
    arg = '7',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 209,
    end_angle = 211
  },
  {
    -- 8 --
    name = 'time',
    arg = '8',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 239,
    end_angle = 241
  },
  {
    -- 9 --
    name = 'time',
    arg = '9',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 40,
    thickness = 15,
    start_angle = 270,
    end_angle = 272
  },
  {
    -- 10 --
    name = 'time',
    arg = '10',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 299,
    end_angle = 301
  },
  {
    -- 11 --
    name = 'time',
    arg = '11',
    max = 60,
    bg_color = 0x5ACCC9,
    bg_alpha = 1.0,
    fg_color = 0x5ACCC9,
    fg_alpha = 1.0,
    x = clock_x, y = clock_y,
    radius = 45,
    thickness = 5,
    start_angle = 329,
    end_angle = 331
  },

}   --- end settings_table ---


----------------------------------------------------
------- functions ----------------------------------
----------------------------------------------------


-- ==================================================
function clickfunction()

  -- defined at top of script: local start1 = 1

  ----- start click logging (requires xdotool) -----
  if start1 == 1 then

    start1 = nil

    -----------------------------------------------------------------
    ----- kill off any duplicate xdotool processes running      -----
    ----- usually caused by editing/saving/restarting lua/conky -----
    ----- and restart xdotool (to match new conky processs)     -----

    -- xdot = conky_parse("${if_running xdotool}1${else}0${endif}")
    -- if tonumber(xdot) == 1 then
    --   os.execute("/usr/bin/killall xdotool && echo 'xdo killed' &")
    -- end
    ----- we use "click_conky" instead of "xdotool" so as not to kill other possible user-generated xdotool processes -----
    local f1 = io.popen("ps -ef | grep conky-float | grep -v grep")
      local xproc = f1:read("*a")
    f1:close()
    if string.len(xproc) ~= 0 then
      os.execute("ps -ef | grep conky-float | grep -v grep | awk  '{print $2}' | xargs kill")
      -- io.write(xproc)
      -- io.write("--- old xdotool process(es) killed ---\n")
     else
      -- io.write("--- no old xdotool process(es) to kill ---\n")
    end

    ------------------------------------------------------------------------
    ----- monitor conky window for mouse click (start/restart xdotool) -----

    ---------------------------------------------------------------------------------------
    ----- apparently the 'mouse-click' funtion is broken in xdotool -- as of 08/31/16 -----
    -- os.execute("xdotool search --name click_conky behave %@ mouse-click getmouselocation >> /tmp/xdo &")
    -- os.execute("xdotool search --class conky behave %@ mouse-enter getmouselocation >> /tmp/xdo &")
    os.execute("/usr/bin/xdotool search --name conky-float behave %@ mouse-enter getmouselocation >> /tmp/xdo &")

    -----  get "absolute 0" reference point for this conky window -----
    local f2 = io.popen("xwininfo -name 'conky-float' | grep 'Absolute'")
      local geometry = f2:read("*a")
    f2:close()
    local geometry = string.gsub(geometry,"[\n]","")
    s,f,abstlx = string.find(geometry,"X%p%s*(%d*)")
    s,f,abstly = string.find(geometry,"Y%p%s*(%d*)")
    -- io.write(geometry .. " \n" .. abstlx .. " " .. abstly)

  end   --- end if start = 1 ---

  ----- click calculations -----
  local f = io.open("/tmp/xdo")
    click = f:read()
  f:close()

  if click ~= nil then
    -- io.write(click,"\n")
    local f = io.open("/tmp/xdo","w")
      f:write("")
    f:close()
    s,f,mousex = string.find(click,"x%p(%d*)%s")
    s,f,mousey = string.find(click,"y%p(%d*)%s")
    local mousex = tonumber(mousex)
    local mousey = tonumber(mousey)
    localx = mousex-abstlx
    localy = mousey-abstly
   else
    -- click = "x:0 y:0 "
    click = "0"
  end

  return localx,localy

end   --- end function clickfunction ---
-- ==================================================


-- ==================================================
function conky_calendar()

  -- defined at top of script: local getMonth = os.date("%m")
  -- defined at top of script: local oldMonth = os.date("%m")
  -- defined at top of script: local getYear = tonumber(os.date("%Y"))

  if getMonth ~= oldMonth then
    oldMonth = getMonth
    local strExecute = "cal " .. getMonth .. " " .. getYear
    local f = io.popen(strExecute)
      xcal = f:read('*all')
    f:close()

    ----- as cal -h is broken in ubuntu 17.04, we have to strip out the bolding of today's date -----
    -- print( "---1--- " .. xcal )
    xcal = xcal:gsub('%_','')
    xcal = xcal:gsub('%','')
    -- print( "---2--- " .. xcal )
    -------------------------------------------------------------------------------------------------

    local toFind = "\n"
    ----- add alignr to newlines (to align to right on conky) -----
      --- we also add a space to each newline so sunday dates process correctly in 'add color' item below ---
    local toReplace = "\n${alignr} "
    xcal = xcal:gsub(toFind,toReplace)

    ----- add color around date -----
    if tonumber(getMonth) == tonumber(os.date("%m")) then
      --- the spaces below are necessary so as to exclude number(s) in year ---
      local toFind = " " .. tonumber(os.date("%d")) .. " "
      local toReplace = "${color3} " .. tonumber(os.date("%d")) .."${color1} "
      xcal = xcal:gsub(toFind,toReplace)
    end

  end

  return xcal

end
-- ==================================================


-- ==================================================
function conky_format(format, number)
  return string.format(format, conky_parse(number))
end
-- ==================================================


-- ==================================================
function conky_gauge(p_label, p_unit, p_measure, p_max, p_warn, p_alarm, p_xr, p_yc)
--[[ NOTES:
  -- "label" is the label/name for this gauge
  -- "measure" is the type of stat to display; you can choose from 'cpu', 'memperc'... in Conky you would write ${cpu cpu0}
  -- "max" is the maximum value of gauge
  -- "warn" is the value at which warn colors takes effect... must be less than "max" value
  -- "xr" & "yc" are the x/row y/col coordinates for center of gauge
  -- for colors: regular rgb color prefixed with 0x as in 0x######
--]]

  local cs = cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
  local cr = cairo_create(cs)
  cairo_surface_destroy(cs)

  --- items common to all rings ------------------
  local bg_color = 0x36556b
  local bg_alpha = 0.5
  local ok_color = 0x008600                     -- color for ok guide/arc (default green) --
  local ok_alpha = 0.5
  local alarm_color = 0xff0000                  -- color for alarm - whole gauge (default orange) ---
  local alarm_alpha = 1.0
  local warn_color = 0xcccc00                   -- color for warning guide/arc (default yellow) --
  local warn_alpha = 1.0
  local needle_color = 0xff5500                 -- color of indicator needle (default orange) ---
  local needle_alpha = 1.0
  local label_color = 0x1874cd                  -- color of label (same as "label" in conky.rc) --
  local label_alpha = 1.0
  local val_color = 0x4a708b                    -- color of current value (same as "data" in conky.rc) --
  local val_alpha = 1.0
  local bg_radius = 15                          -- gauge background starts here --
  local guide_radius = 17                       -- guide is the colored line (showing ok/warn zones) starts here --
  local val_radius = 16                         -- value indicator arc... generally between bg_radius & guide_radius --
  local needle_radius = 10                      -- bottom of needle rests here --
  local bg_width = 5                            -- width/thickness of background arc --
  local guide_width = 1                         -- width/thickness of guide arc --
  local val_width = 2                           -- width/thickness of value indicator arc --
  local warn_width = 3                          -- width/thickness of warn indicator arc (should we want it thicker for visibility --
  local needle_width = 16                       -- "length" of needle --
  local needle_thickness = .04                  -- give needle a thickness (actually width?) so it is visible --
  local start_angle = -180                      -- note: 0 is at "3 o'clock"... example: to start at top/12 o'clock use -90 --
  local end_angle = 0
  local angle_0 = (start_angle)*(math.pi/180)
  local angle_f = (end_angle)*(math.pi/180)
  local font = "Monospace"
  local font_size = 9
  local font_h = font_size                      -- normally same as font size, but adjust as needed --
  local font_w = 5                              -- adjust this for font used --
  local font_slant = CAIRO_FONT_SLANT_NORMAL    -- mono font does not have SLANT --
  local font_face = CAIRO_FONT_WEIGHT_NORMAL    -- mono font does not have BOLD  --
  cairo_select_font_face (cr, font, font_slant, font_face);
  cairo_set_font_size (cr, font_size)
  --- --------------------------------------------

  --- individual ring items ----------------------
  local label = p_label
  local unit = p_unit
  if unit == "nil" then unit = "" end
  local measure = p_measure
  local max = p_max
  local alarm = tonumber(p_alarm)
  local warn = tonumber(p_warn)
  local xr = p_xr
  local yc = p_yc

  local str = conky_parse(measure)
  local value = tonumber(str)
  local pct = value/max
  local pct_warn = warn/max
  local pct_needle = (value/max)-needle_thickness     -- we do a minus because needle starts at value & goes back amount set --

  local t_arc = pct*(angle_f-angle_0)
  local t_arc_warn = pct_warn*(angle_f-angle_0)
  local t_arc_needle = pct_needle*(angle_f-angle_0)
  -- ---------------------------------------------

  --- draw background ring ---
  cairo_arc(cr,xr,yc,bg_radius,angle_0,angle_f)
  if value < alarm then
    cairo_set_source_rgba(cr,rgb_to_r_g_b(alarm_color,alarm_alpha))
   else
    cairo_set_source_rgba(cr,rgb_to_r_g_b(bg_color,bg_alpha))
  end
  cairo_set_line_width(cr,bg_width)
  cairo_stroke(cr)

  --- draw OK area ring ---
  cairo_arc(cr,xr,yc,guide_radius,angle_0,angle_0+t_arc_warn)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(ok_color,ok_alpha))
  cairo_set_line_width(cr,guide_width)
  cairo_stroke(cr)

  --- draw warn area ring ---
  cairo_arc(cr,xr,yc,guide_radius,angle_0+t_arc_warn,angle_f)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(warn_color,warn_alpha))
  cairo_set_line_width(cr,guide_width)
  cairo_stroke(cr)

  --- draw value indicator ring ---
  cairo_set_line_width(cr,val_width)
  cairo_arc(cr,xr,yc,val_radius,angle_0,angle_0+t_arc)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(ok_color,ok_alpha))
  cairo_stroke(cr)
  if value > warn then
    cairo_set_line_width(cr,warn_width)
    cairo_arc(cr,xr,yc,val_radius,angle_0+t_arc_warn,angle_0+t_arc)
    cairo_set_source_rgba(cr,rgb_to_r_g_b(warn_color,warn_alpha))
    cairo_stroke(cr)
  end

  --- draw indicator needle ---
  cairo_arc(cr,xr,yc,needle_radius,angle_0+t_arc_needle,angle_0+t_arc)
  cairo_set_line_width(cr,needle_width)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(needle_color,needle_alpha))
  cairo_stroke(cr)

  --- display label text ---
  if value < alarm then
    cairo_set_source_rgba(cr,rgb_to_r_g_b(alarm_color,alarm_alpha))
   elseif value > warn then
    cairo_set_source_rgba(cr,rgb_to_r_g_b(warn_color,warn_alpha))
   else
    cairo_set_source_rgba(cr,rgb_to_r_g_b(label_color,label_alpha))
  end
  local text_label = label
  -- get length of string, multiply by 4 (width of mono font), and divide by 2 to get center) --
  -- note that special chars, such as ° in °F add one to length (this making it offcenter) --
  text_label_pos = (string.len(text_label) * font_w) / 2
  cairo_move_to (cr,xr-text_label_pos,yc)
  cairo_show_text (cr,text_label)
  cairo_stroke (cr)

  --- display value text ---
  if value < alarm then
    cairo_set_source_rgba(cr,rgb_to_r_g_b(alarm_color,alarm_alpha))
   elseif value > warn then
    cairo_set_source_rgba(cr,rgb_to_r_g_b(warn_color,warn_alpha))
   else
    cairo_set_source_rgba(cr,rgb_to_r_g_b(val_color,val_alpha))
  end
  local text_value = value .. unit
  text_value_pos = (string.len(text_value) * font_w) / 2
  cairo_move_to (cr,xr-text_value_pos,yc+font_h)
  cairo_show_text (cr,text_value)
  cairo_stroke (cr)

  -- use the following to test font width ---
  -- cairo_set_source_rgba(cr,rgb_to_r_g_b(warn_color,warn_alpha))
  -- cairo_move_to (cr,xr-text_value_len-1,yc+font_h)
  -- cairo_show_text (cr,".")
  -- cairo_stroke (cr)
  -- cairo_move_to (cr,xr-text_value_len-1+font_w,yc+font_h)
  -- cairo_show_text (cr,".")
  -- cairo_stroke (cr)

  cairo_destroy(cr)

return ""
end
-- ==================================================


-- ==================================================
function conky_mbps(value)
  --- .008 is factor to convert from KiB to Mbps ---
  local str1 = tonumber(string.sub(conky_parse(value), 1, string.len(conky_parse(value)))) * .00775
  -- str1 = string.format("%.3f", str1) .. " Mbs"
  return string.format("%.3f", str1)
end
-- ==================================================


-- ==================================================
function conky_maxdwn1(value)
  ----- calc/store max wlan download speed -----
  --- .008 is factor to convert from KiB to Mbps ---
  local dspd1 = tonumber(string.sub(conky_parse(value), 1, string.len(conky_parse(value)))) * .00775
  --- initialize maxdown1 to prevent errors ---
  maxdwn1 = maxdwn1 or 0
  --- reset maxdwn1 if needed because a restart of conky messes up the number ---
  if maxdwn1 > 90 then maxdwn1 = 90 end
  --- now set maxdwn1 to highest value encountered so far ---
  if maxdwn1 <= dspd1 then maxdwn1 = dspd1 end
  return string.format("%.3f", maxdwn1)
end
-- ==================================================


-- ==================================================
function conky_maxup1(value)
  ----- calc/store max wlan upload speed -----
  --- .008 is factor to convert from KiB to Mbps ---
  local uspd1 = tonumber(string.sub(conky_parse(value), 1, string.len(conky_parse(value)))) * .00775
  --- initialize maxup1 to prevent errors ---
  maxup1 = maxup1 or 0
  --- reset maxup1 if needed because a restart of conky messes up the number ---
  if maxup1 > 16 then maxup1 = 16 end
  --- now set maxup1 to highest value encountered so far ---
  if maxup1 <= uspd1 then maxup1 = uspd1 end
  return string.format("%.3f", maxup1)
end
-- ==================================================


-- ==================================================
function conky_maxdwn2(value)
  ----- calc/store max wifi download speed -----
  --- .008 is factor to convert from KiB to Mbps ---
  local dspd2 = tonumber(string.sub(conky_parse(value), 1, string.len(conky_parse(value)))) * .00775
  --- initialize maxdown1 to prevent errors ---
  maxdwn2 = maxdwn2 or 0
  --- reset maxdw21 if needed because a restart of conky messes up the number ---
  if maxdwn2 > 90 then maxdwn2 = 90 end
  --- now set maxdwn2 to highest value encountered so far ---
  if maxdwn2 <= dspd2 then maxdwn2 = dspd2 end
  return string.format("%.3f", maxdwn2)
end
-- ==================================================


-- ==================================================
function conky_maxup2(value)
  ----- calc/store max wifi upload speed -----
  --- .008 is factor to convert from KiB to Mbps ---
  local uspd2 = tonumber(string.sub(conky_parse(value), 1, string.len(conky_parse(value)))) * .00775
  --- initialize maxup2 to prevent errors ---
  maxup2=maxup2 or 0
  --- reset maxup2 if needed because a restart of conky messes up the number ---
  if maxup2 > 16 then maxup2 = 16 end
  --- now set maxup2 to highest value encountered so far ---
  if maxup2 <= uspd2 then maxup2 = uspd2 end
  return string.format("%.4f", maxup2)
end
-- ==================================================


-- ==================================================
function conky_stock(ticker, qty, buy_price)

  -- defined at top of script: table_stocks = {stocks = "Stocks Table"}
  -- defined at top of script: local stock_timer = 0

  stock_timer = stock_timer + 1

  -- note: we use a table here for 2 inter-connected reasons...
  -- 1) so the number of tickers is not limited and...
  -- 2) so we can 'time' the refresh cycle and then refresh all tickers at once (though conky displays each item every conky cycle)
  if (table_stocks[ticker] == nil or stock_timer == 60) then
    stock_timer = 1
    local strExecute = 'curl -s "http://download.finance.yahoo.com/d/quotes.csv?s={stock_item}&f=l1"'
    strExecute = strExecute:gsub('{stock_item}',ticker)
    local f = io.popen(strExecute)
      local curr_price = tonumber(f:read('*all'))
    f:close()
    local curr_value = (curr_price * qty)
    local purch_value = (qty * buy_price)
    local percent_chg = ((curr_price-buy_price)/buy_price)*100
    if percent_chg < 0 then
      xcolor = "${color8}"
     else
      xcolor = "${color7}"
    end
    table_stocks[ticker] = xcolor .. " " .. ticker .. " ${color1}$$" .. buy_price .. "/$$" .. string.format("%.2f", curr_price) .. " $$" .. string.format("%.2f", purch_value) .. "/$$" .. string.format("%.2f", curr_value) .. " " .. xcolor .. string.format("%.2f", percent_chg) .. "%"
  end

  return table_stocks[ticker]

end
-- ==================================================

function conky_test()
  local xtemp = ""
  return xtemp
end

-- ==================================================
function draw_cal_buttons(cr)

  -- defined at top of script: local getMonth = os.date("%m")
  -- defined at top of script: local getYear = tonumber(os.date("%Y"))
  -- defined at top of script: local start2 = 1

  ----------------------------
  ----- misc setup items -----

  --- for color, use conky color setup...  get rgb (from /usr/share/X11/rgb.txt) and plug in as ###/255 ---
  cairo_set_source_rgb (cr, 61/255, 66/255, 70/255)
  cairo_select_font_face (cr, "Monospace", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
  cairo_set_font_size (cr, 18)

  ----- if first pass through, do initial setup -----
  if start2 == 1 then

    start2 = nil

    getMonth = tonumber(os.date("%m"))
    getYear = tonumber(os.date("%Y"))

    ----- set buttons & locations -----
    btn1_text = "♦"                 -- go to today
    btn2_text = "◄"                 -- previous month
    btn3_text = "►"                 -- next month

    --- set button top left corner coordinates and width/height ---
    btn1_tlx = 180
    btn1_tly = 230
    btn2_tlx = 195
    btn2_tly = 230
    btn3_tlx = 335
    btn3_tly = 230

      ----- set dimensions of buttons -----
    extents = cairo_text_extents_t:create()
    cairo_text_extents(cr,btn1_text,extents)
    btn1_height = extents.height
    btn1_width = extents.width
    cairo_text_extents(cr,btn2_text,extents)
    btn2_height = extents.height
    btn2_width = extents.width
    cairo_text_extents(cr,btn3_text,extents)
    btn3_height = extents.height
    btn3_width = extents.width

  end   --- end if start == 1 ---

  ----- draw a box around item... for positioning purposes -----
  -- cairo_set_line_width (cr,1)
  -- cairo_rectangle (cr,btn2_tlx,btn2_tly,btn2_width,btn2_height)
  -- cairo_stroke (cr)

  ----- display buttons -----
  cairo_move_to (cr,btn1_tlx,btn1_tly+btn1_height)
  cairo_show_text (cr,btn1_text)

  cairo_move_to (cr,btn2_tlx,btn2_tly+btn2_height)
  cairo_show_text (cr,btn2_text)

  cairo_move_to (cr,btn3_tlx,btn3_tly+btn3_height)
  cairo_show_text (cr,btn3_text)

  -----------------------------------
  ----- get click & coordinates -----
  --- ***DO NOT EDIT THIS ITEM*** ---
  localx,localy = clickfunction()
  -----------------------------------

  ----------------------------------------------------------------------
  ----- if clicked (or entered) in conky window, process the click -----
  ----- note: 'click' is set by function clickfunction() ---------------
  if click ~= "0" then

    -- io.write("click- ",click,"\n")

    --- show that we clicked -- set on color red ---
    -- color = {1,0,0,1}
    cairo_set_source_rgb (cr, 255/255, 0/255, 0/255)

    --------------------------------------
    ----- calculate & process clicks -----

    --- btn1 - go to today ---
    if localx >= btn1_tlx and localx <= btn1_tlx+btn1_width and localy >= btn1_tly and localy <= btn1_tly+btn1_height then
      cairo_move_to (cr,btn1_tlx,btn1_tly+btn1_height)
      cairo_show_text (cr,btn1_text)
      getMonth = tonumber(os.date("%m"))
      getYear = tonumber(os.date("%Y"))
    end

    --- btn2 - go to previous month ---
    if localx >= btn2_tlx and localx <= btn2_tlx+btn2_width and localy >= btn2_tly and localy <= btn2_tly+btn2_height then
      cairo_move_to (cr,btn2_tlx,btn2_tly+btn2_height)
      cairo_show_text (cr,btn2_text)
      if getMonth > 1 then
        getMonth = getMonth - 1
       else
        getMonth = 12
        getYear = getYear - 1
      end
    end

    --- btn3 - go to next month ---
    if localx >= btn3_tlx and localx <= btn3_tlx+btn3_width and localy >= btn3_tly and localy <= btn3_tly+btn3_height then
      cairo_move_to (cr,btn3_tlx,btn3_tly+btn3_height)
      cairo_show_text (cr,btn3_text)
      if getMonth < 12 then
        getMonth = getMonth + 1
       else
        getMonth = 1
        getYear = getYear + 1
      end
    end

  end   --- end if click ~= "x:0 y:0 " ---

end   --- end function draw_cal_buttons ---
-- ==================================================


-- ==================================================
function draw_clock_hands(cr,xc,yc)

  local secs,mins,hours,secs_arc,mins_arc,hours_arc
  local xh,yh,xm,ym,xs,ys

  --- standard formula (order is important) ---
  secs = os.date("%S")
  mins = os.date("%M")
  hours = os.date("%I")

  --- standard formula (order is important) ---
  secs_arc = (2*math.pi/60)*secs
  mins_arc = (2*math.pi/60)*mins+secs_arc/60
  hours_arc = (2*math.pi/12)*hours+mins_arc/12

  --- Draw hour hand ---
  --- standard formula (0.8 = % length of hand realtive to ring radius) ---
  xh = xc+0.7*clock_r*math.sin(hours_arc)
  yh = yc-0.7*clock_r*math.cos(hours_arc)
  cairo_move_to(cr,xc,yc)
  cairo_line_to(cr,xh,yh)

  --- standard formula (adjust line_width as needed) ---
  cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
  cairo_set_line_width(cr,3)
  cairo_set_source_rgba(cr,1,1,1,1)
  cairo_stroke(cr)

  --- Draw minute hand ---
  --- standard formula (0.9 = % length of hand realtive to ring radius) ---
  xm = xc+0.9*clock_r*math.sin(mins_arc)
  ym = yc-0.9*clock_r*math.cos(mins_arc)
  cairo_move_to(cr,xc,yc)
  cairo_line_to(cr,xm,ym)

  --- standard formula (adjust line_width as needed) ---
  cairo_set_line_width(cr,2)
  cairo_stroke(cr)

  --- Draw seconds hand ---
  if show_seconds then
    --- standard formula (1.0 = % length of hand realtive to ring radius) ---
    xs = xc+1.0*clock_r*math.sin(secs_arc)
    ys = yc-1.0*clock_r*math.cos(secs_arc)
    cairo_move_to(cr,xc,yc)
    cairo_line_to(cr,xs,ys)
    --- standard formula (adjust line_width as needed) -- ---
    cairo_set_line_width(cr,1)
    cairo_stroke(cr)
  end

end   --- end function draw_clock_hands ---
-- ==================================================


-- ==================================================
function draw_ring(cr,t,pt)

  local w,h = conky_window.width,conky_window.height
  local xc,yc,ring_r,ring_w,sa,ea = pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
  local bgc, bga, fgc, fga = pt['bg_color'], pt['bg_alpha'], pt['fg_color'], pt['fg_alpha']
  local angle_0 = sa*(2*math.pi/360)-math.pi/2
  local angle_f = ea*(2*math.pi/360)-math.pi/2
  local t_arc = t*(angle_f-angle_0)

  --- Draw background ring ---
  cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
  cairo_set_line_width(cr,ring_w)
  cairo_stroke(cr)

  --- Draw indicator ring ---
  cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
  cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
  cairo_stroke(cr)

end   --- end function draw_ring ---
-- ==================================================


-- ==================================================
function rgb_to_r_g_b(color,alpha)
  return ((color / 0x10000) % 0x100) / 255., ((color / 0x100) % 0x100) / 255., (color % 0x100) / 255., alpha
end   --- end function rgb_to_r_g_b ---
-- ==================================================


-- ==================================================
function conky_init()

  if conky_window == nil then
    return
  end

  local cs = cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
  local cr = cairo_create(cs)
  cairo_surface_destroy(cs)

  local updates = conky_parse('${updates}')
  local update_num = tonumber(updates)

  ----- use if problems loading at start -----
  -- if update_num < 2 then
  --   return
  -- end

  local function setup_rings(cr,pt)
    local str = ''
    local value = 0
    str = string.format('${%s %s}',pt['name'],pt['arg'])
    str = conky_parse(str)
    value = tonumber(str)
    local pct = value/pt['max']
    draw_ring(cr,pct,pt)
  end

  --- Check that Conky has been running for at least 2s ---
  if update_num > 2 then
    for i in pairs(settings_table) do
      setup_rings(cr,settings_table[i])
    end
  end

  draw_clock_hands(cr,clock_x,clock_y)

  draw_cal_buttons(cr)

  cairo_destroy(cr)

end   --- end function conky_main ---
-- ==================================================


-- ==================================================
-- END --
