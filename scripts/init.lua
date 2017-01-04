--[[
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, 
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be 
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--
-- SonOFF 01
wifi.setmode(wifi.STATION)

ledPin = 4      -- gpio 2 
relayPin = 6    -- gpio 12
Led=7           -- gpio 13
buttonPin = 3   -- gpio 0, hold down and power to enter 'flash' mode. 

gpio.mode(ledPin,gpio.OUTPUT)
gpio.mode(relayPin,gpio.OUTPUT)
gpio.mode(buttonPin, gpio.INPUT, gpio.PULLUP)
gpio.mode(Led, gpio.OUTPUT)

gpio.write(relayPin,gpio.LOW)
gpio.write(ledPin,gpio.LOW)
gpio.write(Led, gpio.LOW)

buttonDebounce = 250
-- Setup wifi and start server
tmr.alarm(1, 5000, tmr.ALARM_SINGLE, function() 
    if wifi.sta.getip() == nil then
        print("noIP")
        enduser_setup.start(
        function()
           tmr.alarm(0, 15000, tmr.ALARM_SINGLE, function() 
           print("Connected to wifi as:" .. wifi.sta.getip())
            dofile("servernode.lua")
           end)
        end,
        function(err, str)
        print("enduser_setup: Err #" .. err .. ": " .. str)
        end
        );
    end

    if wifi.sta.getip() ~= nil then
        dofile("servernode.lua")
    end
end)

-- Blink the LED when toggled
function blink()
    if (gpio.read(Led) == 1) then gpio.write(Led, gpio.HIGH) end
    gpio.write(Led, gpio.LOW)
    tmr.alarm(5, 50, 0, function() gpio.write(Led, gpio.HIGH) end)
end
-- Pin to toggle the status
buttondebounced = 0
gpio.trig(buttonPin, "down",function (level)
        if (buttondebounced == 0) then
        buttondebounced = 1
        tmr.alarm(6, buttonDebounce, 0, function() buttondebounced = 0; end)
      
        --Change the state
        if (gpio.read(relayPin) == 1) then
            gpio.write(relayPin, gpio.LOW)
            print("Turning switch OFF")
            savestate("OFF")
        else
            gpio.write(relayPin, gpio.HIGH)
            print("Turning switch ON")
            savestate("ON")
        end
    blink()
    end
end)
