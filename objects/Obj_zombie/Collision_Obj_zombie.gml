var xx = sign(x-other.x+0.5*depth/room_height)
var yy = sign(y-other.y+0.5*depth/room_height)
if (!collision_rectangle(bbox_left+xx,bbox_top,bbox_right+xx,bbox_bottom,Obj_wall,false,true)) {x += xx}
if (!collision_rectangle(bbox_left,bbox_top+yy,bbox_right,bbox_bottom+yy,Obj_wall,false,true)) {y += yy}