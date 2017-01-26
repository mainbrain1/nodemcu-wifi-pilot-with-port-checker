function startup2 ()
for s=1 , 4 do
print (test2[s])
local x=tostring(s)
	if (test2[x]==1)then
               if (test[x]==1)then
                    gpio.write(led[x], gpio.HIGH);
               elseif(test[x]==0)then
                    gpio.write(led[x], gpio.LOW);
               end
        end
end
collectgarbage()
dofile("query.lua")
end
abort = false
tmr.alarm(0,5000,0,startup2)