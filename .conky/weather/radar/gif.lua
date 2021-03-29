--[[
Script gif.lua
By mrpeachy
Modified on 22/03/2014 by Didier-T
supports full directory content with choice of format (jpg, gif, etc...)
supports shortcuts ~ and $HOME as well as spaces in the directory pathname

#############################################################################################
#                                                                                           #
#                                           Use                                           #
#                                                                                           #
#############################################################################################
#                                                                                           #
# lua_load ~/gif.lua                                                                        #
# TEXT                                                                                      #
# ${lua gif folder format pos_x pos_y width height}                                  #
#                                                                                           #
#############################################################################################
replace spaces in the folder pathname by %20

]]--
--gifsicle --unoptimize --explode /home/wayfarer/.conky/Conky-FULL/radar/regional.gif --output /home/wayfarer/.conky/Conky-FULL/radar/reg.gif
require 'cairo'
require 'imlib2'
ini=0
count=0
fichier={}
function conky_gif(rep,ext,x,y,w,h)
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr = cairo_create(cs)

    if ini==0 then fichier=init(rep, ext) end

    show_image=fichier[count]

    if count<table.getn(fichier) then
        count=count+1
    else
        count=0
    end
    image({x=x,y=y,w=w,h=h,file=show_image,decache=1})
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr=nil
    return ""
end-- end main function

function init(rep, ext)
    ini=1
    local home = os.getenv("HOME")
    rep = string.gsub(rep, "~", home)
    rep = string.gsub(rep, "$HOME", home)
    rep=string.gsub(rep, '%%20', "\\ ")
    local file=conky_parse("${exec find "..rep.."/*."..ext.." -type f -print}")
    return file:split('\n')
end

-- Self-made splitting function (by Didier-T)
function string:split(pat)
    -- Determining the separator
    -- default : space
    pat = pat or '%s+'
    local tab = {}
    local x=0
    for i in self:gmatch("([^"..pat.."]+)") do
        tab[x]=i
        x=x+1
    end
    return tab
end

function image(im)--#######################################################################################
    local x=(im.x or 0)
    local y=(im.y or 0)
    local w=(im.w or 50)
    local h=(im.h or 50)
    local file=tostring(im.file)
    local decache=im.decache or 0
    if file==nil then print("set image file") end
    ---------------------------------------------
    local show = imlib_load_image(file)
    if show == nil then return end
    imlib_context_set_image(show)
    if tonumber(w)==0 then
        width=imlib_image_get_width()
    else
        width=tonumber(w)
    end
    if tonumber(h)==0 then
        height=imlib_image_get_height()
    else
        height=tonumber(h)
    end
    imlib_context_set_image(show)
    local scaled=imlib_create_cropped_scaled_image(0, 0, imlib_image_get_width(), imlib_image_get_height(), width, height)
    if decache==1 then
        imlib_free_image_and_decache()
    else
        imlib_free_image()
    end
    imlib_context_set_image(scaled)
    imlib_render_image_on_drawable(x,y)
    imlib_free_image()
end--function image
