max_ani_timer = 20
ani_timer = 0

run_x = -1
run_y = -1
is_running = false
can_mine = true

spd = random_range(0,Obj_cursor.human_max_speed)

vision = 32
converter = noone

has_weapon = 0
var xx = irandom_range(-16,16)
var yy = irandom_range(-16,16)
if (collision_rectangle(bbox_left+xx,bbox_top+yy,bbox_right+xx,bbox_bottom+yy,Obj_wall,false,true)) {
	xx = irandom_range(-4,4)
	yy = irandom_range(-4,4)
} else {
	x += xx
	y += yy
}