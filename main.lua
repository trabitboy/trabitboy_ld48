--TODO jump leaves a bit of pixel below player if fall speed >1, put it properly on ground
-- bd can't turn ( check corner triggers always )
--TODO player needs a slightly smaller box to go through map

--uncomment to cut and copy sprites
--require('copycut')
--love.event.quit()


require('victory')
require('gameover')
require('levels')
require('title')
require('punk')
require('screenandcvs')
require('dblock')
require('bdwalker')
require('pixmap')
require('explosion')
require('bullet')
require('plydbg')
require('plycommon')
require('plyjump')
require('plywalk')
require('plyfall')
require('game')

initTitle()
--startGame(1)

love.draw=function()
  love.graphics.setCanvas(cvs)
  love.graphics.clear()
--  drawGame()
  drawfunc()
  love.graphics.setCanvas()
  love.graphics.draw(cvs,0,0,0,wzoom,wzoom)
end

input={
    left=false,
    right=false,
    space=false,
    up=false
  }

love.update=function()
  
  if love.keyboard.isDown('space') then
    input.space=true
  else
    input.space=false
  end

  if love.keyboard.isDown('up') then
    input.up=true
  else
    input.up=false
  end

  
  if love.keyboard.isDown('left') then
    input.left=true
  else
    input.left=false
  end
  
  if love.keyboard.isDown('right') then
    input.right=true
  else
    input.right=false
  end
  
  updfunc()
--  updateGame()
  
end