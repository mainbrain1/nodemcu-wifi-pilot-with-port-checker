wifi.setmode(wifi.STATION)
wifi.sta.config("siska","passssss")
wifi.sta.setip({ip="192.168.0.165", netmask="255.255.255.0", gateway="192.168.0.1"})
message=""
led={}
t={}
led["1"] = 9
led["2"] = 4
led["3"] = 2
led["4"] = 1
file.open("relay.cfg", "r")
 for i=1 , 4 do
local x=tostring(i)
local str=file.readline()
t[x]= cjson.decode(str)
gpio.mode(led[x], gpio.OUTPUT)
gpio.write(led[x], gpio.LOW);
collectgarbage()
end
file.close()
collectgarbage()
dofile('main.lua')