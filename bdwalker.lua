
--nb in loaded map
mapkeywk=2

bdspeed=3


bdwdmg=function(s,j)
  s.hp=s.hp-1
  if s.hp<=0 then 
    table.remove(gos,j)
  end
  
end


walkerframes={
	wright={
		love.graphics.newImage("bdwalk/walk/1.png"),
		love.graphics.newImage("bdwalk/walk/2.png"),
		love.graphics.newImage("bdwalk/walk/3.png"),
		love.graphics.newImage("bdwalk/walk/4.png"),
	},
}

--takes map coordinate
createwalker=function(tx,ty)
  --center coords like player
  wk={
      x=tx*tilew+tilew/2,
      y=(ty+1)*tilew-1,
      rdr=rdrwalker,
      bhv=updwalker,
      dir=1,
      pic=walkerframes.wright[a4step],
      damage=bdwdmg,
      hp=3
    }
    table.insert(gos,wk)
  
end

updwalker=function(s)
  print('upd walker')
  s.pic=walkerframes.wright[a4step]
  potx=s.x+s.dir
  --if we go in a wall, we turn
  if oneOfCornersInWall(potx,s.y)== true then
    
    s.dir=-s.dir
    return
  end
  
  --is middle point is in the void, we turn
  if pmPixGet(screenMap,potx,s.y+1)==0 then
    s.dir=-s.dir
    return
  end
  
  s.x=potx
  
  --if ply coll , we explode him
  if ccoll(s.x,s.y,ply.x,ply.y,tilew) then
--    initTitle()
    initGameOver()
  end
  
end


rdrwalker=function(s)
  
  love.graphics.rectangle('fill',s.x-tilew/2,s.y-tilew,tilew,tilew)
 love.graphics.draw(s.pic,s.x-tilew/2,s.y-tilew)
 end