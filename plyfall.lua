

--ply state,
--ply is mapw h and w
--it falls until pixel below is in a map area not empty

local fspd=5

toplyfall=function()
  ply.bhv=plyfall
--  ply.rdr=rdrplypic
--  ply.pic=punk
end



plyfall=function(self)
--  print(self.x,self.y)
  poty=self.y+fspd
  potx=self.x
  
  

  
--  tn=pmPixGet(screenMap,potx,poty)
  
--  print('fall x '.. self.x..' y '..poty)
--  if tn~=nil then
--  print('tn '..tn)
--  end
--  --if poty mapw hard, we stop go to walk state
--  if tn==1 then
    
--    --COULD BE CHANGED > damage area, list of tiles overlaped
--    ply.bhv=plywalk
--    return--should be state transition
--  else
    
----    self.x=potx
--    self.y=poty
--  end
  
  --trying to simplify with corner check
  if oneOfCornersInWall(potx,poty) ==true then
    --we need to position the hot point just above ground
    tmpty = math.floor( self.y/tilew) +1-- this is the y coord of the tile below
    --we put the y one pixel above the tile below
    self.y = tmpty*tilew-1
--    ply.bhv=plywalk
    toplywalk()
    return--should be state transition
  else
    
--    self.x=potx
    self.y=poty
  end
    
  
  
  --we did y now x with boundary check
  
  
    --TODO boundary check here
  if input.left==true
  then 
    potx=potx-fspd
  end
  
  if input.right==true
  then 
    potx=potx+fspd
  end

  if oneOfCornersInWall(potx,poty) ==true then
    return
  else
    self.x=potx
  
  end
  
end

