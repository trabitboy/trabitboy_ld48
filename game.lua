
animclk=0
animstep=1
a4step=1
a5step=1
animchge=10

skullbg={
    love.graphics.newImage("adeeper/012.png"),
    love.graphics.newImage("adeeper/013.png"),
    love.graphics.newImage("adeeper/014.png"),
  
  }


function tickanimstep()
 animclk=animclk+1

 if animclk>animchge then 
	animclk=0
	animstep=animstep+1
	if animstep>3 then
	 animstep=1
	end
	a4step=a4step+1
	if a4step>4 then
	 a4step=1
	end
	a5step=a5step+1
	if a5step>5 then
	 a5step=1
	end

 end 
end



initPly=function()
  ply={
    x=8*tilew, --bottom center of tile
    y=tilew, --bottom center of tile
    bhv=plyfall,
    rdr=plyrdrsquare,
    dir=1,
    jspeed=0,-- to track state of jump
    pic=nil, --is upd by game states
    flip=false, --to flip disp pic
    cooldown=0
    --debug data
--    contactPointTile=5
    }
end


createBdsFromMap=function()
  for j=0,mapw-1
  do
    
    for i=0,mapw-1
    do
      lval=pmGet(screenMap,i,j)
      if lval==mapkeywk then
          print("wk detected")
          createwalker(i,j)
      elseif lval==mapkeydb then
          createdblock(i,j)
          
          
      end
    end
  end
  
end

startGame=function(tlvl)
  
  updfunc=updateGame
  drawfunc=drawGame
  
--  screenMap=initMap('testmap.png')
  numlvl=tlvl
  screenMap=initMap(levels[numlvl])

--  screenMap=initMap('test1616.png')
  
  gos={}
  createBdsFromMap()
  
  initPly()
  

  pmDP(screenMap)

  bgPic=skullbg[animstep]

end

drawGame=function()
  love.graphics.clear(0.5,0.5,0.5)
  love.graphics.print('deeper deeper')
  love.graphics.setColor(1.0,1.,1.,0.3)
  love.graphics.draw(bgPic)
  love.graphics.setColor(1.0,1.,1.,1.)
  
  love.graphics.circle('fill',0,0,100)
  love.graphics.circle('fill',1080,1080,100)
  pmDB(screenMap)
  ply:rdr()
    for i,o in ipairs(gos)
    do
      o:rdr()
      
    end
end


checkNextLvl=function()
  if math.floor(ply.y/tilew)>=mapw-1 then
    nextLvlOrVictory()
  end
end

nextLvlOrVictory=function()
  --TODO
  numlvl=numlvl+1
  if levels[numlvl]~=nil then
    startGame(numlvl)
  else
    initVictory()
  end
end

updateGame=function()
  
  checkNextLvl()
  
  tickanimstep()
  
  bgPic=skullbg[animstep]
  
  if ply.cooldown>0 then ply.cooldown=ply.cooldown-1 end
    --mvply
--    ply.contactPointTile=pmPixGet(screenMap,ply.x,ply.y)
    
    
    
    
    ply:bhv()
  
    for i,o in ipairs(gos)
    do
      o:bhv(i)
      
    end
  
end