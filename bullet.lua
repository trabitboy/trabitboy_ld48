--game object 

bulletanm={
    right={
      love.graphics.newImage("blt/right/1.png"),
      love.graphics.newImage("blt/right/2.png"),
      love.graphics.newImage("blt/right/3.png"),
      love.graphics.newImage("blt/right/4.png"),
      
      }
  
  }


fireBullet=function(lx,ly,lflip)
  if ply.cooldown>0 then
    return
  end 
  
  ply.cooldown=20
  b={
      x=lx,
      y=ly,
      bhv=bltUpd,
      rdr=bltRdr,
      spd=5*ply.dir,
      anm=bulletanm.right,
      pic=bulletanm.right[a4step],
      flip=ply.dir,
      type='blt'--not to collide bullets together
      
  }
  
  table.insert(gos,b)
  
end

bltRdr=function(s)
  --bullet is rendered from center ( no gravity ) 
  love.graphics.circle('fill',s.x,s.y,tilew/2)
  
  if s.flip==-1 then
      love.graphics.draw(s.pic,s.x,s.y-tilew/2,0,-1.,1.,tilew/2)
  else
    love.graphics.draw(s.pic,s.x-tilew/2,s.y-tilew/2)
  end
    
  
--  love.graphics.draw(s.pic,s.x-tilew/2,s.y-tilew/2)
end

ccoll=function(x1,y1,x2,y2,r)
  
  hyp=r*r
  
  adj=(x2-x1)*(x2-x1)
  opp=(y2-y1)*(y2-y1)
  
  if hyp>( adj+opp) then
    --coll !!!
    return true
  end
  return false
end  


bltUpd=function(s,i)
  s.pic=s.anm[a4step]
  s.x=s.x+s.spd
  
  --do I collide with map?
  ltx=math.floor(s.x/tilew)
  lty=math.floor(s.y/tilew)
  
  ltile = pmGet(screenMap,ltx,lty)
  
  if ltile== mapkeywall then
    table.remove(gos,i)
  end
  
  --do I collide with go ?
  for j,go in ipairs(gos)
  do
    
    if go.type~='blt' and go.type~='fx' and ccoll(go.x,go.y-tilew/2,s.x,s.y,tilew/2) then
      go:damage(j)
      createexplosion(s.x,s.y)
      table.remove(gos,i)
      break
      
    end
  end
end