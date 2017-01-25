function init()
print('in startup')
dofile('config.lua')
    end
tmr.alarm(0,5000,0,init)
