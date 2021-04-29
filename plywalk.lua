
walkspd=4

toplywalk=function()
  ply.bhv=plywalk
  ply.rdr=rdrplypic
  
  ply.anm=punk.wright
  ply.pic=ply.anm[animstep]
end


plywalk=function(self)
  self.pic=self.anm[animstep]
  
  
  
  if input.up==true then
    tojump()
    return
    
  end
  
  poty=self.y
  
  potx=self.x
  
  if input.left==true
  then 
    potx=potx-walkspd
    self.dir=-1
    self.flip=true
  end

  if input.right==true
  then 
    potx=potx+walkspd
    self.dir=1
    self.flip=false
  end

  if input.space==true
  then 
    fireBullet(ply.x,ply.y-tilew/2)
  end
  

  --magic boundary check
  if oneOfCornersInWall(potx,poty) ==true then
    return
  else
    self.x=potx
    self.y=poty
  
  end
  
  
  
  
--  --if both corners of ply character have nothing below, we fall
--  leftCorner=pmPixGet(screenMap,ply.x-tilew/2,ply.y+1)
--  rightCorner=pmPixGet(screenMap,ply.x+tilew/2,ply.y+1)
--  print( "lc "..leftCorner .." rc "..rightCorner)
--  if leftCorner==0 and rightCorner==0 then
--    print('to ply fall')
--    ply.bhv=plyfall
--  end

  if bottomCornersInVoid()==true then
    print('to ply fall')
    ply.bhv=plyfall
    
  end

end