dofile('query.lua')
responseHeader = function(code, type)
  return "HTTP/1.1 " .. code .. "\r\nConnection: close\r\nServer: Lua\r\nContent-Type: " .. type .. "\r\n\r\n";
end
srv=net.createServer(net.TCP)
srv:listen(999,function(conn)
    conn:on("receive", function(client,request)
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
if(_GET.pin~=nil)then
 for s, h in string.gmatch(_GET.pin, "(%w+)v(%w+)") do
  if(s=="ON")then
  message="relay "..h.." is on"
  gpio.write(led[h], gpio.HIGH);
  elseif(s=="OFF")then
  message="relay "..h.." is off"
  gpio.write(led[h], gpio.LOW);
end
end
end
if(_GET.pin == "useqp" and  _GET.ip~="" and  _GET.ip~=nil and  _GET.port~="" and  _GET.port~=nil)then
  local name=_GET.name
  local ip = string.gsub(_GET.ip,"v",".")
  local port = _GET.port
  message="relay "..name.." set ip "..ip.." and port "..port.." is ok"
  elseif(_GET.pin == "useqp")then
  local name=_GET.name
  message="relay "..name.." option qp is off"
end
local name=string.sub(path, 2) 
 client:send(responseHeader("200 OK","text/html"));
 client:send(message)
 collectgarbage();
 client:close();
    end)
end)