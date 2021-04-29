--utils to debug ply bhv

plyrdrsquare=function(self)
  love.graphics.setColor(1.,1.,1.,1.)
  love.graphics.rectangle('fill',self.x-tilew/2,self.y-tilew,tilew,tilew)
--  love.graphics.print('cpt '..ply.contactPointTile,50,50)
  love.graphics.setColor(1.,1.,1.,1.)
  love.graphics.line(ply.x-tilew/2,ply.y,ply.x+tilew/2,ply.y)
  love.graphics.line(ply.x,ply.y-tilew/2,ply.x,ply.y+tilew/2)
end