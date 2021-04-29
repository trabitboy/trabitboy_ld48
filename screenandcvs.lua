cvsw=1080 
cvsh=1080

 ww=700
 wh=700
 love.window.setMode(ww,wh,{resizable=true})
 
	cvs=love.graphics.newCanvas(cvsw,cvsh)
 
 --must match width and height of pic
--mapw=33
--maph=33
mapw=16
maph=16

--can be used to force zoom
-- tilew=cvsw/mapw
 tilew=64
 
 --ply tile width for coll, smaller to fit in labyrinth
 ptw=48
 
 love.window.setTitle("deeper deeper")
 
 wzoom=ww/cvsw
 
 --this is where the current frame is drawn
 


