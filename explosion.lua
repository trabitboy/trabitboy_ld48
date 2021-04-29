




explosionframes={
--	wright={
		love.graphics.newImage("explosion/1.png"),
		love.graphics.newImage("explosion/2.png"),
		love.graphics.newImage("explosion/3.png"),
		love.graphics.newImage("explosion/4.png"),
		love.graphics.newImage("explosion/5.png"),
--	},
}

--takes map coordinate
createexplosion=function(lx,ly)
  --center coords like player
  wk={
      x=lx,
      y=ly,
      rdr=rdrexplosion,
      bhv=updexplosion,
      pic=explosionframes[a5step],
      timer=30
    }
    table.insert(gos,wk)
  
end

updexplosion=function(s,li)
  print('upd explosion')
  s.pic=explosionframes[a5step]
  s.timer=s.timer-1
  if s.timer<0 then
    table.remove(gos,li)
  end
end


rdrexplosion=function(s)
  
--  love.graphics.rectangle('fill',s.x-tilew/2,s.y-tilew/2,tilew,tilew)
  love.graphics.circle('fill',s.x,s.y,tilew/2)---tilew,tilew,tilew)
 love.graphics.draw(s.pic,s.x-tilew/2,s.y-tilew/2)
 end