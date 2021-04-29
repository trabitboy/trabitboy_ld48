
initVictory=function()
  updfunc=updateVictory
  drawfunc=drawVictory
  
  vtimer = 600
end


drawVictory=function()
  
    love.graphics.print("No Victory in the deep",20,200,0,6,6)
    love.graphics.print(" LD 48 IS HELL ",200,400,0,6,6)
  
end



updateVictory=function()
  
  vtimer=vtimer-1
  if vtimer<=0 then
    initTitle()
  end
end
