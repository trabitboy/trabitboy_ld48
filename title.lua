
initTitle=function()
  updfunc=updateTitle
  drawfunc=drawTitle
  
end


drawTitle=function()
    love.graphics.setColor(1.,0.,0.,1.)
    love.graphics.print("Trabitboy LD 48",100,200,0,6,6)
    love.graphics.print("press space to shoot ",100,400,0,6,6)
    love.graphics.print("arrows to move and jump ",100,600,0,6,6)
  
end



updateTitle=function()
  
  if love.keyboard.isDown("space") then
      startGame(1)
  end
  
end
