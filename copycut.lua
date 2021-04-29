
--function tablelength(T)
--  local count = 0
--  for _ in pairs(T) do count = count + 1 end
--  return count
--end


cutw=64

zznprj="adeeper/"

--love.graphics.load()

zznpunkcoords={x=1,y=0}
zznpunkwalkframes={"004","005","006"}

zznbdwalkcoords={x=2,y=0}
zznbdwalkframes={"003","004","005","004"}

zzndblockcoords={x=4,y=0}
zzndblockframes={"003"}

zznwallcoords={x=4,y=1}
zznwallframes={"003"}


zznbltcoords={x=5,y=0}
zznbltframes={"002","003","004","005",}

zznexpcoords={x=3,y=0}
zznexpframes={"002","003","004","005","006"}


cutPackage=function(frames,coords,tgtfld)
  love.filesystem.createDirectory(tgtfld)
  for i,f in ipairs(frames)
  do
    ld=love.image.newImageData(zznprj..f..".png")
    
    tosave=love.image.newImageData(cutw,cutw)
    
    tosave:paste(ld,0,0,coords.x*64,coords.y*64,cutw,cutw)
    
    tosave:encode("png",tgtfld..i..".png")
  end
  
end

cutPackage=function(frames,coords,tgtfld)
  love.filesystem.createDirectory(tgtfld)
  for i,f in ipairs(frames)
  do
    ld=love.image.newImageData(zznprj..f..".png")
    
    tosave=love.image.newImageData(cutw,cutw)
    
    tosave:paste(ld,0,0,coords.x*64,coords.y*64,cutw,cutw)
    
    tosave:encode("png",tgtfld..i..".png")
  end
  
end




--cutPackage(zznpunkwalkframes,zznpunkcoords,"punk/walk/")

--cutPackage(zznbdwalkframes,zznbdwalkcoords,"bdwalk/walk/")

--cutPackage(zzndblockframes,zzndblockcoords,"dblock/still/")

--cutPackage(zznbltframes,zznbltcoords,"blt/right/")

--cutPackage(zznwallframes,zznwallcoords,"wall/still/")


cutPackage(zznexpframes,zznexpcoords,"explosion/")
