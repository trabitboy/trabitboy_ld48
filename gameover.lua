
initGameOver=function()
  updfunc=updateGameOver
  drawfunc=drawGameOver
  gotimer=600
end


drawGameOver=function()
    love.graphics.setColor(1.,0.,0.,gotimer/600)
    love.graphics.print("Game over "..gotimer ,20,200,0,6,6)
--    love.graphics.setColor(1.,0.,0.,1.-gotimer/600)
    love.graphics.draw(skullbg[1])
end



updateGameOver=function()
  gotimer=gotimer-3
  
  if gotimer<=200 then
    
  
--  if love.keyboard.isDown("space") then
      initTitle()
  end
  
end
