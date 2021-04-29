

--ply state,

local maxspd=-5
local dec=0.1

tojump=function()
  ply.jspeed=7
  ply.bhv=plyjump
end



plyjump=function(self)
--  print(self.x,self.y)
  poty=self.y-math.floor(self.jspeed)
  potx=self.x
  
  self.jspeed=self.jspeed-dec
  
  if self.jspeed<=0 then
      self.bhv=plyfall
      return
      
  end
  
  
  --first we move y, if we end up in wall we fall
  if oneOfCornersInWall(potx,poty) ==true then
    self.bhv=plyfall
    return
  end
  --if we are so far y move is ok
  self.y=poty
  
  if input.left==true
  then 
    
    potx=potx-self.jspeed
  end
  
  if input.right==true
  then 
    potx=potx+self.jspeed
  end

  if oneOfCornersInWall(potx,poty) ==true then
    --lateral impossible
    return
  end
  
  self.x=potx
  
end

