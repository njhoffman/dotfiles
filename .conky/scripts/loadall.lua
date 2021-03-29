
-- Set the path to the scripts foder
package.path = "/home/nicholas/.conky/scripts/?.lua"
-- ###################################


require 'conky-lua'
require 'rings-hdd'
require 'lua-bars'


function conky_main()
  conky_init()
  conky_main_rings()
  conky_main_bars()
end

