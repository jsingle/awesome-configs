local setmetatable = setmetatable
local io = io
local ipairs = ipairs
local table = table
local loadstring = loadstring
local button = require("awful.button")
local beautiful = require("beautiful")
local widget2 = require("awful.widget")
local naughty = require("naughty")
local vicious = require("vicious")
local tag = require("awful.tag")
local print = print
local util = require("awful.util")
local shifty = require("shifty")
local menu = require("awful.menu")
local capi = { image = image,
               screen = screen,
               widget = widget,
               mouse = mouse,
	       tag = tag}

module("customMenu.application")

local data = {}

function update()

end

function new(screen, args) 
  local f = io.open(util.getdir("config") .. "/menu.lua",'r')
  local text3 = f:read("*all")
  f:close()
  local afunction = loadstring(text3)
  local myMenu = afunction()

  local mylauncher = widget2.launcher({ image = capi.image(beautiful.awesome_icon),
                                     menu = myMenu })
  local mylaunchertext = capi.widget({ type = "textbox" })
  mylaunchertext.text = " Apps  "
  
  return {menu = mylauncher, text = mylaunchertext}
end


setmetatable(_M, { __call = function(_, ...) return new(...) end })