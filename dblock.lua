--nb in loaded map
mapkeydb=3

dblockframes={
    still={
        love.graphics.newImage("dblock/still/1.png")
      }
  
  }

dblockdmg=function(s,j)
  s.hp=s.hp-1
  if s.hp<=0 then 
    table.remove(gos,j)
    pmSet(screenMap,s.tx,s.ty,0)
  end
  
end

  --takes map coordinate
createdblock=function(ltx,lty)
  --center coords like player
  db={
      tx=ltx, -- we store it to make it explode and update map
      ty=lty,
      x=ltx*tilew+tilew/2,
      y=(lty+1)*tilew-1,
      rdr=rdrdblock,
      bhv=upddblock,
      pic=dblockframes.still[1],
      damage=dblockdmg,
      hp=3
    }
    table.insert(gos,db)
  
end



upddblock=function(s)
  print('upd dblock')
end


rdrdblock=function(s)
  
  love.graphics.rectangle('fill',s.x-tilew/2,s.y-tilew,tilew,tilew)
  love.graphics.draw(s.pic,s.x-tilew/2,s.y-tilew)
  
end
