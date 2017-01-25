function queryport(port,address,id)
srv2 = net.createConnection(net.TCP, 0)
--srv2:on("receive", function(sck, data) print("received: " .. data) end)
srv2:on("connection", function(sck)
--sck:send("foo")
  print("Host ",address," remote port ",port," is LISTEN")
  test[id]=1

  sck:close()
  collectgarbage()
end)
srv2:connect(port,address)
end

function startup()
test={}
test2={}
test["1"]=0;
test["2"]=0;
test["3"]=0;
test["4"]=0;

     for i=1 , 4 do
local m =tostring(i)
local s = t[m]
local x= s.relay
          if (s.enabled=="1")then
          queryport(s.port,s.ip,x)
	test2[x]=1
	elseif(s.enabled=="0")then
	test2[x]=0
          end
collectgarbage()
     end
file.close()
--for k, v in pairs(test) do
--print(k,v)
--end
collectgarbage()
end
startup()
dofile("query2.lua")