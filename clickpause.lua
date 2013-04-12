--[[
"clickpause.lua" is VLC 2.0.x Extension script
Click screen to toggle play/pause
--]]

--[[
This software is licensed under ther terms of The MIT License (MIT)
Copyright (c) 2013 meredi, 3demax

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

DEBUG = false

function descriptor()
   return {
     title = "Click screen to Play/Pause";
     capabilities = { "input-listener" };
   }
end

function d_log(...)
  local out = ""
  if not DEBUG then
    return
  end
  for i,v in ipairs(arg) do
    out = out .. " " .. v
  end
  vlc.msg.info(out)
end

function activate()
   if vlc.object.input() then
    vlc.var.add_callback( vlc.object.vout(), "mouse-button-down", mouse_press)
    no_input = false
  else
    no_input = true
  end
end

function deactivate()
  if vlc.object.input() then
    pcall(vlc.var.del_callback, vlc.object.vout(), "mouse-button-down", mouse_press)
  end
end

function mouse_press( var, old, new, data )
   d_log("[Click screen to PAUSE / PLAY] var: "..tostring(var).." / old: "..tostring(old).." / new: "..tostring(new))
   if old==0 and new==1 then vlc.playlist.pause() end
end

function input_changed()
  no_input = not not vlc.object.input()
  d_log("input changed", "no_input " .. tostring(no_input))
end

function meta_changed()
    d_log("meta changed " .. " no_input "  .. tostring(no_input) .. " input " .. tostring(not not vlc.object.input()))
    if no_input and not not vlc.object.input() then
      pcall(vlc.var.del_callback, vlc.object.vout(), "mouse-button-down", mouse_press)
      vlc.var.add_callback( vlc.object.vout(), "mouse-button-down", mouse_press)
    end
    no_input = false
end

