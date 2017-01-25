function startup2 ()
for s=1 , 4 do
print (test2[s])
	if (test2[s]==1)then
               if (test[s]==1)then
                    gpio.write(led[s], gpio.HIGH);
               elseif(test[s]==0)then
                    gpio.write(led[s], gpio.LOW);
               end
        end
end
collectgarbage()
dofile("query.lua")
end
abort = false
tmr.alarm(0,5000,0,startup2)