
wallpic=love.graphics.newImage("wall/still/1.png")

mapkeywall=1

walls={
mapkeywall,
mapkeydb
}
--there is wall and collapsible wall, necessity to compare with list of indexes
isTileWall=function(tnum)
  for k,w in ipairs(walls) 
  do 
    if w==tnum then
      return true
    end
  end
  return false
end

--translates r g b to meaningful map value
-- 0= nothing
-- 1= undestructible wall
local translateColor=function(pic,x,y)
  r,g,b,a=pic:getPixel(x,y)
  if r ==0. and g==0. and b==0. and a==1. then
    return mapkeywall
  elseif r ==1. and g==0. and b==0. and a==1. then
    return mapkeywk
  elseif r ==1. and g==1. and b==0. and a==1. then
    return mapkeydb
  else
    return 0
  end
end


initMap=function(fileName)
  pic=love.image.newImageData(fileName)

  iw=pic:getWidth()
  ih=pic:getHeight()

  ret={}
  line=''
  for j=0,ih-1
  do
      print(line..'/n')
      line=''
      for i=0,iw-1
      do
        lval = translateColor(pic,i,j)
        line=line..lval
--        print(' '..lval)
        table.insert(ret,lval)
      end
   end
   return ret
end

--returns tile value at screen coord (pixels )
pmPixGet=function(pm,x,y)
  tx=math.floor(x/tilew)
  ty=math.floor(y/tilew)
--  print('pm pix get '..tx..' '..ty)
  return pmGet(pm,tx,ty)
end

pmSet=function(pm,tx,ty,tnum)
  index=tx+ty*mapw+1
  pm[index]=tnum

end

--returns tile value at map coords
pmGet=function(pm,tx,ty)
  --lua table starts at 1
  index=tx+ty*mapw+1
  return pm[index]
  
end

pmDP = function(pm)
  for j=0,mapw-1
  do
    for i=0,mapw-1
    do
      print(' '..pmGet(pm,i,j))
      
    end
  end
end

--dbg blit (squares )
pmDB=function(pm)
  
  for j=0,mapw-1
  do
    
    for i=0,mapw-1
    do
      lval=pmGet(pm,i,j)
      if lval==1 then
        love.graphics.setColor(1.,0.,0.,1.)
        love.graphics.rectangle('fill',i*tilew,j*tilew,tilew,tilew)
--        love.graphics.draw(dblockframes.still[1],i*tilew,j*tilew)
        love.graphics.draw(wallpic,i*tilew,j*tilew)
      end
    end
  end
  
  
end