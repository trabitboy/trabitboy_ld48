--common collision functions for ply

rdrplypic=function(s)
    love.graphics.rectangle("fill",s.x-tilew/2,s.y-tilew,tilew,tilew)
    --manually adjusted x, wish me luck
  if s.flip==true then
      love.graphics.draw(s.pic,s.x,s.y-tilew,0,-1.,1.,tilew/2)
  else
    love.graphics.draw(s.pic,s.x-tilew/2,s.y-tilew)
  end
  
end


bottomCornersInVoid=function()
  
  --if both corners of ply character have nothing below, we fall
  leftCorner=pmPixGet(screenMap,ply.x-ptw/2,ply.y+1)
  rightCorner=pmPixGet(screenMap,ply.x+ptw/2,ply.y+1)
  print( "lc "..leftCorner .." rc "..rightCorner)
--  if leftCorner~=mapkeywall and rightCorner~=mapkeywall then
  if  not isTileWall(leftCorner)and not isTileWall( rightCorner) then
    return true
  end

  return false
end



--if one of the corners in wall, move should be reverted
oneOfCornersInWall=function(potx,poty)
  
  --if both corners of ply character have nothing below, we fall
  leftCorner=pmPixGet(screenMap,potx-ptw/2,poty)
  rightCorner=pmPixGet(screenMap,potx+ptw/2,poty)
  uleftCorner=pmPixGet(screenMap,potx-ptw/2,poty-ptw)
  urightCorner=pmPixGet(screenMap,potx+ptw/2,poty-ptw)
  
  print( "lc "..leftCorner .." rc "..rightCorner .. "ulc "..uleftCorner .." urc "..urightCorner)
  
  if isTileWall(leftCorner)or isTileWall(rightCorner) or isTileWall(uleftCorner) or isTileWall(urightCorner) then
    return true
  end

  return false
  
  
  
end

